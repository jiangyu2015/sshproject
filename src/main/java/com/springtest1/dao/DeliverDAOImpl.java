package com.springtest1.dao;

import com.hibtest1.entity.Deliver;
import com.hibtest1.entity.Deliver;
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
 * Created by user on 2015/11/27.
 */
public class DeliverDAOImpl extends HibernateDaoSupport implements DeliverDAO {
    public List getAllDeliver() {
        String hql = "from Deliver";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<Deliver> search(final Deliver condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Deliver>>() {
            public List<Deliver> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Deliver.class);
                if (condition != null) {
                    System.out.println(condition.getGoodsId() + "出库商品id DAOImpl");
                    if (condition.getGoodsId() != null && !condition.getGoodsId().equals("")) {
                        c.add(Restrictions.eq("DeliverName", condition.getGoodsId()));
                    }
                }
                return c.list();
            }
        });
    }

    public void add(Deliver deliver) {
        System.out.println("商品" + deliver.getGoodsId() + "库存地点" + deliver.getPlaceId());
        super.getHibernateTemplate().save(deliver);
    }

  /*  public boolean delGoods(Deliver condition) {
        super.getHibernateTemplate().delete(condition);
        return true;
    }  */

    public void editDeliver(Deliver deliver) {
        System.out.println("DAO里面的入库申请" + deliver.getPlaceId());
        super.getHibernateTemplate().update(deliver);   //修改
    }
}