package com.springtest1.biz;

import com.hibtest1.entity.Goods;
import com.hibtest1.pageBean.PageBean;

import java.io.Serializable;
import java.util.List;

public interface GoodsBiz {
    public List<Goods> getGoodsList(Goods condition);

    public void add(Goods condition);

    public boolean delGoods(Goods good);  //删除

    public List getAllGoods();

    public boolean modifyGood(Goods good);

    public List<Goods> getGoods(String name);

    public List<Goods> getGoodsCheck();

    public List<Goods> isGoods(final Goods condition);

    public List<Goods> getOverdueGoods();

    public List<Goods> getOverGoods();

    public PageBean queryForPage(int pageSize,int page);
}
