package com.springtest1.biz;

import com.dto.EnteringWarehouseDto;
import com.hibtest1.entity.StorageApp;

import java.util.List;

/**
 * Created by user on 2015/11/26.
 */
public interface StorageAppBiz {
    public List getAllStorageApp();

    public List getStorageAppList(StorageApp condition);

    public void add(StorageApp condition);

    void add(EnteringWarehouseDto enteringWarehouseDto);

    //  public boolean delGoods(StorageApp good);  //删除x

    public boolean editStorageApp(StorageApp storageApp); //修改AllList
}
