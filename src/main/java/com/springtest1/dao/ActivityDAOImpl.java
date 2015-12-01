package com.springtest1.dao;

import com.hibtest1.entity.Activity;
import com.hibtest1.entity.Withholding;
import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by dell on 2015/11/29.
 */
public class ActivityDAOImpl extends HibernateDaoSupport implements ActivityDAO {
    public List<Activity> getAllActivity() {
   /*   String sql = "select * from  Activity  as a LEFT JOIN  yt_application as yt on yt.hd_id= a.hd_id ";
         Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createSQLQuery(sql);  */
        String hql = "from Activity";
        org.hibernate.Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        Activity activity = (Activity) query.list().get(0);
        System.out.println(activity.getWithholding().getActivityId() + "ActivityDAOImpl");
        return query.list();


    }
}
