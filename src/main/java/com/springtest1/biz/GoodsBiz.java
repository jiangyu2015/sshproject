package com.springtest1.biz;

import com.hibtest1.entity.Goods;

import java.io.Serializable;
import java.util.List;

public interface GoodsBiz {
    public List getGoodsList(Goods condition);

    //public Serializable add(Goods condition);
    public void add(Goods condition);
}
