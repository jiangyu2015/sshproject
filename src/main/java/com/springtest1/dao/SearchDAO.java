package com.springtest1.dao;

import com.dto.CommodityDto;

import java.util.List;

/**
 * Created by dell on 2015/12/6.
 */
public interface SearchDAO  {
    public List<CommodityDto> searchInventoryFlow();   //查询没有预提的库存流动

    public List<CommodityDto> searchInventoryFlowGoods(String goodsName);  //查询商品的库存流动

    public List<CommodityDto> searchAll(); //查所有
    public List<CommodityDto> searchAllGoods(String goodsName);
}
