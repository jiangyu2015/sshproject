package com.hibtest1.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by user on 2015/11/26.
 */
public class StorageApp implements Serializable {
    private Integer storageAppId; //id
    private String goodsName; //商品名字
    private String producerName; //商户名字
    private Date expectedDate;  //预期时间
    private Integer expectedNumber;  //预期数量
    private String commodityRating; //商品评级
    private String sldId; //三联单编号
    private String storagePlace;  //入库地点
    private String storageType; //入库类型
    private String state;  //处理状态
    private Date applicationDate; //申请录入时间
    private Goods goods;
    private Producer producer;
    private Place place;
    private Date auditTime; //审核时间
    private String adduser; //添加人
    private String edituser; //修改人
    private String checkuser; //审核人

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
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

    public Date getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(Date applicationDate) {
        this.applicationDate = applicationDate;
    }

    public Integer getStorageAppId() {
        return storageAppId;
    }

    public void setStorageAppId(Integer storageAppId) {
        this.storageAppId = storageAppId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public Date getExpectedDate() {
        return expectedDate;
    }

    public void setExpectedDate(Date expectedDate) {
        this.expectedDate = expectedDate;
    }

    public Integer getExpectedNumber() {
        return expectedNumber;
    }

    public void setExpectedNumber(Integer expectedNumber) {
        this.expectedNumber = expectedNumber;
    }

    public String getCommodityRating() {
        return commodityRating;
    }

    public void setCommodityRating(String commodityRating) {
        this.commodityRating = commodityRating;
    }

    public String getSldId() {
        return sldId;
    }

    public void setSldId(String sldId) {
        this.sldId = sldId;
    }

    public String getStoragePlace() {
        return storagePlace;
    }

    public void setStoragePlace(String storagePlace) {
        this.storagePlace = storagePlace;
    }

    public String getStorageType() {
        return storageType;
    }

    public void setStorageType(String storageType) {
        this.storageType = storageType;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAdduser() {
        return adduser;
    }

    public void setAdduser(String adduser) {
        this.adduser = adduser;
    }

    public String getEdituser() {
        return edituser;
    }

    public void setEdituser(String edituser) {
        this.edituser = edituser;
    }

    public String getCheckuser() {
        return checkuser;
    }

    public void setCheckuser(String checkuser) {
        this.checkuser = checkuser;
    }
}
