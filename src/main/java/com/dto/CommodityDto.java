package com.dto;

import java.math.BigDecimal;
import java.util.Date;

/**
 * jiangyukun on 2015-12-07 10:59
 */
public class CommodityDto {
    private Integer id;
    private Integer goodsId;
    private Integer placeId;
    private Integer producerId;
    private String goodsName;
    private String placeName;
    private String type; //活动类型;
    private Date firstStorageTime; //初次入库时间
    private String producerName;
    private BigDecimal expectNumber;//应收数量expect_rk_number
    private Integer firstStorageNumber;  //初次入库数量
    private BigDecimal totolStorage;  //总入库数
    private BigDecimal totolDeliver;//总出库数
    private BigDecimal carryingExcessInventory;//账面剩余库存数

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Integer placeId) {
        this.placeId = placeId;
    }

    public Integer getProducerId() {
        return producerId;
    }

    public void setProducerId(Integer producerId) {
        this.producerId = producerId;
    }

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

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public BigDecimal getExpectNumber() {
        return expectNumber;
    }

    public void setExpectNumber(BigDecimal expectNumber) {
        this.expectNumber = expectNumber;
    }
    public Integer getFirstStorageNumber() {
        return firstStorageNumber;
    }

    private BigDecimal withholdingNumber; //预提数
    private BigDecimal withholdingConsume;//预提消耗数
    private BigDecimal surplusWithholdingNumber;//剩余预提数
    private BigDecimal AvailableInventory;//预提后可用库存

    public BigDecimal getWithholdingNumber() {
        return withholdingNumber;
    }

    public void setWithholdingNumber(BigDecimal withholdingNumber) {
        this.withholdingNumber = withholdingNumber;
    }

    public BigDecimal getWithholdingConsume() {
        return withholdingConsume;
    }

    public void setWithholdingConsume(BigDecimal withholdingConsume) {
        this.withholdingConsume = withholdingConsume;
    }

    public BigDecimal getSurplusWithholdingNumber() {
        return surplusWithholdingNumber;
    }

    public void setSurplusWithholdingNumber(BigDecimal surplusWithholdingNumber) {
        this.surplusWithholdingNumber = surplusWithholdingNumber;
    }

    public BigDecimal getAvailableInventory() {
        return AvailableInventory;
    }

    public void setAvailableInventory(BigDecimal availableInventory) {
        AvailableInventory = availableInventory;
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
