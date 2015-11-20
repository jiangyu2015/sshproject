package com.springtest1.biz;

import com.hibtest1.entity.Goods;
import com.springtest1.dao.GoodsDAO;

import java.io.Serializable;
import java.util.List;

public class GoodsBizImpl implements GoodsBiz{
	private GoodsDAO goodsDAO;
	public void setGoodsDAO(GoodsDAO goodsDAO){
		this.goodsDAO=goodsDAO;
	}
	public List getGoodsList(Goods condition){
		 
		List list=goodsDAO.search(condition);
		return list;
	}
	
/*	public Serializable add(Goods condition){
		return goodsDAO.add(condition);
	}  */
     public void add(Goods condition){
		 goodsDAO.add(condition);
	 }

}
