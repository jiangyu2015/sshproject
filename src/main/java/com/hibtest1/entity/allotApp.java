package com.hibtest1.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by user on 2015/12/25.
 */
public class AllotApp implements Serializable {
    private Integer allotAppId; //id
    private Goods goods;
    private Producer producer;
    private Place placeIn;
    private Place placeOut;
    private Integer allotNumber; //调拨数量
    private String  allotType; //类型
    private Date auditTime; //审核时间
    private String adduser; //添加人
    private String edituser; //修改人
    private String checkuser; //审核人
    private String state = "no";  //处理状态

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getAllotAppId() {
        return allotAppId;
    }

    public void setAllotAppId(Integer allotAppId) {
        this.allotAppId = allotAppId;
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

    public Place getPlaceIn() {
        return placeIn;
    }

    public void setPlaceIn(Place placeIn) {
        this.placeIn = placeIn;
    }

    public Place getPlaceOut() {
        return placeOut;
    }

    public void setPlaceOut(Place placeOut) {
        this.placeOut = placeOut;
    }

    public Integer getAllotNumber() {
        return allotNumber;
    }

    public void setAllotNumber(Integer allotNumber) {
        this.allotNumber = allotNumber;
    }

    public String getAllotType() {
        return allotType;
    }

    public void setAllotType(String allotType) {
        this.allotType = allotType;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
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
