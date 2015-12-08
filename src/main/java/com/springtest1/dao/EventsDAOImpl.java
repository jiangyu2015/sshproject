package com.springtest1.dao;

import com.hibtest1.entity.Events;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by user on 2015/12/8.
 */
public class EventsDAOImpl extends HibernateDaoSupport implements EventsDAO {
    public void add(Events events) {    //预提事件填写增加
        super.getHibernateTemplate().save(events);
    }
}
