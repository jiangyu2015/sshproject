package com.springtest1.biz;

import com.dto.CommodityDto;
import com.hibtest1.entity.Goods;
import com.hibtest1.pageBean.PageBean;
import com.springtest1.dao.SearchDAO;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dell on 2015/12/6.
 */
public class SearchBizImpl extends HibernateDaoSupport implements SearchBiz {
    private SearchDAO searchDAO;

    public void setSearchDAO(SearchDAO searchDAO) {
        this.searchDAO = searchDAO;
    }

    @Transactional
    public List<CommodityDto> searchInventoryFlow() {
        return searchDAO.searchInventoryFlow();

    }

    @Transactional
    public List<CommodityDto> searchInventoryFlowGoods(String goodsName) {
        return searchDAO.searchInventoryFlowGoods(goodsName);
    }

    @Transactional
    public List<CommodityDto> searchAll() {
        return searchDAO.searchAll();  //
    }

    @Transactional
    public List<CommodityDto> searchAllGoods(String goodsName) {
        return searchDAO.searchAllGoods(goodsName);
    }

    @Transactional
    public List<CommodityDto> searchWithholding(Integer goodsId,Integer producerId,Integer placeId,String type){
        return  searchDAO.searchWithholding(goodsId, producerId,placeId,type);
    }
    @Transactional
    public PageBean queryForPage(int pageSize, int page) {
        final  String sql = "SELECT " +
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
                "	zmkc.zmkc - ifnull(syyt.syyt, 0) AS  AvailableInventory,zmkc.rk_id,zmkc.rk_type  " +  //12预提后可用库存 13明细id 14库存类型

                "FROM (	SELECT zrk.sp_id,zrk.sh_id,zrk.rk_place_id,zrk.rk_type,zrk.ss_number, " +
                "			ifnull(zck.ck_number, 0) ck_number, " +
                "			zrk.ss_number - ifnull(zck.ck_number, 0) zmkc,zrk.rk_id " +
                "		FROM ( 	SELECT sp_id,sh_id,rk_place_id,rk_type,sum(ss_number) ss_number,rk_id " +
                "				FROM rk_detail WHERE state = 'ok' " +
                "				GROUP BY sh_id, sp_id,rk_place_id,rk_type " +
                "			) zrk " +  /*总入库*/
                "		LEFT JOIN ( " +
                "			SELECT sp_id,sh_id,ck_place_id,ck_type,sum(ck_number) ck_number " +
                "			FROM " +
                "				ck_detail where state='ok'" +
                "			GROUP BY sp_id,sh_id,ck_place_id,ck_type " +
                "		) zck  ON zrk.sp_id = zck.sp_id " +   /*总出库*/
                "		AND zrk.sh_id = zck.sh_id " +
                "		AND zrk.rk_place_id = zck.ck_place_id AND zrk.rk_type = zck.ck_type " +
                "	) zmkc " +   /*账面库存*/
                "LEFT JOIN ( " +
                "	SELECT " +
                "		ytzs.sp_id,ytzs.sh_id,ytzs.place_id,ytzs.use_type,ytzs.yt_number ytzs, " +
                "		ifnull(ytzxx.ck_number, 0) ytzxx, " +
                "		yt_number - ifnull(ytzxx.ck_number, 0) AS syyt " +
                "	FROM ( " +
                "			SELECT sp_id,sh_id,place_id,sum(yt_number) yt_number,use_type " +
                "			FROM " +
                "				yt_application " +
                "			WHERE " +
                "				dateline >= CURDATE() " +
                "			GROUP BY " +
                "				sp_id, " +
                "				sh_id, " +
                "				place_id,use_type " +
                "		) ytzs " +
                "	LEFT JOIN ( " +
                "		SELECT ytxx.sp_id,ytxx.sh_id,ytxx.ck_place_id," +
                "			ifnull(sum(ytxx.ck_number), 0) ck_number,ytxx.ck_type " +
                "		FROM" +
                "			(" +
                "				SELECT a.yt_id,b.sp_id,b.sh_id,b.ck_place_id,b.ck_number,b.ck_type " +
                "				FROM(" +
                "						SELECT yt_id FROM yt_application WHERE dateline >= CURDATE() " +
                "					) a " +
                "				INNER JOIN ( " +
                "					SELECT sp_id,sh_id,ck_place_id,ck_number,yt_id,ck_type " +
                "					FROM ck_detail " +
                "				) b ON a.yt_id = b.yt_id " +
                "			) ytxx " +
                "		GROUP BY ytxx.sp_id,ytxx.sh_id,ytxx.ck_place_id,ytxx.ck_type " +
                "	) ytzxx ON ytzs.sp_id = ytzxx.sp_id " +    /*预提总消耗*/
                "	AND ytzs.sh_id = ytzxx.sh_id " +
                "	AND ytzs.place_id = ytzxx.ck_place_id AND ytzs.use_type = ytzxx.ck_type " +
                ") syyt ON zmkc.sp_id = syyt.sp_id " +  /*剩余预提*/
                "AND zmkc.sh_id = syyt.sh_id " +
                "AND zmkc.rk_place_id = syyt.place_id AND zmkc.rk_type = syyt.use_type " +
                "LEFT JOIN kc_place AS kc ON zmkc.rk_place_id = kc.kc_id " +
                "LEFT JOIN sp_info AS sp ON zmkc.sp_id = sp.sp_id " +
                "LEFT JOIN sh_info AS sh ON zmkc.sh_id = sh.sh_id ;";
        int allRow = searchDAO.getAllRowCount(sql);//总记录数
        int totalPage = PageBean.countTatalPage(pageSize, allRow);//总页数
        final int offset = PageBean.countOffset(pageSize, page);//当前页开始记录
        final int length = pageSize;//每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        List<CommodityDto> list = searchDAO.queryForPage(sql, offset, length);//"一页"的记录

//把分页信息保存到Bean中
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setListCommodityDto(list);
        pageBean.init();
        return pageBean;
    }
}
