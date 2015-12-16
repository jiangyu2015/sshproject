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
 * Created by user on 2015/12/8.
 */
public class WithholdingManagerAction extends ActionSupport implements RequestAware, SessionAware {
    EventsBiz eventsBiz;
    WithholdingBiz withholdingBiz;
    GoodsBiz goodsbiz;
    PlaceBiz placebiz;
    ProducerBiz producerBiz;

    public void setProducerBiz(ProducerBiz producerBiz) {
        this.producerBiz = producerBiz;
    }

    public void setEventsBiz(EventsBiz eventsBiz) {
        this.eventsBiz = eventsBiz;
    }

    public void setWithholdingBiz(WithholdingBiz withholdingBiz) {
        this.withholdingBiz = withholdingBiz;
    }

    public void setGoodsbiz(GoodsBiz goodsbiz) {
        this.goodsbiz = goodsbiz;
    }

    public void setPlacebiz(PlaceBiz placebiz) {
        this.placebiz = placebiz;
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

    public Withholding getWithholding() {
        return withholding;
    }

    public void setWithholding(Withholding withholding) {
        this.withholding = withholding;
    }

    public Events getEvents() {
        return events;
    }

    public void setEvents(Events events) {
        this.events = events;
    }

    Map<String, Object> request;
    Map<String, Object> session;
    Events events;
    Withholding withholding;

    public Integer getProducerId() {
        return producerId;
    }

    public void setProducerId(Integer producerId) {
        this.producerId = producerId;
    }

    Integer goodsId;
    Integer placeId;
    Integer producerId;

    public Integer getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Integer placeId) {
        this.placeId = placeId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String addEvents() {
        Events condition = new Events();
        if (events.getEventName() != null && !events.getEventName().equals(""))
            condition.setEventName(events.getEventName());
        if (events.getActivityId() != null && !events.getActivityId().equals(""))
            condition.setActivityId(events.getActivityId());
        if (events.getRemark() != null && !events.getRemark().equals(""))
            condition.setRemark(events.getRemark());
        //还要增加userName
        eventsBiz.add(condition);
        return "success";
    }

    public String addWithholding() throws Exception {                  //增加入库申请
        //    System.out.println(enteringWarehouseDto);
        System.out.println("addWithholding");
        Withholding condition = new Withholding();
        System.out.println("ok");
        if (goodsId != null && !goodsId.equals("")) {          //商品id
            System.out.println(goodsId + "预提申请我传过来了");
            Goods g = new Goods();
            g.setGoodsId(goodsId);
            Goods goods = (Goods) goodsbiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        if (placeId != null && !placeId.equals("")) {                     //仓库id
            Place p = new Place();
            p.setPlaceId(placeId);
            Place place = placebiz.getPlaceList(p).get(0);
            condition.setPlace(place);
        }
        if (producerId != null && !producerId.equals("")) {          //商户id
            Producer p = new Producer();
            p.setProducerId(producerId);
            Producer producer = (Producer) producerBiz.getProducerList(p).get(0);
            condition.setProducer(producer);
        }
        if (withholding.getEvents() != null && !withholding.getEvents().equals(""))               //预提原由
            condition.setEvents(withholding.getEvents());
        if (withholding.getActivityId() != null && !withholding.getActivityId().equals(""))               //活动id
            condition.setActivityId(withholding.getActivityId());
        if (withholding.getUnit() != null && !withholding.getUnit().equals(""))               //活动id
            condition.setUnit(withholding.getUnit());
        if (withholding.getUseType() != null && !withholding.getUseType().equals(""))          //使用类型
            condition.setUseType(withholding.getUseType());
        if (withholding.getDeteline() != null && !withholding.getDeteline().equals(""))          //截止日期
            condition.setDeteline(withholding.getDeteline());
        if (withholding.getWitholdingNumber() != null && !withholding.getWitholdingNumber().equals(""))          //预提数量
            condition.setWitholdingNumber(withholding.getWitholdingNumber());
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        condition.setWitholdingDate(date);
        System.out.println("当前时间" + date);
        withholdingBiz.add(condition);
        return "success";
    }

    public String listWithholding() {               //得到所有预提单
        List<Withholding> withholdinglist = withholdingBiz.getAllWithholding();
        Withholding withholding1 = withholdinglist.get(0);
        System.out.println(withholding1.getGoods().getGoodsId() + "得到所有预提单");
        session.put("withholdinglistall", withholdinglist);

        return "withholding";
    }

    public String searchWithholdingList() {      //增加这个方法需要注入 biz别忘了
        Withholding condition = new Withholding();
       /* if (goodsName != null && !goodsName.equals("")) {
            String[] strs = goodsName.split("\\|");
            String name = strs[0];
            Integer id = Integer.parseInt(strs[1]);

            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = (Goods) goodsBiz.getGoodsList(g).get(0);
            System.out.println(goods.getGoodsName());
            condition.setGoods(goods);
            List list = storageBiz.getStorageList(condition);
            System.out.println(list.size());
            if (list.size() > 0) {
                //  session.put("goodslist", list);
                session.put("storagelist", list);
                return "success";
            } else
                return "input";
        }
        else */
        if (withholding.getWithholdingId() != null && !withholding.getWithholdingId().equals("")) {
            System.out.println(withholding.getWithholdingId());

            condition.setWithholdingId(withholding.getWithholdingId());

            List<Withholding> list = withholdingBiz.search(condition);
            System.out.println(list.size());
            if (list.size() > 0) {
                //  session.put("goodslist", list);
                session.put("withholdinglist", list);
                return "success";
            } else
                return "input";
        }
        return "success";
    }


}