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

    public List<Storage> getCheckStorage() {     //审核查出"no"状态的单子
        String hql = "from Storage s where s.state='no'";
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
                            System.out.println("1");
                            c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                        }
                    } else if (condition.getProducer() != null) {
                        if (condition.getProducer().getProducerId() != null && !condition.getProducer().getProducerId().equals("")) {
                            System.out.println("2");
                            c.add(Restrictions.eq("producer.producerId", condition.getProducer().getProducerId()));
                        }
                    } else if (condition.getPlace() != null) {
                        if (condition.getPlace().getPlaceId() != null && !condition.getPlace().getPlaceId().equals("")) {
                            System.out.println("3");
                            c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                        }
                    }
                    if (condition.getStorageId() != null && !condition.getStorageId().equals("")) {
                        System.out.println("DAO" + condition.getStorageId());
                        c.add(Restrictions.eq("storageId", condition.getStorageId()));
                    }
                }
                return c.list();

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
