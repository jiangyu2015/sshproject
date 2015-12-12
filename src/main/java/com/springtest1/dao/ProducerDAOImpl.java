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
import java.util.ArrayList;
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
                    if (condition.getProducerName() != null && !condition.getProducerName().equals("")) {
                        c.add(Restrictions.eq("producerName", condition.getProducerName()));
                    }
                    if (condition.getProducerId() != null && !condition.getProducerId().equals("")) {
                        c.add(Restrictions.eq("producerId", condition.getProducerId()));
                    }
                    if (condition.getState() != null && !condition.getState().equals("")) {
                        c.add(Restrictions.eq("state", condition.getState()));
                    }
                }
                return c.list();
            }
        });
    }

    public void add(Producer producer) {
        super.getHibernateTemplate().save(producer);
    }

    public boolean delProducer(Producer condition) {
        super.getHibernateTemplate().delete(condition);
        return true;
    }

    public void editProducer(Producer producer) {
        super.getHibernateTemplate().update(producer);   //修改
    }

    public List<Producer> getProducer(String name) {    // 查询id
        String hql = "from Producer p where p.producerName = '" + name + "'";
        System.out.println("ProducerDAOIMPL" + hql);
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);

        List<Producer> producerList = query.list();
        if (producerList.size() <= 0) {
            return new ArrayList<Producer>();
        } else {
            Producer p = (Producer) query.list().get(0);
            System.out.println(p.getProducerName());
            return producerList;
        }
    }
    public List<Producer> getProducerCheck() {    //state=“yesok”
        String hql = "from Producer g where g.state='yesok'";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        List<Producer> producerlist = query.list();
        if (producerlist.size() <= 0) return new ArrayList<Producer>();
        else {
            Producer g = (Producer) query.list().get(0);
            System.out.println(g.getProducerName());
            return producerlist;
        }
    }



}
