package com.springtest1.dao;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by dell on 2015/12/6.
 */
public class SearchDAOImpl extends HibernateDaoSupport implements SearchDAO {
    public List searchInventoryFlow() {
        String sql = "SELECT" +
                "ccin.rk_id,ccin.sp_id AS GoodsId,ccin.rk_place_id AS Place,ccin.sj_stock_date AS firstStorageTime,ccin.ss_number AS firstStorageNumber, " +
                "ccin.total_in as totolStorage,IFNULL(ccout.total_out,0) AS totolDeliver,IFNULL(ccin.total_in,0) - IFNULL(ccout.total_out, 0) AS carryingExcessInventory " +
                "FROM ( SELECT *, sum(cin.ss_number) AS total_in FROM ((SELECT * FROM rk_detail cin  ORDER BY cin.sj_stock_date )) cin " +
                "GROUP BY cin.sp_id,cin.rk_place_id ORDER BY cin.sp_id,cin.sj_stock_date) AS ccin LEFT JOIN ( SELECT cout.ck_id AS id, " +
                "cout.sp_id,cout.ck_number,cout.ck_place_id,sum(cout.ck_number) AS total_out FROM ck_detail cout   GROUP BY cout.sp_id,cout.ck_place_id " +
                ") AS ccout ON ccin.sp_id = ccout.sp_id AND ccin.rk_place_id = ccout.ck_place_id; ";
        Session session = this.getSessionFactory().getCurrentSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        return sqlQuery.list();

    }
}
