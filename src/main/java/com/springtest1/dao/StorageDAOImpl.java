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

    public List<Storage> search(final Storage condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Storage>>() {
            public List<Storage> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Storage.class);
                if (condition != null) {
                    System.out.println(condition.getGoodsId() + "入库商品id DAOImpl");
                    if (condition.getGoodsId() != null && !condition.getGoodsId().equals("")) {
                        c.add(Restrictions.eq("StorageName", condition.getGoodsId()));
                    }
                }
                return c.list();
            }
        });
    }

    public void add(Storage storage) {

        System.out.println("商品" + storage.getGoodsId() + "库存地点" + storage.getPlaceId());
        super.getHibernateTemplate().save(storage);
    }

  /*  public boolean delGoods(Storage condition) {
        super.getHibernateTemplate().delete(condition);
        return true;
    }  */

    public void editStorage(Storage storage) {
        System.out.println("DAO里面的入库申请" + storage.getPlaceId());
        super.getHibernateTemplate().update(storage);   //修改
    }
}