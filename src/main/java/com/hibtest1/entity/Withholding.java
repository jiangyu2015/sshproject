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
    private Integer placeId; //仓库id
    private Integer goodsId; //商品id
    private Date witholdingDate;//预提时间
    private Date deadline; //截止时间
//    private  Integer activityId; //活动id
    private  Integer witholdingNumber;  //预提数
    private String useType; //使用类型
  /*  private Set bks=new HashSet();
    public Set getBks() {
        return bks;
    }

    public void setBks(Set bks) {
        this.bks = bks;
    }  */


    public Integer getWithholdingId() {
        return withholdingId;
    }

    public void setWithholdingId(Integer withholdingId) {
        this.withholdingId = withholdingId;
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

    public Date getWitholdingDate() {
        return witholdingDate;
    }

    public void setWitholdingDate(Date witholdingDate) {
        this.witholdingDate = witholdingDate;
    }

  /*  public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }  */

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

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
}
