package com.springtest1.dao;

import com.hibtest1.entity.StorageApp;
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
 * Created by user on 2015/11/26.
 */
public class StorageAppDAOImpl extends HibernateDaoSupport implements StorageAppDAO {
    public List getAllStorageApp() {
        String hql = "from StorageApp";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<StorageApp> search(final StorageApp condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<StorageApp>>() {
            public List<StorageApp> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(StorageApp.class);
                if (condition != null) {
                    System.out.println(condition.getProducerName() + "商户名称 DAOImpl");
                    if (condition.getProducerName() != null && !condition.getProducerName().equals("")) {
                        c.add(Restrictions.eq("StorageAppName", condition.getProducerName()));
                    }
                }
                return c.list();
            }
        });
    }

    public void add(StorageApp storageApp) {

        System.out.println( "商品"+storageApp.getGoodsName()+"商户"+ storageApp.getProducerName()+"库存地点"+ storageApp.getStoragePlace());
        super.getHibernateTemplate().save(storageApp);
    }

  /*  public boolean delGoods(StorageApp condition) {
        super.getHibernateTemplate().delete(condition);
        return true;
    }  */

    public void editStorageApp(StorageApp storageApp) {
        System.out.println("DAO里面的入库申请" + storageApp.getProducerName());
        super.getHibernateTemplate().update(storageApp);   //修改
    }
}
