package com;

import com.hibtest1.entity.Deliver;
import com.springtest1.biz.DeliverBiz;
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
    Map<String, Object> request;
    Map<String, Object> session;
    Deliver deliver;
    String goodsName;   //商品名称

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getDeliverPlace() {
        return deliverPlace;
    }

    public void setDeliverPlace(String deliverPlace) {
        this.deliverPlace = deliverPlace;
    }

    String deliverPlace;  //入库地点
    Integer goodsId;   //商品id

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Integer placeId) {
        this.placeId = placeId;
    }

    Integer placeId;  //仓库id

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
        System.out.println(goodsId);
        Deliver condition = new Deliver();
        condition.setGoodsId(goodsId);
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

 /*   public String delDeliver() {
        System.out.println(deliverName);
        Deliver condition = new Deliver();
        condition.setDeliverName(deliverName);
        List<Deliver> list = deliverBiz.getDeliverList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Deliver deliver = new Deliver();
            deliver = (Deliver) list.get(0);
            boolean e = deliverBiz.delGoods(deliver);
            if (e) return "success";
            else return "input";
        } else return "input";
    }  */

    public String addDeliver() throws Exception {                  //增加出库申请
        System.out.println("addDeliver");
        Deliver condition = new Deliver();
        System.out.println(deliver.getGoodsId() + "出库明细添加商品id我传过来了");
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
        System.out.println("ok");
        if (deliver.getGoodsId() != null)        //商品id
            condition.setGoodsId(deliver.getGoodsId());
        if (deliver.getPlaceId() != null)   {              //仓库id
            System.out.println("出库明细添加仓库id我传过来了"+deliver.getPlaceId());
            condition.setPlaceId(deliver.getPlaceId());}
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
        if (deliver.getGoodsId() != null && !deliver.getGoodsId().equals(""))  {      //商品id
            System.out.println("Action商品id"+deliver.getGoodsId());
            condition.setGoodsId(deliver.getGoodsId());
        }
        if (deliver.getPlaceId() != null && !deliver.getPlaceId().equals(""))  {               //仓库id
            condition.setPlaceId(deliver.getPlaceId());
            System.out.println("Action仓库id"+deliver.getPlaceId());
        }
        if (deliver.getDeliverDate() != null && !deliver.getDeliverDate().equals(""))                      //实际出库时间
            condition.setDeliverDate(deliver.getDeliverDate());
        if (deliver.getExpecteNumber() != null && !deliver.getExpecteNumber().equals(""))               //预期出库数量
            condition.setExpecteNumber(deliver.getExpecteNumber());
        if (deliver.getDeliverNumber() != null && !deliver.getDeliverNumber().equals(""))  {             //出库数量
            System.out.println("Action实收数量"+deliver.getDeliverNumber());
            condition.setDeliverNumber(deliver.getDeliverNumber());}
        if (deliver.getDeliverType() != null && !deliver.getDeliverType().equals(""))          //出库类型
            condition.setDeliverType(deliver.getDeliverType());
        if (deliver.getRemark() != null && !deliver.getRemark().equals(""))          //备注
            condition.setRemark(deliver.getRemark());
        if (deliverBiz.editDeliver(condition)) {
            System.out.println("condition" + condition.getPlaceId());
            System.out.println(condition.getGoodsId());
            session.put("deliverlist", condition);
            return "success";
        } else return "input";

    }

}
