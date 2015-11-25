package com.springtest1.dao;

import com.hibtest1.entity.Goods;
import com.hibtest1.entity.Producer;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

public class GoodsDAOImpl extends HibernateDaoSupport implements GoodsDAO {
    public List<Goods> search(final Goods condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Goods>>() {
            public List<Goods> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Goods.class);
                if (condition != null) {
                    System.out.println(condition.getGoodsName() + "123");
                    if (condition.getGoodsName() != null && !condition.getGoodsName().equals("")) {
                        c.add(Restrictions.eq("goodsName", condition.getGoodsName()));
                    }
                }
                return c.list();
            }
        });
    }

    public void add(Goods good) {
        super.getHibernateTemplate().save(good);
    }

    public boolean delGoods(Goods condition) {
        super.getHibernateTemplate().delete(condition);
        return true;
    }

    //   public Goods getGood(String name) {
    //      return (Goods) super.getHibernateTemplate().get(Goods.class, name);
    //   }

    public List getAllGoods() {
        String hql = "from Goods";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public  void modifyGood(Goods good){  //修改商品
        System.out.println("DAO里面的"+good.getService());
        super.getHibernateTemplate().update(good);
    };
}
