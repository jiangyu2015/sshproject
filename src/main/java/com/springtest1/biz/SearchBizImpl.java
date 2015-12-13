package com.springtest1.biz;

import com.dto.CommodityDto;
import com.springtest1.dao.SearchDAO;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dell on 2015/12/6.
 */
public class SearchBizImpl extends HibernateDaoSupport implements SearchBiz {
    private SearchDAO searchDAO;

    public void setSearchDAO(SearchDAO searchDAO) {
        this.searchDAO = searchDAO;
    }

    @Transactional
    public List<CommodityDto> searchInventoryFlow(){
        return searchDAO.searchInventoryFlow();

    }
    @Transactional
    public List<CommodityDto> searchInventoryFlowGoods(String goodsName){
        return searchDAO.searchInventoryFlowGoods(goodsName);
    }
    @Transactional
    public List<CommodityDto> searchAll(){
        return searchDAO.searchAll();  //
    }
}
