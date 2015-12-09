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

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    private String producerName;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    private String type; //活动类型;
    private Date firstStorageTime; //初次入库时间

    public BigDecimal getExpectNumber() {
        return expectNumber;
    }

    public void setExpectNumber(BigDecimal expectNumber) {
        this.expectNumber = expectNumber;
    }

    private BigDecimal expectNumber;//应收数量expect_rk_number

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
