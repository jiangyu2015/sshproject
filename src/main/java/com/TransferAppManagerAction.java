package com;

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
public class TransferAppManagerAction  extends ActionSupport implements RequestAware, SessionAware {
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

    public String listTransferApp() {               //得到所有转库申请单
        List transferApp = transferAppBiz.getAllTransferApp();
        session.put("transferapplistall", transferApp);

        return "transferApp";
    }

    public String checkTransferApp() {               //得到所需审核的单子！为了保存
        TransferApp condition=new TransferApp();
        condition.setState("no");
        List<TransferApp> transferApp = transferAppBiz.getTransferAppList(condition);
        session.put("transferapplischeck", transferApp);
        return "transferAppCheck";

    }

    public String addTransferApp() throws Exception {                  //增加转库申请
        System.out.println("addTransferApp");
        TransferApp condition = new TransferApp();
        if (transferApp.getTransferNumber() != null)               //转库数量
            condition.setTransferNumber(transferApp.getTransferNumber());
        if (transferApp.getTypeOut() != null)          //转库类型  原先
            condition.setTypeOut(transferApp.getTypeOut());
        if (transferApp.getTypeIn() != null)          //转库类型  目标
            condition.setTypeIn(transferApp.getTypeIn());
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
        TransferApp condition = new TransferApp();
        condition = (TransferApp) transferAppBiz.getTransferAppList(s).get(0);

        if (transferApp.getTransferNumber() != null && !transferApp.getTransferNumber().equals(""))               //转库数量
            condition.setTransferNumber(transferApp.getTransferNumber());
        if (transferApp.getTypeIn() != null && !transferApp.getTypeIn().equals(""))          //转库类型目标
            condition.setTypeIn(transferApp.getTypeIn());
        if (session.get("name") != null) {
            condition.setEdituser(session.get("name").toString()); //得到修改人
        }
        if (transferAppBiz.editTransferApp(condition)) {
            session.put("transferapplist", condition);
            return "success";
        } else return "input";

    }

}

