package com.springtest1.dao;

import com.dto.CommodityDto;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * Created by dell on 2015/12/6.
 */
public class SearchDAOImpl extends HibernateDaoSupport implements SearchDAO {
    public List<CommodityDto> searchInventoryFlow() {   //没有预提的流动表
        String sql = "SELECT ccin.rk_id as id, " +
                " sp.sp_name  AS goodsName, " +
                " kc.place AS placeName, " +
                /*" ccin.sp_id AS goodsId, " +
                " ccin.rk_place_id AS placeId, " +*/
                " ccin.sj_stock_date AS firstStorageTime, " +
                " ccin.ss_number AS firstStorageNumber, " +
                " ccin.total_in AS totolStorage, " +
                " IFNULL(ccout.total_out, 0) AS totolDeliver, " +
                " IFNULL(ccin.total_in, 0) - IFNULL(ccout.total_out, 0) AS carryingExcessInventory, " +
                "ccin.rk_type, " +
                "ccin.total_exceptin, " +
                "sh.sh_name AS producerName " +
                "FROM(SELECT *, sum(cin.ss_number) AS total_in,sum(cin.expect_rk_number) As total_exceptin,Min(cin.sj_stock_date) " +
                "    FROM(SELECT * FROM rk_detail As c where c.state='ok')As cin " +
                "    GROUP BY cin.sp_id, cin.rk_place_id,cin.rk_type,cin.sh_id " +
                "  ) AS ccin " +
                "LEFT JOIN ( " +
                "  SELECT *, " +
                "    sum(cout.ck_number) AS total_out " +
                "  FROM " +
                "    ck_detail cout " +
                "  GROUP BY " +
                "    cout.sp_id, " +
                "    cout.ck_place_id,cout.sh_id,cout.ck_type " +
                ") AS ccout ON ccin.sp_id = ccout.sp_id " +
                "AND ccin.rk_place_id = ccout.ck_place_id AND ccin.sh_id = ccout.sh_id And ccin.rk_type=ccout.ck_type " +
                "LEFT JOIN kc_place AS kc ON ccin.rk_place_id = kc.kc_id " +
                "LEFT JOIN sp_info AS sp " +
                "on ccin.sp_id = sp.sp_id LEFT JOIN sh_info AS sh ON ccin.sh_id=sh.sh_id;";
        Session session = this.getSessionFactory().getCurrentSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        List<Object[]> list = sqlQuery.list();
        List<CommodityDto> commodityDtoList = new ArrayList<>(list.size());
        for (Object[] row : list) {
            System.out.println(row);
            CommodityDto commodityDto = new CommodityDto();
            commodityDto.setId((Integer) row[0]);
            //    System.out.println(commodityDto.getId());
            commodityDto.setGoodsName((String) row[1]);
            //    System.out.println(commodityDto.getGoodsName());
            commodityDto.setPlaceName((String) row[2]);
            //      System.out.println(commodityDto.getPlaceName());
            commodityDto.setFirstStorageTime((Date) row[3]);    //初次入库时间
            //      System.out.println(commodityDto.getFirstStorageTime());
            commodityDto.setFirstStorageNumber((Integer) row[4]);   //初次入库数量
            //     System.out.println(commodityDto.getFirstStorageNumber());
            commodityDto.setTotolStorage((BigDecimal) row[5]);  //总入库数  BigDecimal
            //      System.out.println(commodityDto.getTotolStorage());
            commodityDto.setTotolDeliver((BigDecimal) row[6]); //总出库数 BigDecimal
            //      System.out.println(commodityDto.getTotolDeliver());
            commodityDto.setCarryingExcessInventory((BigDecimal) row[7]);  //账面剩余库存数
            //       System.out.println(commodityDto.getCarryingExcessInventory());
            commodityDto.setType((String) row[8]);  //入库类型
            commodityDto.setExpectNumber((BigDecimal) row[9]);  //应收数量
            commodityDto.setProducerName((String) row[10]); //商户名称
            //其他自己加
            commodityDtoList.add(commodityDto);
        }
        return commodityDtoList;
    }

    public List<CommodityDto> searchInventoryFlowGoods(String goodsName) {  //没有预提的搜名称的表，好像也没啥用
        String sql = "SELECT ccin.rk_id as id, " +
                " sp.sp_name  AS goodsName, " +
                " kc.place AS placeName, " +
                " ccin.sj_stock_date AS firstStorageTime, " +
                " ccin.ss_number AS firstStorageNumber, " +
                " ccin.total_in AS totolStorage, " +
                " IFNULL(ccout.total_out, 0) AS totolDeliver, " +
                " IFNULL(ccin.total_in, 0) - IFNULL(ccout.total_out, 0) AS carryingExcessInventory, " +
                "ccin.rk_type, " +
                "ccin.total_exceptin, " +
                "sh.sh_name AS producerName " +
                "FROM(SELECT *, sum(cin.ss_number) AS total_in,sum(cin.expect_rk_number) As total_exceptin,Min(cin.sj_stock_date) " +
                "    FROM(SELECT * FROM rk_detail As c where c.state='ok')As cin " +
                "    GROUP BY cin.sp_id, cin.rk_place_id,cin.rk_type,cin.sh_id " +
                "  ) AS ccin " +
                "LEFT JOIN ( " +
                "  SELECT *, " +
                "    sum(cout.ck_number) AS total_out " +
                "  FROM " +
                "    ck_detail cout " +
                "  GROUP BY " +
                "    cout.sp_id, " +
                "    cout.ck_place_id,cout.sh_id,cout.ck_type " +
                ") AS ccout ON ccin.sp_id = ccout.sp_id " +
                "AND ccin.rk_place_id = ccout.ck_place_id AND ccin.sh_id = ccout.sh_id And ccin.rk_type=ccout.ck_type " +
                "LEFT JOIN kc_place AS kc ON ccin.rk_place_id = kc.kc_id " +
                "LEFT JOIN sp_info AS sp " +
                "on ccin.sp_id = sp.sp_id LEFT JOIN sh_info AS sh ON ccin.sh_id=sh.sh_id " +
                "WHERE sp.sp_name='" + goodsName + "';";
        Session session = this.getSessionFactory().getCurrentSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        List<Object[]> list = sqlQuery.list();
        List<CommodityDto> commodityDtoList = new ArrayList<>(list.size());
        for (Object[] row : list) {
            System.out.println(row);
//        System.out.println(list);
            CommodityDto commodityDto = new CommodityDto();
            commodityDto.setId((Integer) row[0]);
            //    System.out.println(commodityDto.getId());
            commodityDto.setGoodsName((String) row[1]);
            //    System.out.println(commodityDto.getGoodsName());
            commodityDto.setPlaceName((String) row[2]);
            //      System.out.println(commodityDto.getPlaceName());
            commodityDto.setFirstStorageTime((Date) row[3]);    //初次入库时间
            //      System.out.println(commodityDto.getFirstStorageTime());
            commodityDto.setFirstStorageNumber((Integer) row[4]);   //初次入库数量
            //     System.out.println(commodityDto.getFirstStorageNumber());
            commodityDto.setTotolStorage((BigDecimal) row[5]);  //总入库数  BigDecimal
            //      System.out.println(commodityDto.getTotolStorage());
            commodityDto.setTotolDeliver((BigDecimal) row[6]); //总出库数 BigDecimal
            //      System.out.println(commodityDto.getTotolDeliver());
            commodityDto.setCarryingExcessInventory((BigDecimal) row[7]);  //账面剩余库存数
            //       System.out.println(commodityDto.getCarryingExcessInventory());
            commodityDto.setType((String) row[8]);  //入库类型
            commodityDto.setExpectNumber((BigDecimal) row[9]);  //应收数量
            commodityDto.setProducerName((String) row[10]); //商户名称
            commodityDtoList.add(commodityDto);
        }
        return commodityDtoList;
    }

    public List<CommodityDto> searchAll() {  //查总库存流动
        String sql = "SELECT " +
                "	zmkc.sh_id, " +
                "	sh.sh_name AS producerName, " +   //1商户
                "	zmkc.sp_id, " +
                "	sp.sp_name AS goodsName, " + //3商品
                "	zmkc.rk_place_id, " +
                "	kc.place AS placeName, " +  //5库存地点
                "	zmkc.ss_number AS totolStorage, " +  //6总入库
                "	zmkc.ck_number AS totolDeliver, " +  //7总出库
                "	zmkc.zmkc AS carryingExcessInventory, " +  //8账面剩余库存
                "	ifnull(syyt.ytzs, 0) AS withholdingNumber, " +  //9预提总数
                "	ifnull(syyt.ytzxx, 0) AS withholdingConsume, " +  //10预提消耗
                "	ifnull(syyt.syyt, 0) AS surplusWithholdingNumber, " + //11剩余预提数
                "	zmkc.zmkc - ifnull(syyt.syyt, 0) AS  AvailableInventory,zmkc.rk_id " +  //12预提后可用库存 13明细id

                "FROM (	SELECT zrk.sp_id,zrk.sh_id,zrk.rk_place_id,zrk.ss_number, " +
                "			ifnull(zck.ck_number, 0) ck_number, " +
                "			zrk.ss_number - ifnull(zck.ck_number, 0) zmkc,zrk.rk_id " +
                "		FROM ( 	SELECT sp_id,sh_id,rk_place_id,sum(ss_number) ss_number,rk_id " +
                "				FROM rk_detail WHERE state = 'ok' " +
                "				GROUP BY sh_id, sp_id,rk_place_id " +
                "			) zrk " +
                "		LEFT JOIN ( " +
                "			SELECT sp_id,sh_id,ck_place_id,sum(ck_number) ck_number " +
                "			FROM " +
                "				ck_detail " +
                "			GROUP BY sp_id,sh_id,ck_place_id " +
                "		) zck ON zrk.sp_id = zck.sp_id " +
                "		AND zrk.sh_id = zck.sh_id " +
                "		AND zrk.rk_place_id = zck.ck_place_id " +
                "	) zmkc " +
                "LEFT JOIN ( " +
                "	SELECT " +
                "		ytzs.sp_id,ytzs.sh_id,ytzs.place_id,ytzs.yt_number ytzs, " +
                "		ifnull(ytzxx.ck_number, 0) ytzxx, " +
                "		yt_number - ifnull(ytzxx.ck_number, 0) AS syyt " +
                "	FROM ( " +
                "			SELECT sp_id,sh_id,place_id,sum(yt_number) yt_number " +
                "			FROM " +
                "				yt_application " +
                "			WHERE " +
                "				dateline >= CURDATE() " +
                "			GROUP BY " +
                "				sp_id, " +
                "				sh_id, " +
                "				place_id " +
                "		) ytzs " +
                "	LEFT JOIN ( " +
                "		SELECT ytxx.sp_id,ytxx.sh_id,ytxx.ck_place_id," +
                "			ifnull(sum(ytxx.ck_number), 0) ck_number " +
                "		FROM" +
                "			(" +
                "				SELECT a.yt_id,b.sp_id,b.sh_id,b.ck_place_id,b.ck_number " +
                "				FROM(" +
                "						SELECT yt_id FROM yt_application WHERE dateline >= CURDATE() " +
                "					) a" +
                "				INNER JOIN ( " +
                "					SELECT sp_id,sh_id,ck_place_id,ck_number,yt_id " +
                "					FROM ck_detail " +
                "				) b ON a.yt_id = b.yt_id " +
                "			) ytxx " +
                "		GROUP BY ytxx.sp_id,ytxx.sh_id,ytxx.ck_place_id " +
                "	) ytzxx ON ytzs.sp_id = ytzxx.sp_id " +
                "	AND ytzs.sh_id = ytzxx.sh_id " +
                "	AND ytzs.place_id = ytzxx.ck_place_id " +
                ") syyt ON zmkc.sp_id = syyt.sp_id " +
                "AND zmkc.sh_id = syyt.sh_id " +
                "AND zmkc.rk_place_id = syyt.place_id " +
                "LEFT JOIN kc_place AS kc ON zmkc.rk_place_id = kc.kc_id " +
                "LEFT JOIN sp_info AS sp ON zmkc.sp_id = sp.sp_id " +
                "LEFT JOIN sh_info AS sh ON zmkc.sh_id = sh.sh_id ;";
        Session session = this.getSessionFactory().getCurrentSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        List<Object[]> list = sqlQuery.list();
        System.out.println("DAO" + list.size());
        List<CommodityDto> commodityDtoList = new ArrayList<>(list.size());
        for (Object[] row : list) {
            System.out.println(row);
            CommodityDto commodityDto = new CommodityDto();
            commodityDto.setProducerId((Integer) row[0]);
            commodityDto.setProducerName((String) row[1]); //商户名称
            commodityDto.setGoodsId((Integer) row[2]);
            commodityDto.setGoodsName((String) row[3]);//商品名称
            commodityDto.setPlaceId((Integer) row[4]); //
            commodityDto.setPlaceName((String) row[5]); //仓库名称
            commodityDto.setTotolStorage((BigDecimal) row[6]);  //总入库数  BigDecimal
            commodityDto.setTotolDeliver((BigDecimal) row[7]); //总出库数 BigDecimal
            commodityDto.setCarryingExcessInventory((BigDecimal) row[8]); //账目剩余库存
            commodityDto.setWithholdingNumber((BigDecimal) row[9]); //预提数
            commodityDto.setWithholdingConsume((BigDecimal) row[10]); //预提消耗
            commodityDto.setSurplusWithholdingNumber((BigDecimal) row[11]); //剩余预提
            commodityDto.setAvailableInventory((BigDecimal) row[12]);//预提后可用库存
            commodityDto.setId((Integer) row[13]);//明细id
            commodityDtoList.add(commodityDto);
        }
        return commodityDtoList;
    }

    public List<CommodityDto> searchAllGoods(String goodsName) {  //查总库存流动 带商品名
        String sql = "SELECT " +
                "	zmkc.sh_id, " +
                "	sh.sh_name AS producerName, " +   //1商户
                "	zmkc.sp_id, " +
                "	sp.sp_name AS goodsName, " + //3商品
                "	zmkc.rk_place_id, " +
                "	kc.place AS placeName, " +  //5库存地点
                "	zmkc.ss_number AS totolStorage, " +  //6总入库
                "	zmkc.ck_number AS totolDeliver, " +  //7总出库
                "	zmkc.zmkc AS carryingExcessInventory, " +  //8账面剩余库存
                "	ifnull(syyt.ytzs, 0) AS withholdingNumber, " +  //9预提总数
                "	ifnull(syyt.ytzxx, 0) AS withholdingConsume, " +  //10预提消耗
                "	ifnull(syyt.syyt, 0) AS surplusWithholdingNumber, " + //11剩余预提数
                "	zmkc.zmkc - ifnull(syyt.syyt, 0) AS  AvailableInventory,zmkc.rk_id,zmkc.rk_type " +  //12预提后可用库存 13明细id 14入库类型


                "FROM (	SELECT zrk.rk_type,zrk.sp_id,zrk.sh_id,zrk.rk_place_id,zrk.ss_number, " +
                "			ifnull(zck.ck_number, 0) ck_number, " +
                "			zrk.ss_number - ifnull(zck.ck_number, 0) zmkc,zrk.rk_id " +
                "		FROM ( 	SELECT rk_type,sp_id,sh_id,rk_place_id,sum(ss_number) ss_number,rk_id " +
                "				FROM rk_detail WHERE state = 'ok' " +
                "				GROUP BY sh_id, sp_id,rk_place_id " +
                "			) zrk " +
                "		LEFT JOIN ( " +
                "			SELECT sp_id,sh_id,ck_place_id,sum(ck_number) ck_number " +
                "			FROM " +
                "				ck_detail " +
                "			GROUP BY sp_id,sh_id,ck_place_id " +
                "		) zck ON zrk.sp_id = zck.sp_id " +
                "		AND zrk.sh_id = zck.sh_id " +
                "		AND zrk.rk_place_id = zck.ck_place_id " +
                "	) zmkc " +
                "LEFT JOIN ( " +
                "	SELECT " +
                "		ytzs.sp_id,ytzs.sh_id,ytzs.place_id,ytzs.yt_number ytzs, " +
                "		ifnull(ytzxx.ck_number, 0) ytzxx, " +
                "		yt_number - ifnull(ytzxx.ck_number, 0) AS syyt " +
                "	FROM ( " +
                "			SELECT sp_id,sh_id,place_id,sum(yt_number) yt_number " +
                "			FROM " +
                "				yt_application " +
                "			WHERE " +
                "				dateline >= CURDATE() " +
                "			GROUP BY " +
                "				sp_id, " +
                "				sh_id, " +
                "				place_id " +
                "		) ytzs " +
                "	LEFT JOIN ( " +
                "		SELECT ytxx.sp_id,ytxx.sh_id,ytxx.ck_place_id," +
                "			ifnull(sum(ytxx.ck_number), 0) ck_number " +
                "		FROM" +
                "			(" +
                "				SELECT a.yt_id,b.sp_id,b.sh_id,b.ck_place_id,b.ck_number " +
                "				FROM(" +
                "						SELECT yt_id FROM yt_application WHERE dateline >= CURDATE() " +
                "					) a" +
                "				INNER JOIN ( " +
                "					SELECT sp_id,sh_id,ck_place_id,ck_number,yt_id " +
                "					FROM ck_detail " +
                "				) b ON a.yt_id = b.yt_id " +
                "			) ytxx " +
                "		GROUP BY ytxx.sp_id,ytxx.sh_id,ytxx.ck_place_id " +
                "	) ytzxx ON ytzs.sp_id = ytzxx.sp_id " +
                "	AND ytzs.sh_id = ytzxx.sh_id " +
                "	AND ytzs.place_id = ytzxx.ck_place_id " +
                ") syyt ON zmkc.sp_id = syyt.sp_id " +
                "AND zmkc.sh_id = syyt.sh_id " +
                "AND zmkc.rk_place_id = syyt.place_id " +
                "LEFT JOIN kc_place AS kc ON zmkc.rk_place_id = kc.kc_id " +
                "LEFT JOIN sp_info AS sp ON zmkc.sp_id = sp.sp_id " +
                "LEFT JOIN sh_info AS sh ON zmkc.sh_id = sh.sh_id " +
                "WHERE sp.sp_name='" + goodsName + "';";
        Session session = this.getSessionFactory().getCurrentSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        List<Object[]> list = sqlQuery.list();
        System.out.println("DAO" + list.size());
        List<CommodityDto> commodityDtoList = new ArrayList<>(list.size());
        for (Object[] row : list) {
            System.out.println(row);
            CommodityDto commodityDto = new CommodityDto();
            commodityDto.setProducerId((Integer) row[0]);
            commodityDto.setProducerName((String) row[1]); //商户名称
            commodityDto.setGoodsId((Integer) row[2]);
            commodityDto.setGoodsName((String) row[3]);//商品名称
            commodityDto.setPlaceId((Integer) row[4]); //
            commodityDto.setPlaceName((String) row[5]); //仓库名称
            commodityDto.setTotolStorage((BigDecimal) row[6]);  //总入库数  BigDecimal
            commodityDto.setTotolDeliver((BigDecimal) row[7]); //总出库数 BigDecimal
            commodityDto.setCarryingExcessInventory((BigDecimal) row[8]); //账目剩余库存
            commodityDto.setWithholdingNumber((BigDecimal) row[9]); //预提数
            commodityDto.setWithholdingConsume((BigDecimal) row[10]); //预提消耗
            commodityDto.setSurplusWithholdingNumber((BigDecimal) row[11]); //剩余预提
            commodityDto.setAvailableInventory((BigDecimal) row[12]);//预提后可用库存
            commodityDto.setId((Integer) row[13]);//明细id
            commodityDto.setType((String) row[14]);  //入库类型
            commodityDtoList.add(commodityDto);
        }
        return commodityDtoList;
    }


    public List<CommodityDto> searchWithholding(Integer goodsId, Integer producerId, Integer placeId) {  //查当前预提
        String sql = "SELECT " +
            /*    "	zmkc.sh_id, " +
                "	sh.sh_name AS producerName, " +   //1商户
                "	zmkc.sp_id, " +
                "	sp.sp_name AS goodsName, " + //3商品
                "	zmkc.rk_place_id, " +
                "	kc.place AS placeName, " +  //5库存地点
                "	zmkc.ss_number AS totolStorage, " +  //6总入库
                "	zmkc.ck_number AS totolDeliver, " +  //7总出库
                "	zmkc.zmkc AS carryingExcessInventory, " +  //8账面剩余库存
                "	ifnull(syyt.ytzs, 0) AS withholdingNumber, " +  //9预提总数
                "	ifnull(syyt.ytzxx, 0) AS withholdingConsume, " +  //10预提消耗
                "	ifnull(syyt.syyt, 0) AS surplusWithholdingNumber, "  + //11剩余预提数*/
                "	zmkc.zmkc - ifnull(syyt.syyt, 0) AS  AvailableInventory  " +  //12预提后可用库存
          /*      "zmkc.rk_id " +  // 13明细id*/
                "FROM (	SELECT zrk.sp_id,zrk.sh_id,zrk.rk_place_id,zrk.ss_number, " +
                "			ifnull(zck.ck_number, 0) ck_number, " +
                "			zrk.ss_number - ifnull(zck.ck_number, 0) zmkc,zrk.rk_id " +
                "		FROM ( 	SELECT sp_id,sh_id,rk_place_id,sum(ss_number) ss_number,rk_id " +
                "				FROM rk_detail WHERE state = 'ok' " +
                "				GROUP BY sh_id, sp_id,rk_place_id " +
                "			) zrk " +
                "		LEFT JOIN ( " +
                "			SELECT sp_id,sh_id,ck_place_id,sum(ck_number) ck_number " +
                "			FROM " +
                "				ck_detail " +
                "			GROUP BY sp_id,sh_id,ck_place_id " +
                "		) zck ON zrk.sp_id = zck.sp_id " +
                "		AND zrk.sh_id = zck.sh_id " +
                "		AND zrk.rk_place_id = zck.ck_place_id " +
                "	) zmkc " +
                "LEFT JOIN ( " +
                "	SELECT " +
                "		ytzs.sp_id,ytzs.sh_id,ytzs.place_id,ytzs.yt_number ytzs, " +
                "		ifnull(ytzxx.ck_number, 0) ytzxx, " +
                "		yt_number - ifnull(ytzxx.ck_number, 0) AS syyt " +
                "	FROM ( " +
                "			SELECT sp_id,sh_id,place_id,sum(yt_number) yt_number " +
                "			FROM " +
                "				yt_application " +
                "			WHERE " +
                "				dateline >= CURDATE() " +
                "			GROUP BY " +
                "				sp_id, " +
                "				sh_id, " +
                "				place_id " +
                "		) ytzs " +
                "	LEFT JOIN ( " +
                "		SELECT ytxx.sp_id,ytxx.sh_id,ytxx.ck_place_id," +
                "			ifnull(sum(ytxx.ck_number), 0) ck_number " +
                "		FROM" +
                "			(" +
                "				SELECT a.yt_id,b.sp_id,b.sh_id,b.ck_place_id,b.ck_number " +
                "				FROM(" +
                "						SELECT yt_id FROM yt_application WHERE dateline >= CURDATE() " +
                "					) a" +
                "				INNER JOIN ( " +
                "					SELECT sp_id,sh_id,ck_place_id,ck_number,yt_id " +
                "					FROM ck_detail " +
                "				) b ON a.yt_id = b.yt_id " +
                "			) ytxx " +
                "		GROUP BY ytxx.sp_id,ytxx.sh_id,ytxx.ck_place_id " +
                "	) ytzxx ON ytzs.sp_id = ytzxx.sp_id " +
                "	AND ytzs.sh_id = ytzxx.sh_id " +
                "	AND ytzs.place_id = ytzxx.ck_place_id " +
                ") syyt ON zmkc.sp_id = syyt.sp_id " +
                "AND zmkc.sh_id = syyt.sh_id " +
                "AND zmkc.rk_place_id = syyt.place_id " +
                "LEFT JOIN kc_place AS kc ON zmkc.rk_place_id = kc.kc_id " +
                "LEFT JOIN sp_info AS sp ON zmkc.sp_id = sp.sp_id " +
                "LEFT JOIN sh_info AS sh ON zmkc.sh_id = sh.sh_id " +
                "WHERE sp.sp_id='" + goodsId + "' and sh.sh_id='" + producerId + "' and kc.kc_id='" + placeId + "' ;";
        Session session = this.getSessionFactory().getCurrentSession();
        SQLQuery sqlQuery = session.createSQLQuery(sql);
        List<BigDecimal> list = sqlQuery.list();
        System.out.println("DAO" + list.size());
        List<CommodityDto> commodityDtoList = new ArrayList<>(list.size());
        for (int i = 0; i < list.size(); i++) {
            BigDecimal row = list.get(0);
            System.out.println(row);
            CommodityDto commodityDto = new CommodityDto();
            commodityDto.setAvailableInventory(row);
            commodityDtoList.add(commodityDto);
            System.out.println(commodityDto.getAvailableInventory());
        }
        return commodityDtoList;

    }
}


