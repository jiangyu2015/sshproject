package com.dto;

/**
 * 入库申请Dto
 * jiangyukun on 2015-12-03 15:40
 */
public class EnteringWarehouseDto {
    private String goodsId;
    private String producerId;
    private String storagePlaceId;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getProducerId() {
        return producerId;
    }

    public void setProducerId(String producerId) {
        this.producerId = producerId;
    }

    public String getStoragePlaceId() {
        return storagePlaceId;
    }

    public void setStoragePlaceId(String storagePlaceId) {
        this.storagePlaceId = storagePlaceId;
    }
}
