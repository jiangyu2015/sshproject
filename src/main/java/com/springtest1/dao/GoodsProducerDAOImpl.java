package com.springtest1.dao;

import com.hibtest1.entity.GoodsProducer;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by user on 2015/12/3.
 */
public class GoodsProducerDAOImpl extends HibernateDaoSupport implements GoodsProducerDAO {
    public void add(GoodsProducer goodsProducer) {
        super.getHibernateTemplate().save(goodsProducer);
    }
}
