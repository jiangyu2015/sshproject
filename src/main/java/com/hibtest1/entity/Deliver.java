package com.hibtest1.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by user on 2015/11/27.
 */
public class Deliver implements Serializable {
    private Integer deliverId; //id
    private Place place;
    private Goods goods;
    private Withholding withholding;
    private Producer producer;
    private Date deliverDate;  //出库时间
    private Integer expecteNumber;  //应发数量
    private Integer deliverNumber;  //出库数量
    private String deliverType; //出库类型
    private String category; //出库类别
    private String remark; //备注
    private BigDecimal sumDeliver;//总出库
    private String adduser; //添加人
    private String checkuser; //确认出货人
    private String state ;  //处理状态 no就是未出货
    private Date expecteDate;//期望出库时间

    public Date getExpecteDate() {
        return expecteDate;
    }

    public void setExpecteDate(Date expecteDate) {
        this.expecteDate = expecteDate;
    }

    public String getCheckuser() {
        return checkuser;
    }

    public void setCheckuser(String checkuser) {
        this.checkuser = checkuser;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public BigDecimal getSumDeliver() {
        return sumDeliver;
    }

    public void setSumDeliver(BigDecimal sumDeliver) {
        this.sumDeliver = sumDeliver;
    }

    public Producer getProducer() {
        return producer;
    }

    public void setProducer(Producer producer) {
        this.producer = producer;
    }

    public Place getPlace() {
        return place;
    }

    public void setPlace(Place place) {
        this.place = place;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Withholding getWithholding() {
        return withholding;
    }

    public void setWithholding(Withholding withholding) {
        this.withholding = withholding;
    }

    public Integer getDeliverId() {
        return deliverId;
    }

    public void setDeliverId(Integer deliverId) {
        this.deliverId = deliverId;
    }

    public Date getDeliverDate() {
        return deliverDate;
    }

    public void setDeliverDate(Date deliverDate) {
        this.deliverDate = deliverDate;
    }

    public Integer getExpecteNumber() {
        return expecteNumber;
    }

    public void setExpecteNumber(Integer expecteNumber) {
        this.expecteNumber = expecteNumber;
    }

    public Integer getDeliverNumber() {
        return deliverNumber;
    }

    public void setDeliverNumber(Integer deliverNumber) {
        this.deliverNumber = deliverNumber;
    }

    public String getDeliverType() {
        return deliverType;
    }

    public void setDeliverType(String deliverType) {
        this.deliverType = deliverType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAdduser() {
        return adduser;
    }

    public void setAdduser(String adduser) {
        this.adduser = adduser;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
