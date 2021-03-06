package com.springtest1.dao;

import com.hibtest1.entity.StorageApp;
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
 * Created by user on 2015/11/26.
 */
public class StorageAppDAOImpl extends HibernateDaoSupport implements StorageAppDAO {
    public List getAllStorageApp() {
        String hql = "from StorageApp";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public List<StorageApp> getCheckStorageApp() {     //审核查出"no"状态的单子
        String hql = "from StorageApp sa where sa.state='no'";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        List<StorageApp> storageapplist = query.list();
        if (storageapplist.size() <= 0) {
            return new ArrayList<StorageApp>();
        } else {
            return storageapplist;
        }
    }

    public List<StorageApp> search(final StorageApp condition) {
        return super.getHibernateTemplate().execute(new HibernateCallback<List<StorageApp>>() {
            public List<StorageApp> doInHibernate(Session session) throws HibernateException, SQLException {
                Criteria c = session.createCriteria(StorageApp.class);
                if (condition != null) {
                    if (condition.getGoods() != null && condition.getProducer() != null && condition.getPlace() != null) {
                        if (condition.getGoods().getGoodsId() != null && !condition.getGoods().getGoodsId().equals("")
                                && condition.getProducer().getProducerId() != null && !condition.getProducer().getProducerId().equals("")
                                && condition.getPlace().getPlaceId() != null && !condition.getPlace().getPlaceId().equals("")) {
                            c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                            c.add(Restrictions.eq("producer.producerId", condition.getProducer().getProducerId()));
                            c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                        } else if (condition.getGoods().getGoodsName() != null && !condition.getGoods().getGoodsName().equals("")
                                && condition.getProducer().getProducerId() != null && !condition.getProducer().getProducerId().equals("")
                                && condition.getPlace().getPlaceId() != null && !condition.getPlace().getPlaceId().equals("")) {
                            c.add(Restrictions.eq("goodsName", condition.getGoods().getGoodsName()));
                            c.add(Restrictions.eq("producer.producerId", condition.getProducer().getProducerId()));
                            c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                        }
                    } else if (condition.getGoods() != null && condition.getProducer() != null
                            || condition.getGoods() != null && condition.getPlace() != null
                            || condition.getProducer() != null && condition.getPlace() != null) {
                        if (condition.getGoods() != null && condition.getProducer() != null) {
                            if (condition.getGoods().getGoodsId() != null && !condition.getGoods().getGoodsId().equals("")
                                    && condition.getProducer().getProducerId() != null && !condition.getProducer().getProducerId().equals("")) {
                                c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                                c.add(Restrictions.eq("producer.producerId", condition.getProducer().getProducerId()));
                            } else if (condition.getGoods().getGoodsName() != null && !condition.getGoods().getGoodsName().equals("")
                                    && condition.getProducer().getProducerId() != null && !condition.getProducer().getProducerId().equals("")) {
                                c.add(Restrictions.eq("goodsName", condition.getGoods().getGoodsName()));
                                c.add(Restrictions.eq("producer.producerId", condition.getProducer().getProducerId()));
                            }
                        } else if (condition.getGoods() != null && condition.getPlace() != null) {
                            if (condition.getGoods().getGoodsId() != null && !condition.getGoods().getGoodsId().equals("")
                                    && condition.getPlace().getPlaceId() != null && !condition.getPlace().getPlaceId().equals("")) {
                                c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                                c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                            } else if (condition.getGoods().getGoodsName() != null && !condition.getGoods().getGoodsName().equals("")
                                    && condition.getPlace().getPlaceId() != null && !condition.getPlace().getPlaceId().equals("")) {
                                c.add(Restrictions.eq("goodsName", condition.getGoods().getGoodsName()));
                                c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                            }
                        } else if (condition.getProducer() != null && condition.getPlace() != null) {
                            if (condition.getProducer().getProducerId() != null && !condition.getProducer().getProducerId().equals("")
                                    && condition.getPlace().getPlaceId() != null && !condition.getPlace().getPlaceId().equals("")) {
                                c.add(Restrictions.eq("producer.producerId", condition.getProducer().getProducerId()));
                                c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                            }
                        }
                    } else if (condition.getGoods() != null || condition.getProducer() != null || condition.getPlace() != null) {
                        if (condition.getGoods() != null) {
                            if (condition.getGoods().getGoodsId() != null && !condition.getGoods().getGoodsId().equals("")) {
                                if (condition.getState() != null&& !condition.getState().equals("")) {
                                    c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                                    c.add(Restrictions.eq("state", condition.getState()));
                                } else {
                                    c.add(Restrictions.eq("goods.goodsId", condition.getGoods().getGoodsId()));
                                }
                            } else if (condition.getGoods().getGoodsName() != null && !condition.getGoods().getGoodsName().equals(""))
                                c.add(Restrictions.eq("goodsName", condition.getGoods().getGoodsName()));
                        } else if (condition.getProducer() != null) {
                            if (condition.getProducer().getProducerId() != null && !condition.getProducer().getProducerId().equals(""))
                                c.add(Restrictions.eq("producer.producerId", condition.getProducer().getProducerId()));
                        } else if (condition.getPlace() != null) {
                            if (condition.getPlace().getPlaceId() != null)
                                c.add(Restrictions.eq("place.placeId", condition.getPlace().getPlaceId()));
                        }
                    }

                    else if (condition.getStorageAppId() != null && !condition.getStorageAppId().equals("")) {
                        c.add(Restrictions.eq("storageAppId", condition.getStorageAppId()));
                    }
                }
                if (c.list().size() <= 0) {
                    return new ArrayList<StorageApp>();
                } else {
                    return c.list();
                }
            }
        });
    }

    public void add(StorageApp storageApp) {
        super.getHibernateTemplate().save(storageApp);
    }


    public void editStorageApp(StorageApp storageApp) {
        super.getHibernateTemplate().update(storageApp);   //修改
    }


}
