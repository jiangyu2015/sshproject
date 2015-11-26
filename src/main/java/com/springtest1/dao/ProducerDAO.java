package com.springtest1.dao;

import com.hibtest1.entity.Producer;

import java.util.List;

/**
 * Created by user on 2015/11/25.
 */
public interface ProducerDAO {
    public List getAllProducer();
    public List search(Producer condition);   //查询
    public void add(Producer condition);//add
    public boolean delGoods(Producer condition); //del

    public void editProducer(Producer producer); //修改AllList商品

}
