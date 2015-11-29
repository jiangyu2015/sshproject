package com.hibtest1.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by dell on 2015/11/28.
 */
public class Activity implements Serializable {
    private Integer aid; //id
//    private  Integer activityId; //活动id
    private String activityType; //活动类型
    private Date activityDate;//活动时间
    private Integer consumeNumber; //预提消耗数量
    private String state; //活动类型
    private Withholding withholding;

    public Withholding getWithholding() {
        return withholding;
    }

    public void setWithholding(Withholding withholding) {
        this.withholding = withholding;
    }

    public Activity(){}
    public Activity (String activityType, Date activityDate, Integer consumeNumber, Integer activityId){
        this.activityType = activityType;
        this.activityDate = activityDate;
        this.consumeNumber = consumeNumber;
    }
    public Activity(String activityType, Date activityDate, Integer consumeNumber,  Integer activityId,String state) {
        this.activityType = activityType;
        this.activityDate = activityDate;
        this.consumeNumber = consumeNumber;
        this.state = state;

    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

  /*  public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }*/

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public Date getActivityDate() {
        return activityDate;
    }

    public void setActivityDate(Date activityDate) {
        this.activityDate = activityDate;
    }

    public Integer getConsumeNumber() {
        return consumeNumber;
    }

    public void setConsumeNumber(Integer consumeNumber) {
        this.consumeNumber = consumeNumber;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
