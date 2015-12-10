package com.springtest1.dao;

import com.hibtest1.entity.Place;
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
 * Created by user on 2015/11/25.
 */
public class PlaceDAOImpl extends HibernateDaoSupport implements PlaceDAO {
    public List getAllPlace() {
        String hql = "from Place";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        Place test = (Place) query.list().get(0);
        System.out.println("123" + test.getPlaceName());
        return query.list();
    }

    public List<Place> search(final Place condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Place>>() {
            public List<Place> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Place.class);
                if (condition != null) {
                    if (condition.getPlaceName() != null && !condition.getPlaceName().equals("")) {
                        c.add(Restrictions.eq("placeName", condition.getPlaceName()));
                    }
                    if (condition.getPlaceId() != null && !condition.getPlaceId().equals("")) {
                        c.add(Restrictions.eq("placeId", condition.getPlaceId()));
                    }
                }
                return c.list();
            }
        });
    }

    public void add(Place Place) {
        super.getHibernateTemplate().save(Place);
    }

    public boolean delGoods(Place condition) {
        super.getHibernateTemplate().delete(condition);
        return true;
    }

    public List<Place> getPlace(String name) {    //模糊查询
        String hql = "from Place p where p.placeName = '" + name + "'";
        System.out.println("PlaceDAOIMPL" + hql);
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);

        List<Place> placeList = query.list();
        if (placeList.size() <= 0) {
            return new ArrayList<Place>();
        } else {
            Place p = (Place) query.list().get(0);
            System.out.println(p.getPlaceName());
            return placeList;
        }
    }
}
