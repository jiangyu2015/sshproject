package com.dto;

import java.math.BigDecimal;
import java.util.Date;

/**
 * jiangyukun on 2015-12-07 10:59
 */
public class CommodityDto {
    private Integer id;
  /*  private Integer goodsId;
    private Integer placeId;*/

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    private String goodsName;
    private String placeName;

    private Date firstStorageTime; //初次入库时间

    private Integer firstStorageNumber;  //初次入库数量
    private BigDecimal totolStorage;  //总入库数
    private BigDecimal totolDeliver;//总出库数
    private BigDecimal carryingExcessInventory;//账面剩余库存数


    public Integer getFirstStorageNumber() {
        return firstStorageNumber;
    }

    public void setFirstStorageNumber(Integer firstStorageNumber) {
        this.firstStorageNumber = firstStorageNumber;
    }

    public BigDecimal getTotolStorage() {
        return totolStorage;
    }

    public void setTotolStorage(BigDecimal totolStorage) {
        this.totolStorage = totolStorage;
    }

    public BigDecimal getTotolDeliver() {
        return totolDeliver;
    }

    public void setTotolDeliver(BigDecimal totolDeliver) {
        this.totolDeliver = totolDeliver;
    }

    public BigDecimal getCarryingExcessInventory() {
        return carryingExcessInventory;
    }

    public void setCarryingExcessInventory(BigDecimal carryingExcessInventory) {
        this.carryingExcessInventory = carryingExcessInventory;
    }

  /*  public Integer getTotolStorage() {
        return totolStorage;
    }

    public void setTotolStorage(Integer totolStorage) {
        this.totolStorage = totolStorage;
    }

    public Integer getTotolDeliver() {

        return totolDeliver;
    }

    public void setTotolDeliver(Integer totolDeliver) {
        this.totolDeliver = totolDeliver;
    }*/

  /*  public Integer getCarryingExcessInventory() {
        return carryingExcessInventory;
    }

    public void setCarryingExcessInventory(Integer carryingExcessInventory) {
        this.carryingExcessInventory = carryingExcessInventory;
    }*/


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFirstStorageTime() {
        return firstStorageTime;
    }

    public void setFirstStorageTime(Date firstStorageTime) {
        this.firstStorageTime = firstStorageTime;
    }
    }