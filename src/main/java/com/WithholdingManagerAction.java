package com;

import com.core.util.StringUtils;
import com.hibtest1.entity.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.math.BigDecimal;
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

    public void setDeliverBiz(DeliverBiz deliverBiz) {
        this.deliverBiz = deliverBiz;
    }

    DeliverBiz deliverBiz;

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

    Integer id;
    Integer goodsId;
    Integer placeId;
    Integer producerId;
    Integer withholdingId;
    String goodsName;
    String producerName;//商户
    String storagePlace;  //入库地点
    Integer timeId; //用来预提释放

    public Integer getTimeId() {
        return timeId;
    }

    public void setTimeId(Integer timeId) {
        this.timeId = timeId;
    }

    public String getStoragePlace() {
        return storagePlace;
    }

    public void setStoragePlace(String storagePlace) {
        this.storagePlace = storagePlace;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public Integer getWithholdingId() {
        return withholdingId;
    }

    public void setWithholdingId(Integer withholdingId) {
        this.withholdingId = withholdingId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
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

    public String addWithholding() throws Exception {                  //增加预提申请
        Withholding condition = new Withholding();
        if (goodsId != null && !goodsId.equals("")) {          //商品id
            System.out.println(goodsId + "预提申请我传过来了");
            Goods g = new Goods();
            g.setGoodsId(goodsId);
            Goods goods = goodsbiz.getGoodsList(g).get(0);
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
            Producer producer = producerBiz.getProducerList(p).get(0);
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
        if (session.get("name") != null) {
            condition.setAdduser(session.get("name").toString()); //得到增加人
        }

        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        condition.setWitholdingDate(date);
    /*    session.put("goodslist", condition);*/
        withholdingBiz.add(condition);
        return "success";
    }

    public String listWithholding() {               //得到所有预提单
       /* session.put("withholdinglistall", null);*/
        if (StringUtils.isEmpty(goodsName) || StringUtils.isEmpty(producerName) || StringUtils.isEmpty(storagePlace)) {
            Withholding condition = new Withholding();
            if (goodsName != null && !goodsName.equals("")) {
                String[] strs = goodsName.split("\\|");
                Integer id = Integer.parseInt(strs[1]);
                Goods g = new Goods();
                g.setGoodsId(id);
                Goods goods = goodsbiz.getGoodsList(g).get(0);
                condition.setGoods(goods);
                goodsName = "";
            }
            if (producerName != null && !producerName.equals("")) {
                Producer producer = producerBiz.getProducer(producerName).get(0);
                condition.setProducer(producer);
                producerName = "";
            }
            if (storagePlace != null && !storagePlace.equals("")) {
                Place place = placebiz.getPlace(storagePlace).get(0);
                condition.setPlace(place);
                storagePlace = "";
            }
            List list = withholdingBiz.search(condition);
            session.put("withholdinglistall", list);
        } else {
            List<Withholding> list = withholdingBiz.getAllWithholding();
            session.put("withholdinglistall", list);
        }
        return "withholding";
    }

    public String searchWithholdingList() {      //增加这个方法需要注入 biz别忘了
        session.put("deliverytlist", null);
        session.put("withholdinglist", null);
        session.put("sumwithholdingdeliver", null);
        Withholding condition = new Withholding();
       /* condition.setTimeId(3);  //超时间问题 待定*/
        if (id != null && !id.equals("")) {
            withholding.setWithholdingId(id);
            id = null;
        }
        if (timeId != null && !timeId.equals("")) {
            withholding.setTimeId(timeId);
            timeId = null;
        }
        if (withholding.getTimeId() != null && !withholding.getTimeId().equals("")) {
            condition.setTimeId(withholding.getTimeId());
        }
        if (withholding.getWithholdingId() != null && !withholding.getWithholdingId().equals("")) {
            condition.setWithholdingId(withholding.getWithholdingId());
            List<Withholding> list = withholdingBiz.search(condition);
            if (list.size() > 0) {
                session.put("withholdinglist", list);   //有了预提表
                Withholding w = list.get(0);
                Deliver d = new Deliver();
                d.setWithholding(w);
                List<Deliver> deliverList = deliverBiz.getDeliverList(d);
                session.put("deliverytlist", deliverList);
                List<Deliver> delivers = deliverBiz.searchWithholdingDeliver(withholding.getWithholdingId());
                if (delivers.size() > 0) {
                    Deliver deliver = delivers.get(0);
                    BigDecimal a = deliver.getSumDeliver(); //预提号对应的总的出库数
                    int sumDeliver = a.intValue();
                    session.put("sumwithholdingdeliver", sumDeliver);
                } else {
                    int sumDeliver = 0;
                    session.put("sumwithholdingdeliver", sumDeliver);
                }
                withholding.setWithholdingId(null);
                return "success";
            } else {
                session.put("nowithholding", "没有找到相关信息!");
                return "input";
            }
        }

        if (StringUtils.isEmpty(withholding.getActivityId()) && StringUtils.isEmpty(goodsName)) {    //针对出库预提查询
            condition.setActivityId(withholding.getActivityId());
            withholding.setActivityId("");
            if (goodsName.indexOf("|") != -1) {
                String[] strs = goodsName.split("\\|");
                Integer id = Integer.parseInt(strs[1]);
                Goods g = new Goods();
                g.setGoodsId(id);
                Goods goods = goodsbiz.getGoodsList(g).get(0);
                condition.setGoods(goods);
                goodsName = "";
            }
            List<Withholding> list = withholdingBiz.search(condition);
            if (list.size() > 0) {
                session.put("withholdinglist", list);   //有了预提表
                Withholding w = list.get(0);
                Deliver d = new Deliver();
                d.setWithholding(w);
                List<Deliver> deliverList = deliverBiz.getDeliverList(d);
                session.put("deliverytlist", deliverList);
                List<Deliver> delivers = deliverBiz.searchWithholdingDeliver(w.getWithholdingId());
                if (delivers.size() > 0) {
                    Deliver deliver = delivers.get(0);
                    BigDecimal a = deliver.getSumDeliver(); //预提号对应的总的出库数
                    int sumDeliver = a.intValue();
                    session.put("sumwithholdingdeliver", sumDeliver);
                } else {
                    int sumDeliver = 0;
                    session.put("sumwithholdingdeliver", sumDeliver);
                }
                return "success";
            } else {
                session.put("nowithholding", "没有找到相关信息!");
                return "input";
            }
        } else {
            if (withholding.getActivityId() != null && !withholding.getActivityId().equals("")) {
                condition.setActivityId(withholding.getActivityId());
                withholding.setActivityId("");
                List<Withholding> list = withholdingBiz.search(condition);
                if (list.size() > 0) {
                    session.put("withholdinglist", list);   //有了预提表
                    return "s";
                } else {
                    session.put("nowithholding", "没有找到相关信息!");
                    return "input";
                }

                  /*  Withholding w = list.get(0);
                    Deliver d = new Deliver();
                    d.setWithholding(w);
                    List<Deliver> deliverList = deliverBiz.getDeliverList(d);
                    session.put("deliverytlist", deliverList);
                    List<Deliver> delivers = deliverBiz.searchWithholdingDeliver(w.getWithholdingId());
                    if (delivers.size() > 0) {
                        Deliver deliver = delivers.get(0);
                        BigDecimal a = deliver.getSumDeliver(); //预提号对应的总的出库数
                        int sumDeliver = a.intValue();
                        session.put("sumwithholdingdeliver", sumDeliver);
                    } else {
                        int sumDeliver = 0;
                        session.put("sumwithholdingdeliver", sumDeliver);
                    }
                    return "success";
                } else {
                    session.put("nowithholding", "没有找到相关信息!");
                    return "input";*/

            } else if (goodsName != null && !goodsName.equals("")) {
                if (goodsName.indexOf("|") != -1) {
                    String[] strs = goodsName.split("\\|");
                    Integer id = Integer.parseInt(strs[1]);
                    Goods g = new Goods();
                    g.setGoodsId(id);
                    Goods goods = goodsbiz.getGoodsList(g).get(0);
                    condition.setGoods(goods);
                    goodsName = "";
                    List list = withholdingBiz.search(condition);
                    if (list.size() > 0) {
                        session.put("withholdinglist", list);
                        return "s";
                    } else {
                        session.put("nowithholding", "没有找到相关信息!");
                        return "input";
                    }
                }
            }
        }
        return "success";
    }

    public String searchWithholdingDeliverList() {      //与上面一样，为了查询预提出库加的
        session.put("deliverytlist", null);
        session.put("withholdinglist", null);
        session.put("sumwithholdingdeliver", null);
        Withholding condition = new Withholding();
        if (id != null && !id.equals("")) {
            condition.setWithholdingId(id);

            List<Withholding> list = withholdingBiz.search(condition);
            if (list.size() > 0) {
                session.put("withholdinglist", list);   //有了预提表
                Withholding w = list.get(0);
                Deliver d = new Deliver();
                d.setWithholding(w);
                List<Deliver> deliverList = deliverBiz.getDeliverList(d);
                session.put("deliverytlist", deliverList);
                List<Deliver> delivers = deliverBiz.searchWithholdingDeliver(id);
                if (delivers.size() > 0) {
                    Deliver deliver = delivers.get(0);
                    BigDecimal a = deliver.getSumDeliver(); //预提号对应的总的出库数
                    int sumDeliver = a.intValue();
                    session.put("sumwithholdingdeliver", sumDeliver);
                } else {
                    int sumDeliver = 0;
                    session.put("sumwithholdingdeliver", sumDeliver);
                }
              /*  withholding.setWithholdingId(null);*/
                /*id = null;*/
                return "success";
            } else {
                session.put("nowithholding", "没有找到相关信息!");
                return "input";
            }

        }
       else return "input";
    }

    public String searchNowWithholdingList() {

        Withholding condition = new Withholding();
        if (goodsName != null && !goodsName.equals("")) {
            String[] strs = goodsName.split("\\|");
            Integer id = Integer.parseInt(strs[1]);
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = goodsbiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
            goodsName = "";
        }
        if (producerName != null && !producerName.equals("")) {
            Producer producer = producerBiz.getProducer(producerName).get(0);
            condition.setProducer(producer);
            producerName = "";
        }
        if (storagePlace != null && !storagePlace.equals("")) {
            Place place = placebiz.getPlace(storagePlace).get(0);
            condition.setPlace(place);
            storagePlace = "";
        }
        condition.setTimeId(2);
        List list = withholdingBiz.search(condition);
        session.put("withholdingdatelist", list);
        return "success";

    }

    public String searchOverWithholdingList() {
        Withholding condition = new Withholding();
        if (goodsName != null && !goodsName.equals("")) {
            String[] strs = goodsName.split("\\|");
            Integer id = Integer.parseInt(strs[1]);
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = goodsbiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
            goodsName = "";
        }
        if (producerName != null && !producerName.equals("")) {
            Producer producer = producerBiz.getProducer(producerName).get(0);
            condition.setProducer(producer);
            producerName = "";
        }
        if (storagePlace != null && !storagePlace.equals("")) {
            Place place = placebiz.getPlace(storagePlace).get(0);
            condition.setPlace(place);
            storagePlace = "";
        }
        condition.setTimeId(1);
        List list = withholdingBiz.search(condition);
        session.put("withholdingdatelist", list);
        return "success";
    }
}
