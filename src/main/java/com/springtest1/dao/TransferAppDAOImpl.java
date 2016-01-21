package com.springtest1.dao;

import com.hibtest1.entity.TransferApp;
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
public class TransferAppDAOImpl extends HibernateDaoSupport implements TransferAppDAO {
    public List getAllTransferApp() {
        String hql = "from TransferApp";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<TransferApp> getCheckTransferApp() {     //审核查出"no"状态的单子
        String hql = "from TransferApp sa where sa.state='no'";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        List<TransferApp> storageapplist = query.list();
        if (storageapplist.size() <= 0) {
            return new ArrayList<TransferApp>();
        } else {
            TransferApp sa = (TransferApp) query.list().get(0);
            return storageapplist;
        }
    }

    public List<TransferApp> search(final TransferApp condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<TransferApp>>() {
            public List<TransferApp> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(TransferApp.class);
                if (condition != null) {
                    if (condition.getTransferAppId() != null && !condition.getTransferAppId().equals("")) {
                        System.out.println("DAO" + condition.getTransferAppId());
                        c.add(Restrictions.eq("transferAppId", condition.getTransferAppId()));
                    } else if (condition.getState() != null && !condition.getState().equals("")) {
                        c.add(Restrictions.eq("state", condition.getState()));
                    }else if(condition.getGoods() != null){
                        if(condition.getGoods().getGoodsId() != null && !condition.getGoods().getGoodsId().equals(""))
                            c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                    }
                }
                if (c.list().size() <= 0) {
                    return new ArrayList<TransferApp>();
                } else {
                    return c.list();
                }
            }
        });
    }

    public void add(TransferApp transferApp) {
        super.getHibernateTemplate().save(transferApp);
    }

    public void editTransferApp(TransferApp transferApp) {
        super.getHibernateTemplate().update(transferApp);   //修改
    }


}
