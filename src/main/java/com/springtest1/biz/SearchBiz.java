package com.springtest1.biz;

import com.dto.CommodityDto;

import java.util.List;

/**
 * Created by dell on 2015/12/6.
 */
public interface SearchBiz  {
    public List<CommodityDto> searchInventoryFlow();
    public List<CommodityDto> searchInventoryFlowGoods(String goodsName); //带商品
    public List<CommodityDto> searchAll();
}
