package com.springtest1.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by dell on 2016/2/20.
 */
public class MemberDaoImpl extends HibernateDaoSupport implements MemberDao {
//省略了其他的代码　　

/** *//**
     * 分页查询
     * @param hql 查询的条件
     * @param offset 开始记录
     * @param length 一次查询几条记录
     * @return
     */
    public List queryForPage(final String hql, final int offset, final int length){
        List list = getHibernateTemplate().executeFind(new HibernateCallback(){
            public Object doInHibernate(Session session) throws HibernateException,SQLException {
                Query query = session.createQuery(hql);
                query.setFirstResult(offset);
                query.setMaxResults(length);
                List list = query.list();
                return list;
            }
        });
        return list;
    }


/** *//**
     * 查询所有记录数
     * @return 总记录数
     */
    public int getAllRowCount(String hql){
        return getHibernateTemplate().find(hql).size();
    }

}