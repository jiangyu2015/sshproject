package com;

import com.hibtest1.entity.*;
import com.opensymphony.xwork2.ActionContext;
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
public class AllotManagerAction extends ActionSupport implements RequestAware, SessionAware {
    StorageBiz storageBiz;
    GoodsBiz goodsBiz;
    PlaceBiz placeBiz;
    ProducerBiz producerBiz;
    DeliverBiz deliverBiz;
    Map<String, Object> session;
    AllotAppBiz allotAppBiz;
    Map<String, Object> request;

    AllotApp allotApp;

    public AllotApp getAllotApp() {
        return allotApp;
    }

    public void setAllotApp(AllotApp allotApp) {
        this.allotApp = allotApp;
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

    public void setAllotAppBiz(AllotAppBiz allotAppBiz) {
        this.allotAppBiz = allotAppBiz;
    }

    String producerName;
    Integer goodsId;
    String placeName;
    String placeName2;

    public String getPlaceName2() {
        return placeName2;
    }

    public void setPlaceName2(String placeName2) {
        this.placeName2 = placeName2;
    }

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

    public String listAllotApp() {               //得到所有调拨申请单
        List allotApp = allotAppBiz.getAllAllotApp();
        session.put("allotapplistall", allotApp);
        return "allotApp";
    }

    public String checkAllotApp() {               //得到所需审核的单子
        AllotApp condition = new AllotApp();
        condition.setState("no");
        List<AllotApp> allotApp = allotAppBiz.getAllotAppList(condition);
        session.put("allotapplischeck", allotApp);
        return "allotAppCheck";

    }

    public String addAllotApp() throws Exception {                  //增加调拨申请
        System.out.println("addAllotApp");
        AllotApp condition = new AllotApp();
        if (allotApp.getAllotNumber() != null)               //调拨数量
            condition.setAllotNumber(allotApp.getAllotNumber());
        if (allotApp.getAllotType() != null)          //调拨类型
            condition.setAllotType(allotApp.getAllotType());
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
        if (placeName != null) { //原仓库
            Place place = placeBiz.getPlace(placeName).get(0);
            condition.setPlaceOut(place);
        }
        if (placeName2 != null) { //目标仓库
            Place place = placeBiz.getPlace(placeName2).get(0);
            condition.setPlaceIn(place);
        }
        if (allotApp.getExpectDate() != null) { //期望日期
            condition.setExpectDate(allotApp.getExpectDate());
        }
        if (session.get("name") != null)   //得到增加人
            condition.setAdduser(session.get("name").toString());
        allotAppBiz.add(condition);
        session.put("allotapplist", condition);  //两个地方用到，edit不知道会不会有问题
        return "success";
    }

    public String editAllotApp() {
        AllotApp s = new AllotApp();
        s.setAllotAppId(allotApp.getAllotAppId());
        AllotApp condition = new AllotApp();
        condition = (AllotApp) allotAppBiz.getAllotAppList(s).get(0);

        if (allotApp.getAllotNumber() != null && !allotApp.getAllotNumber().equals(""))               //调拨数量
            condition.setAllotNumber(allotApp.getAllotNumber());
        if (placeName2 != null && !placeName2.equals("")) {            //目标仓库
            Place place = placeBiz.getPlace(placeName2).get(0);
            condition.setPlaceIn(place);
        }
        if (allotApp.getExpectDate() != null && !allotApp.getExpectDate().equals("")) { //期望日期
            condition.setExpectDate(allotApp.getExpectDate());
        }
        if (session.get("name") != null) {
            condition.setEdituser(session.get("name").toString()); //得到修改人
        }
        if (allotAppBiz.editAllotApp(condition)) {
            session.put("allotapplist", condition);
            return "success";
        } else return "input";
    }

    public String allotAppOk() {
        AllotApp condition = new AllotApp();
        condition.setAllotAppId(allotApp.getAllotAppId());
        List list = allotAppBiz.getAllotAppList(condition);
        AllotApp allotApp = (AllotApp) list.get(0);
        allotApp.setState("yesok");     //更改状态yesok
        Calendar calendar = Calendar.getInstance();   //更改审核时间
        Date date = calendar.getTime();
        allotApp.setAuditTime(date);
        if (session.get("name") != null) {
            allotApp.setCheckuser(session.get("name").toString()); //得到审核人
        }
        allotAppBiz.editAllotApp(allotApp);
        Storage storage = new Storage();           //新建入库明细表
        Deliver deliver = new Deliver(); // 出库明细
        Goods goods = goodsBiz.getGoodsList(allotApp.getGoods()).get(0);
        storage.setGoods(goods);
        deliver.setGoods(goods);
        Producer producer = producerBiz.getProducerList(allotApp.getProducer()).get(0);
        storage.setProducer(producer);
        deliver.setProducer(producer);
        Place placeIn = placeBiz.getPlaceList(allotApp.getPlaceIn()).get(0);
        Place placeOut = placeBiz.getPlaceList(allotApp.getPlaceOut()).get(0);
        storage.setPlace(placeIn);
        deliver.setPlace(placeOut);
        if (allotApp.getExpectDate() != null && !allotApp.getExpectDate().equals("")) {                   //期望调拨时间
            storage.setExpectedDate(allotApp.getExpectDate());
        }
        if (allotApp.getAllotType() != null && !allotApp.getAllotType().equals("")) {  //入库类型
            storage.setStorageType(allotApp.getAllotType());
            deliver.setDeliverType(allotApp.getAllotType());
        }
        if (allotApp.getAdduser() != null && !allotApp.getAdduser().equals("")) {//入库申请人加入到入库明细中
            storage.setAdduser(allotApp.getAdduser());  //申请人
            deliver.setAdduser(allotApp.getAdduser());
        }
        if(allotApp.getAllotNumber() != null && !allotApp.getAllotNumber().equals("")){
            storage.setExpectedNumber(allotApp.getAllotNumber());  //调拨数
            deliver.setExpecteNumber(allotApp.getAllotNumber());
        }
        storage.setCategory("正常调拨");
        deliver.setCategory("正常调拨");
        storage.setState("no");
        deliver.setState("no");
        storageBiz.add(storage);
        deliverBiz.add(deliver);
        return "success";
    }

}
