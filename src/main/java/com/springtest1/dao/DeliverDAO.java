package com.springtest1.dao;

import com.hibtest1.entity.Deliver;

import java.util.List;

/**
 * Created by user on 2015/11/27.
 */
public interface DeliverDAO {
    public List<Deliver> getAllDeliver();
    public List<Deliver> search(Deliver condition);   //查询
    public void add(Deliver condition);//add
    // public boolean delGoods(Deliver condition); //del
    public void editDeliver(Deliver deliver); //修改AllList
    public List<Deliver> searchWithholdingDeliver(Integer withholdingId);//
  //  public List<Deliver> searchActivityDeliver(String activityId);
}
