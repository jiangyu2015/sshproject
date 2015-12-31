package com.hibtest1.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by user on 2015/11/27.
 */
public class Storage implements Serializable {
    private Integer storageId; //id
    private Goods goods;
    private Producer producer;
    private Place place;
    private Date storageDate;  //实际入库时间
    private Date expectedDate;  //预期时间
    private Integer expectedNumber;  //预期数量
    private String state;  //处理状态 no就是未收货
    private Integer storageNumber;  //实际入库数量
    private String storageType; //入库类型
    private String category; //入库类别
    private String remark; //备注
    private String adduser; //添加人
    private String checkuser; //确认收货人

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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
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

    public Integer getStorageId() {
        return storageId;
    }

    public void setStorageId(Integer storageId) {
        this.storageId = storageId;
    }

    public Date getStorageDate() {
        return storageDate;
    }

    public void setStorageDate(Date storageDate) {
        this.storageDate = storageDate;
    }

    public Integer getStorageNumber() {
        return storageNumber;
    }

    public void setStorageNumber(Integer storageNumber) {
        this.storageNumber = storageNumber;
    }

    public String getStorageType() {
        return storageType;
    }

    public void setStorageType(String storageType) {
        this.storageType = storageType;
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

    public String getCheckuser() {
        return checkuser;
    }

    public void setCheckuser(String checkuser) {
        this.checkuser = checkuser;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
