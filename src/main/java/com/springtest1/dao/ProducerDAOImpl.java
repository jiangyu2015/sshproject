package com.springtest1.dao;

import com.hibtest1.entity.Producer;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by user on 2015/11/25.
 */
public class ProducerDAOImpl extends HibernateDaoSupport implements ProducerDAO {
    public List getAllProducer() {
        String hql = "from Producer";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<Producer> search(final Producer condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Producer>>() {
            public List<Producer> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Producer.class);
                if (condition != null) {
                    System.out.println(condition.getProducerName() + "商户名称 DAOImpl");
                    if (condition.getProducerName() != null && !condition.getProducerName().equals("")) {
                        c.add(Restrictions.eq("producerName", condition.getProducerName()));
                    }
                }
                return c.list();
            }
        });
    }

    public void add(Producer producer) {
        super.getHibernateTemplate().save(producer);
    }

    public boolean delGoods(Producer condition) {
        super.getHibernateTemplate().delete(condition);
        return true;
    }

    public void editProducer(Producer producer) {
        System.out.println("DAO里面的"+producer.getProducerName());
        super.getHibernateTemplate().update(producer);   //修改
    }


}
