package com.springtest1.dao;

import com.hibtest1.entity.Storage;
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
 * Created by user on 2015/11/27.
 */
public class StorageDAOImpl extends HibernateDaoSupport implements StorageDAO {
    public List getAllStorage() {
        String hql = "from Storage";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<Storage> getCheckStorage() {     //审核查出"no"状态的单子  明天继续
        String hql = "from Storage s where s.over=0";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        List<Storage> storagelist = query.list();
        if (storagelist.size() <= 0) {
            return new ArrayList<Storage>();
        } else {
            Storage s = (Storage) query.list().get(0);
            System.out.println(s.getGoods().getGoodsId());
            return storagelist;
        }

    }

    public List<Storage> search(final Storage condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Storage>>() {
            public List<Storage> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Storage.class);
                if (condition != null) {
                    if (condition.getGoods() != null) {
                        if (condition.getGoods().getGoodsId() != null && !condition.getGoods().getGoodsId().equals("")) {
                            c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                        }
                    }
                    if (condition.getProducer() != null) {
                        if (condition.getProducer().getProducerId() != null && !condition.getProducer().getProducerId().equals("")) {
                            c.add(Restrictions.eq("producer.producerId", condition.getProducer().getProducerId()));
                        }
                    }
                    if (condition.getPlace() != null) {
                        if (condition.getPlace().getPlaceId() != null && !condition.getPlace().getPlaceId().equals("")) {
                            c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                        }
                    }
                    if (condition.getStorageId() != null && !condition.getStorageId().equals("")) {
                        c.add(Restrictions.eq("storageId", condition.getStorageId()));
                    } /* if (condition.getState() != null && !condition.getState().equals("") && condition.getCategory() != null && !condition.getCategory().equals("")) {
                        c.add(Restrictions.eq("state", condition.getState()));
                        c.add(Restrictions.eq("category", condition.getCategory()));

                    }*/
                    if (condition.getCategory() != null && !condition.getCategory().equals("")) {
                        c.add(Restrictions.eq("category", condition.getCategory()));
                    }
                    if (condition.getState() != null && !condition.getState().equals("")) {
                        c.add(Restrictions.eq("state", condition.getState()));
                    } /*else if (condition.getCategory() != null && !condition.getCategory().equals("")) {
                        c.add(Restrictions.eq("category", condition.getCategory()));
                    }*/
                    if (condition.getOver() != null /*&& !condition.getState().equals("")*/) {
                        c.add(Restrictions.eq("over", condition.getOver()));
                    }
                }
                if (c.list().size() <= 0) {
                    return new ArrayList<Storage>();
                } else {
                    return c.list();
                }

            }
        });
    }

    public void add(Storage storage) {
        super.getHibernateTemplate().save(storage);
    }

    public void editStorage(Storage storage) {
        super.getHibernateTemplate().update(storage);   //修改
    }
}
