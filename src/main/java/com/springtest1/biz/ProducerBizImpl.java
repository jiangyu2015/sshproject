package com.springtest1.biz;

import com.hibtest1.entity.Producer;
import com.springtest1.dao.ProducerDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/11/25.
 */
public class ProducerBizImpl implements ProducerBiz {
    private ProducerDAO producerDAO;

    public void setProducerDAO(ProducerDAO producerDAO) {
        this.producerDAO = producerDAO;
    }

    @Transactional
    public List getAllProducer() {
        return producerDAO.getAllProducer();
    }

    public List getProducerList(Producer condition) {
        List list = producerDAO.search(condition);
        return list;
    }

    public void add(Producer condition) {
        producerDAO.add(condition);
    }

    public boolean delProducer(Producer producer) {
        return producerDAO.delProducer(producer);
    }

    public boolean editProducer(Producer producer) {
        System.out.println("biz里面的" + producer.getProducerName());
        producerDAO.editProducer(producer);
        return true;
    } //修改AllList商品

    @Transactional
    public List<Producer> getProducer(String name) {
        return producerDAO.getProducer(name);
    }
}
