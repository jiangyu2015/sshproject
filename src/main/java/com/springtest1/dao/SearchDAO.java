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
    public List<CommodityDto> searchWithholding(Integer goodsId,Integer producerId,Integer placeId,String type);

    /** *//**
     * 分页查询
     * @param hql 查询的条件
     * @param offset 开始记录
     * @param length 一次查询几条记录
     * @return
     */
    public List<CommodityDto> queryForPage(final String hql, final int offset, final int length);

/** *//**
     * 查询所有记录数
     * @param hql 查询的条件
     * @return 总记录数
     */
    public int getAllRowCount(String hql);


}
