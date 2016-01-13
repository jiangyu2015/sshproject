package com.springtest1.biz;

import com.hibtest1.entity.Goods;
import com.springtest1.dao.GoodsDAO;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

public class GoodsBizImpl implements GoodsBiz {
    private GoodsDAO goodsDAO;

    public void setGoodsDAO(GoodsDAO goodsDAO) {
        this.goodsDAO = goodsDAO;
    }

    public List <Goods>getGoodsList(Goods condition) {

        List <Goods>list = goodsDAO.search(condition);
        return list;
    }

    public void add(Goods condition) {
        goodsDAO.add(condition);
    }

    public boolean delGoods(Goods good) {
        return goodsDAO.delGoods(good);
    }

    @Transactional
    public List getAllGoods() {
        return goodsDAO.getAllGoods();
    }

    public boolean modifyGood(Goods good) {
        goodsDAO.modifyGood(good);
        return true;
    }

    @Transactional
    public List<Goods> getGoods(String name) {
        return goodsDAO.getGoods(name);
    }

    @Transactional
    public List<Goods> getGoodsCheck() {
        return goodsDAO.getGoodsCheck();
    }

    @Transactional
    public List<Goods> isGoods(final Goods condition) {
        return goodsDAO.isGoods(condition);
    }

    @Transactional
    public List<Goods> getOverdueGoods() {
        return goodsDAO.getOverdueGoods();
    }
}
