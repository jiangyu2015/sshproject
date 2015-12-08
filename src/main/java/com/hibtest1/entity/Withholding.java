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
    private Goods goods;
    private Date witholdingDate;//预提时间
    private Date deteline; //截止时间
    private  Integer eventId; //活动id
    private  Integer witholdingNumber;  //预提数
    private String useType; //使用类型
    private String userName;  //要和user表连


    public Date getDeteline() {
        return deteline;
    }

    public void setDeteline(Date deteline) {
        this.deteline = deteline;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
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


}
