package com.hibtest1.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;

/**
 * Created by dell on 2015/11/28.
 */
public class Withholding implements Serializable {
    private Integer withholdingId; //id
    private Place place;
    private Producer producer;
    private Goods goods;
    private Date witholdingDate;//预提时间
    private Date deteline; //截止时间
    //  private  Integer eventId; //活动id
    private Integer witholdingNumber;  //预提数
    private String useType; //使用类型
    private String userName;  //要和user表连
    private String events;//事件
    private String activityId;//活动id
    private String unit;//单位
    private String adduser; //添加人
    private Integer timeId;//判断今天的标记查询用

    public Integer getTimeId() {
        return timeId;
    }

    public void setTimeId(Integer timeId) {
        this.timeId = timeId;
    }

    public Producer getProducer() {
        return producer;
    }

    public void setProducer(Producer producer) {
        this.producer = producer;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getEvents() {
        return events;
    }

    public void setEvents(String events) {
        this.events = events;
    }

    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }

    public Date getDeteline() {
        return deteline;
    }

    public void setDeteline(Date deteline) {
        this.deteline = deteline;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public Integer getWithholdingId() {
        return withholdingId;
    }

    public void setWithholdingId(Integer withholdingId) {
        this.withholdingId = withholdingId;
    }

    public Date getWitholdingDate() {
        return witholdingDate;
    }

    public void setWitholdingDate(Date witholdingDate) {
        this.witholdingDate = witholdingDate;
    }

    public Integer getWitholdingNumber() {
        return witholdingNumber;
    }

    public void setWitholdingNumber(Integer witholdingNumber) {
        this.witholdingNumber = witholdingNumber;
    }

    public String getUseType() {
        return useType;
    }

    public void setUseType(String useType) {
        this.useType = useType;
    }

    public String getAdduser() {
        return adduser;
    }

    public void setAdduser(String adduser) {
        this.adduser = adduser;
    }
}
