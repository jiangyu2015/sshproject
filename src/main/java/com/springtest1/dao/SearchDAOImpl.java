package com.springtest1.dao;

import com.dto.CommodityDto;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by dell on 2015/12/6.
 */
public class SearchDAOImpl extends HibernateDaoSupport implements SearchDAO {
    public List<CommodityDto> searchInventoryFlow() {
        String sql = "SELECT ccin.rk_id as id, " +
                " ccin.sp_id AS goodsId, " +
                " ccin.rk_place_id AS place, " +
                " ccin.sj_stock_date AS firstStorageTime, " +
                " ccin.ss_number AS firstStorageNumber, " +
                " ccin.total_in AS totolStorage, " +
                " IFNULL(ccout.total_out, 0) AS totolDeliver, " +
                " IFNULL(ccin.total_in, 0) - IFNULL(ccout.total_out, 0) AS carryingExcessInventory " +
                "FROM(SELECT *, sum(cin.ss_number) AS total_in " +
                "    FROM((SELECT * FROM rk_detail cin ORDER BY cin.sj_stock_date)) cin " +
                "    GROUP BY cin.sp_id, cin.rk_place_id " +
                "    ORDER BY cin.sp_id, cin.sj_stock_date " +
                "  ) AS ccin " +
                "LEFT JOIN ( " +
                "  SELECT " +
                "    cout.ck_id AS id, " +
                "    cout.sp_id, " +
                "    cout.ck_number, " +
                "    cout.ck_place_id, " +
                "    sum(cout.ck_number) AS total_out " +
                "  FROM " +
                "    ck_detail cout " +
                "  GROUP BY " +
                "    cout.sp_id, " +
                "    cout.ck_place_id " +
                ") AS ccout ON ccin.sp_id = ccout.sp_id " +
                "AND ccin.rk_place_id = ccout.ck_place_id";
        Session session = this.getSessionFactory().getCurrentSession();
//        System.out.println(sql);
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        List<Object[]> list = sqlQuery.list();
//        System.out.println(list);
        List<CommodityDto> commodityDtoList = new ArrayList<>(list.size());
        for (Object[] row : list) {
            System.out.println(row);
            CommodityDto commodityDto = new CommodityDto();
            commodityDto.setId((Integer) row[0]);
            commodityDto.setGoodsId((Integer) row[0]);
            //其他自己加
            commodityDtoList.add(commodityDto);
        }
        return commodityDtoList;
    }
}
