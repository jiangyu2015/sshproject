package com.springtest1.dao;

import com.dto.CommodityDto;

import java.util.List;

/**
 * Created by dell on 2015/12/6.
 */
public interface SearchDAO  {
    public List<CommodityDto> searchInventoryFlow();   //查询
}
