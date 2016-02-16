package com.springtest1.biz;

import java.util.List;


import com.hibtest1.entity.Producer;

/**
 * Created by user on 2015/11/25.
 */
public interface ProducerBiz {
    public List getAllProducer();

    public List <Producer>getProducerList(Producer condition);

    public void add(Producer condition);

   /* public boolean delProducer(Producer producer);  //删除x*/

    public boolean editProducer(Producer producer); //修改AllList商品

     public List<Producer> getProducer(String name);

    public List<Producer> getProducerCheck();
}
