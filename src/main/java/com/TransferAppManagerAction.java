package com;

import com.core.util.StringUtils;
import com.hibtest1.entity.*;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2015/12/26.
 */
public class TransferAppManagerAction extends ActionSupport implements RequestAware, SessionAware {
    StorageBiz storageBiz;
    GoodsBiz goodsBiz;
    PlaceBiz placeBiz;
    ProducerBiz producerBiz;
    DeliverBiz deliverBiz;
    Map<String, Object> session;
    TransferAppBiz transferAppBiz;
    Map<String, Object> request;

    TransferApp transferApp;

    public TransferApp getTransferApp() {
        return transferApp;
    }

    public void setTransferApp(TransferApp transferApp) {
        this.transferApp = transferApp;
    }

    public Map<String, Object> getRequest() {
        return request;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public void setStorageBiz(StorageBiz storageBiz) {
        this.storageBiz = storageBiz;
    }

    public void setGoodsBiz(GoodsBiz goodsBiz) {
        this.goodsBiz = goodsBiz;
    }

    public void setPlaceBiz(PlaceBiz placebiz) {
        this.placeBiz = placebiz;
    }

    public void setProducerBiz(ProducerBiz producerBiz) {
        this.producerBiz = producerBiz;
    }

    public void setDeliverBiz(DeliverBiz deliverBiz) {
        this.deliverBiz = deliverBiz;
    }

    public void setTransferAppBiz(TransferAppBiz transferAppBiz) {
        this.transferAppBiz = transferAppBiz;
    }

    String producerName;
    Integer goodsId;
    String placeName;
    String goodsName;

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String listTransferApp() {               //得到所有转库申请单
        List transferApp = transferAppBiz.getAllTransferApp();
        session.put("transferapplistall", transferApp);

        return "transferApp";
    }

    public String checkTransferApp() {               //得到所需审核的单子！
        TransferApp condition = new TransferApp();
        condition.setState("no");
        List<TransferApp> transferApp = transferAppBiz.getTransferAppList(condition);
        session.put("transferapplischeck", transferApp);
        return "transferAppCheck";
    }

    public String checkTransferAppSelect() { //得到查询的信息来审核 与search一样
        TransferApp condition = new TransferApp();
        if (StringUtils.isEmpty(goodsName)) {
            String[] strs = goodsName.split("\\|");      //增加goods
            Integer id = Integer.parseInt(strs[1]);  //id
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = goodsBiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        condition.setState("no");
        List list = transferAppBiz.getTransferAppList(condition);
        session.put("transferapplischeck", list);
        return "success";
    }

    public String addTransferApp() throws Exception {                  //增加转库申请
        TransferApp condition = new TransferApp();
        if (transferApp.getTransferNumber() != null)               //转库数量
            condition.setTransferNumber(transferApp.getTransferNumber());
        if (transferApp.getTypeOut() != null)          //转库类型  原先
            condition.setTypeOut(transferApp.getTypeOut());
        if (transferApp.getTypeIn() != null)          //转库类型  目标
            condition.setTypeIn(transferApp.getTypeIn());
        if (transferApp.getExpectDate() != null) { //期望日期
            condition.setExpectDate(transferApp.getExpectDate());
        }
        condition.setState("no");  //处理状态新增默认为no 待审核
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        condition.setApplicationDate(date);   //填写时间
        System.out.println("当前时间" + date);
        if (goodsId != null) {
            Goods g = new Goods();
            g.setGoodsId(goodsId);
            Goods goods = (Goods) goodsBiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        if (producerName != null) {
            Producer producer = producerBiz.getProducer(producerName).get(0);       //增加商户
            condition.setProducer(producer);
        }
        if (placeName != null) {
            Place place = placeBiz.getPlace(placeName).get(0);
            condition.setPlace(place);
        }
        if (session.get("name") != null)   //得到增加人
            condition.setAdduser(session.get("name").toString());
        transferAppBiz.add(condition);
        session.put("transferapplist", condition);  //两个地方用到，edit不知道会不会有问题
        return "success";
    }

    public String editTransferApp() {
        TransferApp s = new TransferApp();
        s.setTransferAppId(transferApp.getTransferAppId());
        TransferApp condition = (TransferApp) transferAppBiz.getTransferAppList(s).get(0);
        if (transferApp.getTransferNumber() != null && !transferApp.getTransferNumber().equals(""))               //转库数量
            condition.setTransferNumber(transferApp.getTransferNumber());
        if (transferApp.getTypeIn() != null && !transferApp.getTypeIn().equals(""))          //转库类型目标
            condition.setTypeIn(transferApp.getTypeIn());
        if (transferApp.getExpectDate() != null && !transferApp.getExpectDate().equals("")) { //期望日期
            condition.setExpectDate(transferApp.getExpectDate());
        }
        if (session.get("name") != null) {
            condition.setEdituser(session.get("name").toString()); //得到修改人
        }
        if (transferAppBiz.editTransferApp(condition)) {
            session.put("transferapplist", condition);
            return "success";
        } else return "input";
    }

    public String searchTransferAppList() {         //查询
        TransferApp condition = new TransferApp();
        if (StringUtils.isEmpty(goodsName)) {
            String[] strs = goodsName.split("\\|");      //前台已排除非法输入 这里不用加id 增加goods
            Integer id = Integer.parseInt(strs[1]);  //id
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = goodsBiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        List list = transferAppBiz.getTransferAppList(condition);
        session.put("transferapplist", list);
        return "success";

    }

    public String transferAppOk() {
        TransferApp condition = new TransferApp();
        condition.setTransferAppId(transferApp.getTransferAppId());
        List list = transferAppBiz.getTransferAppList(condition);
        TransferApp transferApp = (TransferApp) list.get(0);
        transferApp.setState("yesok");     //更改状态yesok
        Calendar calendar = Calendar.getInstance();   //更改审核时间
        Date date = calendar.getTime();
        transferApp.setAuditTime(date);
        if (session.get("name") != null) {
            transferApp.setCheckuser(session.get("name").toString()); //得到审核人
        }
        transferAppBiz.editTransferApp(transferApp);
        Storage storage = new Storage();           //新建入库明细表
        Deliver deliver = new Deliver(); // 新建出库明细
        Goods goods = goodsBiz.getGoodsList(transferApp.getGoods()).get(0);
        storage.setGoods(goods);
        deliver.setGoods(goods);
        Producer producer = producerBiz.getProducerList(transferApp.getProducer()).get(0);
        storage.setProducer(producer);
        deliver.setProducer(producer);
        Place place = placeBiz.getPlaceList(transferApp.getPlace()).get(0);
        storage.setPlace(place);
        deliver.setPlace(place);
        if (transferApp.getExpectDate() != null && !transferApp.getExpectDate().equals("")) {                   //期望转库时间
            storage.setExpectedDate(transferApp.getExpectDate());
            deliver.setExpecteDate(transferApp.getExpectDate());
            storage.setStorageDate(transferApp.getExpectDate());
            deliver.setDeliverDate(transferApp.getExpectDate());
        }
        if (transferApp.getTypeIn() != null && !transferApp.getTypeIn().equals("")) {  //入库类型
            storage.setStorageType(transferApp.getTypeIn());
        }
        if (transferApp.getTypeOut() != null && !transferApp.getTypeOut().equals("")) {  //出库类型
            deliver.setDeliverType(transferApp.getTypeOut());
        }
        if (transferApp.getAdduser() != null && !transferApp.getAdduser().equals("")) {//转库申请人加入到入库明细中
            storage.setAdduser(transferApp.getAdduser());  //申请人
            deliver.setAdduser(transferApp.getAdduser());
        }
        if (transferApp.getTransferNumber() != null && !transferApp.getTransferNumber().equals("")) {
            storage.setExpectedNumber(transferApp.getTransferNumber());  //预期转库数
            deliver.setExpecteNumber(transferApp.getTransferNumber());
            storage.setStorageNumber(transferApp.getTransferNumber());
            deliver.setDeliverNumber(transferApp.getTransferNumber());  //直接实际出入库了
        }
        storage.setOver(1);//不存在多次确认，直接完结，确认state=no就行
        storage.setCategory("正常转库");
        deliver.setCategory("正常转库");
        storage.setState("ok");
        deliver.setState("ok");
        storageBiz.add(storage);
        deliverBiz.add(deliver);
        return "success";
    }


}

