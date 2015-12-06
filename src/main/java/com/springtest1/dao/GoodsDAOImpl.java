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
import java.util.ArrayList;
import java.util.List;

public class GoodsDAOImpl extends HibernateDaoSupport implements GoodsDAO {
    public List<Goods> search(final Goods condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Goods>>() {
            public List<Goods> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Goods.class);
                if (condition != null) {

                    if (condition.getGoodsId() != null && !condition.getGoodsId().equals("")) {
                        c.add(Restrictions.eq("goodsId", condition.getGoodsId()));
                    }
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

 /*   public List getAllGoods() {         //试试左连接
        String hql = "from Goods";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }*/

    public void modifyGood(Goods good) {  //修改商品
        System.out.println("DAO里面的" + good.getService());
        super.getHibernateTemplate().update(good);
    }

    /*   public List<Goods> getGoods(String name) {    //模糊查询
           String hql = "from Goods g where g.goodsName like '" + name + "%'";
           System.out.println("GOODSDAOIMPL" + hql);
           Session session = this.getSessionFactory().getCurrentSession();
           Query query = session.createQuery(hql);
           Goods g =new Goods();
           g=(Goods) query.list().get(0);
           System.out.println(g.getGoodsName());
           return query.list();

       } */
    public List<Goods> getGoods(String name) {    //模糊查询
        String hql = "from Goods g where g.goodsName like '" + name + "%'";
        System.out.println("GOODSDAOIMPL" + hql);
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);

        List<Goods> goodslist = query.list();

        if (goodslist.size() <= 0) {
            return new ArrayList<Goods>();
        } else {
            Goods g = (Goods) query.list().get(0);
            System.out.println(g.getGoodsName());
            return goodslist;
        }
    }
}
