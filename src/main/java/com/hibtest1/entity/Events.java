package com.hibtest1.entity;

/**
 * Created by user on 2015/12/8.
 */
public class Events implements java.io.Serializable {
    private Integer eventId;
    private String eventName;
    private String activityId;
    private String remark;

    public System getUserName() {
        return userName;
    }

    public void setUserName(System userName) {
        this.userName = userName;
    }

    private System userName;

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
