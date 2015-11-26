package com.springtest1.biz;

import com.hibtest1.entity.StorageApp;

import java.util.List;

/**
 * Created by user on 2015/11/26.
 */
public interface StorageAppBiz {
    public List getAllStorageApp();

    public List getStorageAppList(StorageApp condition);

    public void add(StorageApp condition);

  //  public boolean delGoods(StorageApp good);  //删除x

    public boolean editStorageApp(StorageApp StorageApp); //修改AllList
}
