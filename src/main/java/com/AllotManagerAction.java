package com;

import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Map;

/**
 * Created by dell on 2015/12/26.
 */
public class AllotManagerAction extends ActionSupport implements RequestAware, SessionAware {
   StorageBiz storageBiz;
    GoodsBiz goodsbiz;
    PlaceBiz placebiz;
    ProducerBiz producerBiz;
    DeliverBiz deliverBiz;
    Map<String, Object> session;
    AllotAppBiz allotAppBiz;
    Map<String, Object> request;

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

    public void setGoodsbiz(GoodsBiz goodsbiz) {
        this.goodsbiz = goodsbiz;
    }

    public void setPlacebiz(PlaceBiz placebiz) {
        this.placebiz = placebiz;
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

    String  producerName;
    Integer goodsId;
    String  placeName;
    String  placeName2;

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
}
