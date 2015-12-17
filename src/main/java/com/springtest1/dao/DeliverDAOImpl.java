package com.springtest1.dao;

import com.dto.CommodityDto;
import com.hibtest1.entity.Deliver;
import com.hibtest1.entity.Deliver;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by user on 2015/11/27.
 */
public class DeliverDAOImpl extends HibernateDaoSupport implements DeliverDAO {
    public List<Deliver> getAllDeliver() {
        String hql = "from Deliver";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<Deliver> search(final Deliver condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<Deliver>>() {
            public List<Deliver> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(Deliver.class);
                if (condition != null) {
                    if (condition.getDeliverId() != null && !condition.getDeliverId().equals("")) {
                        c.add(Restrictions.eq("deliverId", condition.getDeliverId()));
                    }
                    if (condition.getWithholding() != null) {   //通过预提id查询所有的出库明细
                        if (condition.getWithholding().getWithholdingId() != null && !condition.getWithholding().getWithholdingId().equals("")) {
                            c.add(Restrictions.eq("withholding.withholdingId", condition.getWithholding().getWithholdingId()));
                        }
                    }
                }
                if (c.list().size() <= 0) {
                    return new ArrayList<Deliver>();
                } else {
                    return c.list();
                }
            }
        });
    }

    public void add(Deliver deliver) {
        super.getHibernateTemplate().save(deliver);
    }

    public void editDeliver(Deliver deliver) {
        super.getHibernateTemplate().update(deliver);   //修改
    }

    public List<Deliver> searchWithholdingDeliver(Integer withholdingId){   //查询预提id对应的所有消耗
        String sql = "select sum(ck_number) FROM ck_detail GROUP BY yt_id HAVING yt_id=" +withholdingId;
        Session session = this.getSessionFactory().getCurrentSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        List<BigDecimal> list = sqlQuery.list();
        System.out.println("DAO" + list.size());
        List<Deliver> delivers = new ArrayList<>(list.size());
        for (int i = 0; i < list.size(); i++) {
            BigDecimal row = list.get(0);
            System.out.println(row);
            Deliver deliver = new Deliver();
            deliver.setSumDeliver(row);
            delivers.add(deliver);
            System.out.println(deliver.getSumDeliver());
        }
        return delivers;

    }
}
