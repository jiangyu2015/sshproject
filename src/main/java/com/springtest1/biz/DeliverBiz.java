package com.springtest1.biz;

import com.hibtest1.entity.Deliver;

import java.util.List;

/**
 * Created by user on 2015/11/27.
 */
public interface DeliverBiz {
    public List<Deliver> getAllDeliver();

    public List<Deliver> getDeliverList(Deliver condition);

    public void add(Deliver condition);

    //  public boolean delGoods(Deliver deliver);  //删除x

    public boolean editDeliver(Deliver deliver); //修改AllList
    public List<Deliver> searchWithholdingDeliver(Integer withholdingId);
  //  public List<Deliver> searchActivityDeliver(String activityId);
}
