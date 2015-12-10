package com;

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
    Integer goodsId;
    Integer placeId;
    Integer withholdingId;
    Integer producerId;

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
        Deliver deliver1 = (Deliver) deliver.get(0);
        session.put("deliverlistall", deliver);
        return "deliver";
    }

    public String searchDeliverList() {
        Deliver condition = new Deliver();
        // condition.setGoodsName(goodsName);
        List list = deliverBiz.getDeliverList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            //  session.put("goodslist", list);
            session.put("deliverlist", list);
            return "success";
        } else
            return "input";
    }

    public String addDeliver() throws Exception {                  //增加出库申请
        System.out.println("addDeliver");
        Deliver condition = new Deliver();
        //   System.out.println(deliver.getGoodsId() + "出库明细添加商品id我传过来了");
 /*       if (deliver.getProducerName() != null && !deliver.getProducerName().equals(""))
            condition.setProducerName(deliver.getProducerName());
        else {
            ActionContext.getContext().put("yesWords", "请输入商户名称!");
            return "input";
        }
        if (deliver.getGoodsName() != null && !deliver.getGoodsName().equals(""))
            condition.setGoodsName(deliver.getGoodsName());
        else {
            ActionContext.getContext().put("yesWords", "请输入商品名称!");
            return "input";
        }
        if (deliver.getDeliverPlace() != null && !deliver.getDeliverPlace().equals(""))
            condition.setDeliverPlace(deliver.getDeliverPlace());
        else {
            ActionContext.getContext().put("yesWords", "请输入仓库名称!");
            return "input";
        }*/
        System.out.println("addDeliver");
        if (goodsId != null && !goodsId.equals("")) {          //商品id
            Goods g = new Goods();
            g.setGoodsId(goodsId);
            Goods goods = (Goods) goodsBiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        if (placeId != null && !placeId.equals("")) {                     //仓库id
            Place p = new Place();
            p.setPlaceId(placeId);
            Place place =(Place) placeBiz.getPlaceList(p).get(0);
            condition.setPlace(place);
        }

        if (producerId != null && !producerId.equals("")) {          //商户id
            Producer p = new Producer();
            p.setProducerId(producerId);
            Producer producer = (Producer) producerBiz.getProducerList(p).get(0);
            condition.setProducer(producer);
            System.out.println("DeliverManegerAction"+condition.getProducer().getProducerName());
        }
      if( withholdingId!= null && ! withholdingId.equals("")){
          Withholding w=new Withholding();
          w.setWithholdingId(withholdingId);
          Withholding withholding=(Withholding) withholdingBiz.search(w).get(0);
          condition.setWithholding(withholding);
          System.out.println(condition.getWithholding().getWithholdingId()+"withholdingId");
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
        deliverBiz.add(condition);
        return "success";


    }

  /*  public String modifyShow() {                        //更新显示
        Deliver condition = new Deliver();
        condition.setDeliverName(deliverName);
        List list = deliverBiz.getDeliverList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Deliver deliver = new Deliver();
            deliver = (Deliver) list.get(0);
            session.put("deliver", deliver);
            return "success";
        } else return "input";
    } */

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

}
