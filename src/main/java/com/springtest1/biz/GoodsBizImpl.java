package com.springtest1.biz;

import com.hibtest1.entity.Goods;
import com.hibtest1.pageBean.PageBean;
import com.springtest1.dao.GoodsDAO;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

public class GoodsBizImpl implements GoodsBiz {
    private GoodsDAO goodsDAO;

    public void setGoodsDAO(GoodsDAO goodsDAO) {
        this.goodsDAO = goodsDAO;
    }

    public List<Goods> getGoodsList(Goods condition) {

        List<Goods> list = goodsDAO.search(condition);
        return list;
    }

    public void add(Goods condition) {
        goodsDAO.add(condition);
    }

    public boolean delGoods(Goods good) {
        return goodsDAO.delGoods(good);
    }

    @Transactional
    public List getAllGoods() {
        return goodsDAO.getAllGoods();
    }

    public boolean modifyGood(Goods good) {
        goodsDAO.modifyGood(good);
        return true;
    }

    @Transactional
    public List<Goods> getGoods(String name) {
        return goodsDAO.getGoods(name);
    }

    @Transactional
    public List<Goods> getGoodsCheck() {
        return goodsDAO.getGoodsCheck();
    }

    @Transactional
    public List<Goods> isGoods(final Goods condition) {
        return goodsDAO.isGoods(condition);
    }

    @Transactional
    public List<Goods> getOverdueGoods() {
        return goodsDAO.getOverdueGoods();
    }

    @Transactional
    public List<Goods> getOverGoods() {
        return goodsDAO.getOverGoods();
    }

    //通过applicationContext.xml配置文件注入MemberDao的值

    public PageBean queryForPage(int pageSize, int page) {
        final String hql = "from Goods";//查询语句
        int allRow = goodsDAO.getAllRowCount(hql);//总记录数
        int totalPage = PageBean.countTatalPage(pageSize, allRow);//总页数
        final int offset = PageBean.countOffset(pageSize, page);//当前页开始记录
        final int length = pageSize;//每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        List<Goods> list = goodsDAO.queryForPage(hql, offset, length);//"一页"的记录

//把分页信息保存到Bean中
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setLisGoods(list);
        pageBean.init();
        return pageBean;
    }
}
