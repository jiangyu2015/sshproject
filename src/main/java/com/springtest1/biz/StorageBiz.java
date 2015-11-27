package com.springtest1.biz;

import com.hibtest1.entity.Storage;

import java.util.List;

/**
 * Created by user on 2015/11/27.
 */
public interface StorageBiz {
    public List getAllStorage();

    public List getStorageList(Storage condition);

    public void add(Storage condition);

    //  public boolean delGoods(Storage good);  //删除x

    public boolean editStorage(Storage storage); //修改AllList
}
