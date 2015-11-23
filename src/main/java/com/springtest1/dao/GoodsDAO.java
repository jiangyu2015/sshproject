package com.springtest1.dao;

import com.hibtest1.entity.Goods;

import java.io.Serializable;
import java.util.List;

public interface GoodsDAO {
    public List search(Goods condition);   //查询

    //	public Serializable add(Goods condition);
    public void add(Goods condition); //添加商品

    public boolean delGoods(Goods condition);

 //   public Goods getGood(String name);

    public List getAllGoods();

    public  void modifyGood(Goods good); //修改商品


}
