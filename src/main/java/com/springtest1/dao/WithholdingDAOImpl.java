package com.springtest1.dao;

import com.hibtest1.entity.Activity;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

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
}
