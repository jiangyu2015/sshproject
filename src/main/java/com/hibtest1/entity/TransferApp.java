package com.hibtest1.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by user on 2015/12/25.
 */
public class TransferApp implements Serializable {
    private Integer transferAppId; //id
    private Goods goods;
    private Producer producer;
    private Place place;
    private  String typeIn; //转变的类型
    private  String typeOut; //原来的类型
    private Integer transferNumber; //转库数量
    private Date auditTime; //审核时间
    private String adduser; //添加人
    private String edituser; //修改人
    private String checkuser; //审核人
    private String state = "no";  //处理状态
    private Date applicationDate; //申请录入时间
    private Date  expectDate; //期望日期

    public Date getExpectDate() {
        return expectDate;
    }

    public void setExpectDate(Date expectDate) {
        this.expectDate = expectDate;
    }

    public Date getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(Date applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getTransferAppId() {
        return transferAppId;
    }

    public void setTransferAppId(Integer transferAppId) {
        this.transferAppId = transferAppId;
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

    public String getTypeIn() {
        return typeIn;
    }

    public void setTypeIn(String typeIn) {
        this.typeIn = typeIn;
    }

    public Integer getTransferNumber() {
        return transferNumber;
    }

    public void setTransferNumber(Integer transferNumber) {
        this.transferNumber = transferNumber;
    }

    public String getTypeOut() {
        return typeOut;
    }

    public void setTypeOut(String typeOut) {
        this.typeOut = typeOut;
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
