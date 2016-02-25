package com.springtest1.biz;

import com.hibtest1.entity.Producer;
import com.hibtest1.pageBean.PageBean;
import com.springtest1.dao.ProducerDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/11/25.
 */
public class ProducerBizImpl implements ProducerBiz {
    private ProducerDAO producerDAO;

    public void setProducerDAO(ProducerDAO producerDAO) {
        this.producerDAO = producerDAO;
    }

    @Transactional
    public List getAllProducer() {
        return producerDAO.getAllProducer();
    }

    public List getProducerList(Producer condition) {
        List list = producerDAO.search(condition);
        return list;
    }

    public void add(Producer condition) {
        producerDAO.add(condition);
    }

/*    public boolean delProducer(Producer producer) {
        return producerDAO.delProducer(producer);
    }*/

    public boolean editProducer(Producer producer) {
        producerDAO.editProducer(producer);
        return true;
    } //修改

    @Transactional
    public List<Producer> getProducer(String name) {
        return producerDAO.getProducer(name);
    }

    @Transactional
    public List<Producer> getProducerCheck(){
        return  producerDAO.getProducerCheck();
    }

    //通过applicationContext.xml配置文件注入MemberDao的值

    public PageBean queryForPage(int pageSize, int page) {
        final String hql = "from Producer";//查询语句
        int allRow = producerDAO.getAllRowCount(hql);//总记录数
        int totalPage = PageBean.countTatalPage(pageSize, allRow);//总页数
        final int offset = PageBean.countOffset(pageSize, page);//当前页开始记录
        final int length = pageSize;//每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        List<Producer> list = producerDAO.queryForPage(hql, offset, length);//"一页"的记录

//把分页信息保存到Bean中
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setListProducer(list);
        pageBean.init();
        return pageBean;
    }
}
