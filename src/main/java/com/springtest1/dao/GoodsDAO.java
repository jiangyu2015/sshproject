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

    public List getAllGoods();  //查询所有

    public void modifyGood(Goods good); //修改商品

   public List<Goods> getGoods(String name);  //模糊查询

    public List<Goods> getGoodsCheck();  //选出ok的商品

    public List<Goods> isGoods(final Goods condition); //查是否已有

    public List<Goods> getOverdueGoods();  //看是否过期

    public List<Goods> getOverGoods();

    /** *//**
     * 分页查询
     * @param hql 查询的条件
     * @param offset 开始记录
     * @param length 一次查询几条记录
     * @return
     */
    public List queryForPage(final String hql, final int offset, final int length);

/** *//**
     * 查询所有记录数
     * @param hql 查询的条件
     * @return 总记录数
     */
    public int getAllRowCount(String hql);
}
