package com.dto;

/**
 * jiangyukun on 2015-12-07 10:59
 */
public class CommodityDto {
    private Integer id;
    private Integer goodsId;
    private String place;
    private String firstStorageTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getFirstStorageTime() {
        return firstStorageTime;
    }

    public void setFirstStorageTime(String firstStorageTime) {
        this.firstStorageTime = firstStorageTime;
    }
}
