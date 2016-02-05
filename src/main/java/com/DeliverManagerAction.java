package com;

import com.core.util.StringUtils;
import com.hibtest1.entity.*;
import com.springtest1.biz.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2015/11/28.
 */
public class DeliverManagerAction extends ActionSupport implements RequestAware, SessionAware {
    DeliverBiz deliverBiz;
    GoodsBiz goodsBiz;
    PlaceBiz placeBiz;

    public void setProducerBiz(ProducerBiz producerBiz) {
        this.producerBiz = producerBiz;
    }

    ProducerBiz producerBiz;
    WithholdingBiz withholdingBiz;
    Map<String, Object> request;

    public void setWithholdingBiz(WithholdingBiz withholdingBiz) {
        this.withholdingBiz = withholdingBiz;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    Map<String, Object> session;
    Deliver deliver;

    public void setGoodsBiz(GoodsBiz goodsBiz) {
        this.goodsBiz = goodsBiz;
    }

    public void setPlaceBiz(PlaceBiz placeBiz) {
        this.placeBiz = placeBiz;
    }

    String goodsName;   //商品名称


    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    String placeName;  //出库地点

    String producerName;
    Integer goodsId;
    Integer placeId;
    Integer withholdingId;
    Integer producerId;
    String category;//查询用到类别

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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

    public void setDeliverBiz(DeliverBiz deliverBiz) {
        this.deliverBiz = deliverBiz;
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

    public void setProducerId(Integer producerId) {
        this.producerId = producerId;
    }

    public Deliver getDeliver() {
        return deliver;
    }

    public void setDeliver(Deliver deliver) {
        this.deliver = deliver;
    }

    public String listDeliver() {
        List deliver = deliverBiz.getAllDeliver();
        session.put("deliverlistall", deliver);
        return "deliver";
    }

    public String checkDeliver() {               //得到所需出库的单子
        Deliver condition = new Deliver();
        if (StringUtils.isEmpty(goodsName) || StringUtils.isEmpty(producerName) || StringUtils.isEmpty(placeName)||StringUtils.isEmpty(category)) {
            if (goodsName != null && !goodsName.equals("")) {
                String[] strs = goodsName.split("\\|");
                Integer id = Integer.parseInt(strs[1]);
                Goods g = new Goods();
                g.setGoodsId(id);
                Goods goods = goodsBiz.getGoodsList(g).get(0);
                condition.setGoods(goods);
                goodsName = "";
            }
            if (producerName != null && !producerName.equals("")) {
                Producer producer = producerBiz.getProducer(producerName).get(0);
                condition.setProducer(producer);
                producerName = "";
            }
            if (placeName != null && !placeName.equals("")) {
                Place place = placeBiz.getPlace(placeName).get(0);
                condition.setPlace(place);
                placeName = "";
            }
            if (category != null && !category.equals("")) {
                condition.setCategory(category);
                category = "";
            }
        }
        condition.setState("no");
        List<Deliver> deliver = deliverBiz.getDeliverList(condition);
        session.put("deliverlistcheck", deliver);
        return "deliverCheck";
    }

    public String deliverOk() {               //确认出库
        Deliver condition = new Deliver();
        condition.setDeliverId(deliver.getDeliverId());
        List list = deliverBiz.getDeliverList(condition);
        Deliver deliver2 = (Deliver) list.get(0);
        deliver2.setState("ok");
        if (deliver.getDeliverDate() != null && !deliver.getDeliverDate().equals(""))                      //实际入库时间
            deliver2.setDeliverDate(deliver.getDeliverDate());
        if (deliver.getDeliverNumber() != null && !deliver.getDeliverNumber().equals("")) {             //实收数量
            deliver2.setDeliverNumber(deliver.getDeliverNumber());
        }
        if (deliver.getRemark() != null && !deliver.getRemark().equals(""))          //备注
            deliver2.setRemark(deliver.getRemark());
        if (session.get("name") != null) {
            deliver2.setCheckuser(session.get("name").toString()); //得到出库确认人
        }
        else {
            session.put("nowithholding", "操作时间过长,session丢失，需重新登录!");
            return "input";
        }
        deliverBiz.editDeliver(deliver2);                //更改状态ok1
        return "success";
    }

    public String searchDeliverList() {      //增加这个方法需要注入 biz别忘了
        Deliver condition = new Deliver();
        if (goodsName != null && !goodsName.equals("")) {
            if (goodsName.indexOf("|") != -1) {
                String[] strs = goodsName.split("\\|");
                Integer id = Integer.parseInt(strs[1]);
                Goods g = new Goods();
                g.setGoodsId(id);
                Goods goods = goodsBiz.getGoodsList(g).get(0);
                condition.setGoods(goods);
            }
        }
        if (producerName != null && !producerName.equals("")) {
            Producer producer = producerBiz.getProducer(producerName).get(0);
            condition.setProducer(producer);
        }
        if (placeName != null && !placeName.equals("")) {
            Place place = placeBiz.getPlace(placeName).get(0);
            condition.setPlace(place);
        }
        List list = deliverBiz.getDeliverList(condition);
        session.put("deliverlist", list);
        return "success";
    }

    public String addDeliver() throws Exception {                  //增加出库
        System.out.println("addDeliver");
        Deliver condition = new Deliver();
        if (goodsId != null && !goodsId.equals("")) {          //商品id
            Goods g = new Goods();
            g.setGoodsId(goodsId);
            Goods goods = goodsBiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        if (placeId != null && !placeId.equals("")) {                     //仓库id
            Place p = new Place();
            p.setPlaceId(placeId);
            Place place = placeBiz.getPlaceList(p).get(0);
            condition.setPlace(place);
        }

        if (producerId != null && !producerId.equals("")) {          //商户id
            Producer p = new Producer();
            p.setProducerId(producerId);
            Producer producer = producerBiz.getProducerList(p).get(0);
            condition.setProducer(producer);
        }
        if (withholdingId != null && !withholdingId.equals("")) {
            Withholding w = new Withholding();
            w.setWithholdingId(withholdingId);
            Withholding withholding = withholdingBiz.search(w).get(0);
            condition.setWithholding(withholding);
        }
        if (deliver.getDeliverDate() != null)                      //实际出库时间
            condition.setDeliverDate(deliver.getDeliverDate());
        if (deliver.getExpecteNumber() != null)               //预期出库数量
            condition.setExpecteNumber(deliver.getExpecteNumber());
        if (deliver.getDeliverNumber() != null)               //实际出库数量
            condition.setDeliverNumber(deliver.getDeliverNumber());
        if (deliver.getDeliverType() != null)          //出库类型
            condition.setDeliverType(deliver.getDeliverType());
        if (deliver.getRemark() != null)          //备注
            condition.setRemark(deliver.getRemark());
        if (session.get("name") != null) {
            condition.setCheckuser(session.get("name").toString()); //得到出库确认人
        }
        condition.setState("ok");
        condition.setCategory("正常出库");
        deliverBiz.add(condition);
        session.put("deliverlistok", condition);
        return "success";
    }

    public String addOtherDeliver() throws Exception {                  //增加其他出库申请
        Deliver condition = new Deliver();
        if (goodsId != null && !goodsId.equals("")) {          //商品id
            Goods g = new Goods();
            g.setGoodsId(goodsId);
            Goods goods =  goodsBiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        if (placeName!= null && !placeName.equals("")) {                     //仓库id
            Place p = new Place();
            p.setPlaceName(placeName);
            Place place =  placeBiz.getPlaceList(p).get(0);
            condition.setPlace(place);
        }
        if (producerName != null && !producerName.equals("")) {          //商户名称
            Producer p = new Producer();
            p.setProducerName(producerName);
            Producer producer = producerBiz.getProducerList(p).get(0);
            condition.setProducer(producer);
        }
        if (deliver.getExpecteDate() != null)                      //预期出库时间
            condition.setExpecteDate(deliver.getExpecteDate());
        if (deliver.getExpecteNumber() != null)               //预期出库数量
            condition.setExpecteNumber(deliver.getExpecteNumber());
        if (deliver.getDeliverType() != null)          //出库类型
            condition.setDeliverType(deliver.getDeliverType());
        if (deliver.getRemark() != null)          //备注
            condition.setRemark(deliver.getRemark());
        if (session.get("name") != null) {
            condition.setAdduser(session.get("name").toString()); //得到申请出库人
        }
        condition.setState("no");
        condition.setCategory("其他出库");
        deliverBiz.add(condition);
        session.put("deliverlistok", condition);
        return "success";
    }

    public String editDeliver() {
        Deliver condition = new Deliver();
        if (deliver.getDeliverId() != null && !deliver.getDeliverId().equals("")) {
            condition.setDeliverId(deliver.getDeliverId());
        }
     /*   if (deliver.getGoodsId() != null && !deliver.getGoodsId().equals(""))  {      //商品id
            System.out.println("Action商品id"+deliver.getGoodsId());
            condition.setGoodsId(deliver.getGoodsId());
        }
        if (deliver.getPlaceId() != null && !deliver.getPlaceId().equals(""))  {               //仓库id
            condition.setPlaceId(deliver.getPlaceId());
            System.out.println("Action仓库id"+deliver.getPlaceId());
        }*/
        if (deliver.getDeliverDate() != null && !deliver.getDeliverDate().equals(""))                      //实际出库时间
            condition.setDeliverDate(deliver.getDeliverDate());
        if (deliver.getExpecteNumber() != null && !deliver.getExpecteNumber().equals(""))               //预期出库数量
            condition.setExpecteNumber(deliver.getExpecteNumber());
        if (deliver.getDeliverNumber() != null && !deliver.getDeliverNumber().equals("")) {             //出库数量
            System.out.println("Action实收数量" + deliver.getDeliverNumber());
            condition.setDeliverNumber(deliver.getDeliverNumber());
        }
        if (deliver.getDeliverType() != null && !deliver.getDeliverType().equals(""))          //出库类型
            condition.setDeliverType(deliver.getDeliverType());
        if (deliver.getRemark() != null && !deliver.getRemark().equals(""))          //备注
            condition.setRemark(deliver.getRemark());
        if (deliverBiz.editDeliver(condition)) {
            session.put("deliverlist", condition);
            return "success";
        } else return "input";
    }

    public String listOkDeliver() {
        Deliver condition = new Deliver();
        if (StringUtils.isEmpty(goodsName) || StringUtils.isEmpty(producerName) || StringUtils.isEmpty(placeName)) {
            if (goodsName != null && !goodsName.equals("")) {
                String[] strs = goodsName.split("\\|");
                Integer id = Integer.parseInt(strs[1]);
                Goods g = new Goods();
                g.setGoodsId(id);
                Goods goods = goodsBiz.getGoodsList(g).get(0);
                condition.setGoods(goods);
                goodsName = "";
            }
            if (producerName != null && !producerName.equals("")) {
                Producer producer = producerBiz.getProducer(producerName).get(0);
                condition.setProducer(producer);
                producerName = "";
            }
            if (placeName != null && !placeName.equals("")) {
                Place place = placeBiz.getPlace(placeName).get(0);
                condition.setPlace(place);
                placeName = "";
            }
        }
        condition.setState("ok");
        List deliver = deliverBiz.getDeliverList(condition);
        session.put("deliverlistok", deliver);
        return "success";
    }

}
