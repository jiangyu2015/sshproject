package com.springtest1.biz;

import com.hibtest1.entity.Deliver;
import com.springtest1.dao.DeliverDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/11/27.
 */
public class DeliverBizImpl implements DeliverBiz {
    private DeliverDAO deliverDAO;

    public void setDeliverDAO(DeliverDAO deliverDAO) {
        this.deliverDAO = deliverDAO;
    }

    @Transactional
    public List<Deliver> getAllDeliver() {
        return deliverDAO.getAllDeliver();
    }

    public List<Deliver> getDeliverList(Deliver condition) {
        List list = deliverDAO.search(condition);
        return list;
    }

    public void add(Deliver condition) {
        deliverDAO.add(condition);
    }

    @Transactional
    public List<Deliver> searchWithholdingDeliver(Integer withholdingId){
        List<Deliver> list=deliverDAO.searchWithholdingDeliver(withholdingId);
        return  list;
    }

  /*  public boolean delGoods(Deliver deliver) {
        return deliverDAO.delGoods(deliver);
    }  */

    public boolean editDeliver(Deliver deliver) {

        deliverDAO.editDeliver(deliver);
        return true;
    } //修改AllList
}
