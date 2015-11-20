package com.springtest1.dao;

import com.hibtest1.entity.Goods;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
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
/*    public List search(final Goods condition) {

		System.out.println(condition.getGoodsName()+"123");
		List goodslist=this.getHibernateTemplate().find("from Goods where goodsName ="+condition.getGoodsName());
		return goodslist;

    }*/
/*	public Serializable add(final Goods condition) {
        return super.getHibernateTemplate().execute(
				new HibernateCallback<Serializable>() {
					public Serializable doInHibernate(Session session)
							throws HibernateException, SQLException {
						Transaction trans = session.beginTransaction();
						Serializable id = null;
						try {
							Goods good = new Goods();
							good.setGoodsName(condition.getGoodsName());
							good.setBaozhiqi(condition.getBaozhiqi());
							good.setCreationDate(condition.getCreationDate());
							good.setExpirationDate(condition.getExpirationDate());
							good.setGoodsBackName(condition.getGoodsBackName());
							good.setLength(condition.getLength());
							good.setMweight(condition.getMweight());
							good.setPrice(condition.getPrice());
							good.setService(condition.getService());
							good.setStandard(condition.getStandard());
							good.setTall(condition.getTall());
							good.setUnit(condition.getUnit());
							good.setValue(condition.getValue());
							good.setVolume(condition.getVolume());
							good.setVweight(condition.getVweight());
							good.setWide(condition.getWide());
							super.getHibernateTemplate().save(good);
							id = session.save(good);
							trans.commit();
						} catch (Exception ex) {
							ex.printStackTrace();
							trans.rollback();
						} finally {
							session.close();
						}
						return id;
					}
				});
	}	 

} */


    public void add(Goods good) {
        super.getHibernateTemplate().save(good);
    }

}
