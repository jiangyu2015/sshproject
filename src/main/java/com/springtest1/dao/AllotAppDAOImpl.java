package com.springtest1.dao;
import com.hibtest1.entity.AllotApp;
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
 * Created by user on 2015/12/25.
 */
public class AllotAppDAOImpl extends HibernateDaoSupport implements AllotAppDAO{
    public List getAllAllotApp() {
        String hql = "from AllotApp";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<AllotApp> getCheckAllotApp() {     //审核查出"no"状态的单子
        String hql = "from AllotApp sa where sa.state='no'";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        List<AllotApp> storageapplist = query.list();
        if (storageapplist.size() <= 0) {
            return new ArrayList<AllotApp>();
        } else {
            AllotApp sa = (AllotApp) query.list().get(0);
            return storageapplist;
        }
    }

    public List<AllotApp> search(final AllotApp condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<AllotApp>>() {
            public List<AllotApp> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(AllotApp.class);
                if (condition != null) {
                    if (condition.getAllotAppId() != null && !condition.getAllotAppId().equals("")) {
                        System.out.println("DAO" + condition.getAllotAppId());
                        c.add(Restrictions.eq("allotAppId", condition.getAllotAppId()));
                    }else if (condition.getState() != null && !condition.getState().equals("")) {
                        c.add(Restrictions.eq("state", condition.getState()));
                    }
                }
                if (c.list().size() <= 0) {
                    return new ArrayList<AllotApp>();
                } else {
                    return c.list();
                }
            }
        });
    }

    public void add(AllotApp allotApp) {
        super.getHibernateTemplate().save(allotApp);
    }

    public void editAllotApp(AllotApp allotApp) {
        super.getHibernateTemplate().update(allotApp);   //修改
    }

}
