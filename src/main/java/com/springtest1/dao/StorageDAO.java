package com.springtest1.dao;

import com.hibtest1.entity.Storage;

import java.util.List;

/**
 * Created by user on 2015/11/27.
 */
public interface StorageDAO {
    public List getAllStorage();
    public List search(Storage condition);   //查询
    public void add(Storage condition);//add
    // public boolean delGoods(Storage condition); //del

    public void editStorage(Storage storage); //修改AllList
}
