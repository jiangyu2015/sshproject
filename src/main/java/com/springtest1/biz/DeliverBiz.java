package com.springtest1.biz;

import com.hibtest1.entity.Deliver;

import java.util.List;

/**
 * Created by user on 2015/11/27.
 */
public interface DeliverBiz {
    public List getAllDeliver();

    public List getDeliverList(Deliver condition);

    public void add(Deliver condition);

    //  public boolean delGoods(Deliver good);  //删除x

    public boolean editDeliver(Deliver deliver); //修改AllList
}
