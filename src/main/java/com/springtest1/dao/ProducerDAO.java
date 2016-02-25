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
   /* public boolean delProducer(Producer condition); //del*/

    public void editProducer(Producer producer); //修改
    public List<Producer> getProducer(String name);  //模糊查询

    public List<Producer> getProducerCheck();

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
