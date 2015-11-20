package com.springtest1.dao;

import com.hibtest1.entity.Goods;

import java.io.Serializable;
import java.util.List;

public interface GoodsDAO {
	public List search(Goods condition);
//	public Serializable add(Goods condition);
    public void add(Goods condition);

}
