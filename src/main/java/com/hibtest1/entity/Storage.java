package com.hibtest1.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by user on 2015/11/27.
 */
public class Storage implements Serializable {
    private Integer storageId; //id
    private Integer placeId; //仓库id
    private Integer goodsId; //商品id
    private Integer producerId; //商户id
    private Date storageDate;  //实际入库时间
    private Date expectedDate;  //预期时间
    private Integer expectedNumber;  //预期数量
    private String state = "no";  //处理状态 no就是未收货
    private Integer storageNumber;  //实际入库数量
    private String storageType; //入库类型
    private String remark; //备注


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

    public Integer getProducerId() {
        return producerId;
    }

    public void setProducerId(Integer producerId) {
        this.producerId = producerId;
    }

    public Integer getStorageId() {
        return storageId;
    }

    public void setStorageId(Integer storageId) {
        this.storageId = storageId;
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
}
