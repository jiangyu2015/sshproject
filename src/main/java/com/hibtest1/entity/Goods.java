package com.hibtest1.entity;

import java.util.Date;

public class Goods implements java.io.Serializable {
    private Integer goodsId;
    private String goodsName;
    private String goodsBackName;
    private Float value;
    private Float price;
    private Float length;
    private Float wide;
    private Float tall;
    private Float mweight;
    private Float volume;
    private Float vweight;
    private String standard;
    private String unit;
    private String service;
    private Date creationDate;
    private Integer baozhiqi;
    private Date expirationDate;
    private String state;
    private Date auditTime; //审核时间
    private String adduser; //添加人
    private String edituser; //修改人
    private String checkuser; //审核人
    private String commodityRating; //商品评级

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsBackName() {
        return goodsBackName;
    }

    public void setGoodsBackName(String goodsBackName) {
        this.goodsBackName = goodsBackName;
    }

    public Float getValue() {
        return value;
    }

    public void setValue(Float value) {
        this.value = value;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getLength() {
        return length;
    }

    public void setLength(Float length) {
        this.length = length;
    }

    public Float getWide() {
        return wide;
    }

    public void setWide(Float wide) {
        this.wide = wide;
    }

    public Float getTall() {
        return tall;
    }

    public void setTall(Float tall) {
        this.tall = tall;
    }

    public Float getMweight() {
        return mweight;
    }

    public void setMweight(Float mweight) {
        this.mweight = mweight;
    }

    public Float getVolume() {
        return volume;
    }

    public void setVolume(Float volume) {
        this.volume = volume;
    }

    public Float getVweight() {
        return vweight;
    }

    public void setVweight(Float vweight) {
        this.vweight = vweight;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Integer getBaozhiqi() {
        return baozhiqi;
    }

    public void setBaozhiqi(Integer baozhiqi) {
        this.baozhiqi = baozhiqi;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
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

    public String getCommodityRating() {
        return commodityRating;
    }

    public void setCommodityRating(String commodityRating) {
        this.commodityRating = commodityRating;
    }
}
