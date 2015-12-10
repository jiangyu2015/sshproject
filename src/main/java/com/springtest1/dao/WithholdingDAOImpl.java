package com.springtest1.dao;

import com.hibtest1.entity.Withholding;
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
 * Created by dell on 2015/11/29.
 */
public class WithholdingDAOImpl extends HibernateDaoSupport implements WithholdingDAO {
    /* public List getAllWithholding(){
         Activity activity=(Activity) super.getClass(Activity.class, new Integer(1));
         protected Object get(Class cla,Serializable id){
             Object object=null;
             Session session=HibernateSessionFactory.getSession();
             try{
                 object=session.get(cla, id);
             }catch (Exception e) {
                 e.printStackTrace();
             }finally{
                 session.close();
             }
             return object;
         }
         System.out.println("活动编号为1的活动预提id"+activity.getWithholding().getWithholdingId().toString());

     }*/
 /*   public List getAllWithholding() {
        String sql = "select * from  Activity LEFT JOIN Withholding as yt on yt.activityId= Activity.activityId ";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(sql);
        return query.list();
    }*/
    public void add(Withholding withholding) {
        super.getHibernateTemplate().save(withholding);
    }

    public List<Withholding> getAllWithholding() {
        String hql = "from Withholding";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<Withholding> search(final Withholding condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Withholding>>() {
            public List<Withholding> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Withholding.class);
                if (condition != null) {
                    if (condition.getGoods() != null) {
                        if (condition.getGoods().getGoodsId() != null && !condition.getGoods().getGoodsId().equals("")) {
                            System.out.println("1");
                            c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                        }
                    } else if (condition.getPlace() != null) {
                        if (condition.getPlace().getPlaceId() != null && !condition.getPlace().getPlaceId().equals("")) {
                            System.out.println("3");
                            c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                        }
                    }
                    if (condition.getWithholdingId() != null && !condition.getWithholdingId().equals("")) {
                        System.out.println("DAO" + condition.getWithholdingId());
                        c.add(Restrictions.eq("withholdingId", condition.getWithholdingId()));
                    }
                    //为了保存
                }
                return c.list();

            }
        });
    }
}
