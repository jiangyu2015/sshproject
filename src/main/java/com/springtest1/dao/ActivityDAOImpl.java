package com.springtest1.dao;

import com.hibtest1.entity.Activity;
import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by dell on 2015/11/29.
 */
public class ActivityDAOImpl extends HibernateDaoSupport implements ActivityDAO{
    public List<Activity> getAllActivity(){
//      String sql = "select * from  Activity   LEFT JOIN  Withholding as yt on yt.activityId= Activity.activityId ";
  //      Session session = this.getSessionFactory().getCurrentSession();
    //    Query query = session.createSQLQuery(sql);
        String hql = "from Activity";
        org.hibernate.Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();


    }
}
