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

    public List getGoodsList(Goods condition) {

        List list = goodsDAO.search(condition);
        return list;
    }

    /*	public Serializable add(Goods condition){
            return goodsDAO.add(condition);
        }  */
    public void add(Goods condition) {
        goodsDAO.add(condition);
    }

    public boolean delGoods(Goods good) {
        return goodsDAO.delGoods(good);
    }

    /*   public Goods getGood(String name){
           return goodsDAO.getGood(name);
       }  */
    @Transactional
    public List getAllGoods() {
        return goodsDAO.getAllGoods();
    }

    public boolean modifyGood(Goods good){
        System.out.println(good.getPrice()+"biz里面的");
        System.out.println(good.getService()+"biz里面的");
        goodsDAO.modifyGood(good);
        return true;

    }
}
