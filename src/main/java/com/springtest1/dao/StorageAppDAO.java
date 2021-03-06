package com.springtest1.dao;

import com.hibtest1.entity.StorageApp;

import java.util.List;

/**
 * Created by user on 2015/11/26.
 */
public interface StorageAppDAO {
    public List getAllStorageApp();

    public List search(StorageApp condition);   //查询

    public void add(StorageApp condition);//add

    public void editStorageApp(StorageApp storageApp); //修改AllList\

    public List<StorageApp> getCheckStorageApp();

}
