package com.springtest1.dao;

import com.hibtest1.entity.TransferApp;

import java.util.List;

/**
 * Created by user on 2015/12/25.
 */
public interface TransferAppDAO {
    public List getAllTransferApp();

    public List search(TransferApp condition);   //查询

    public void add(TransferApp condition);//add

    public void editTransferApp(TransferApp transferApp); //修改AllList\

    public List<TransferApp> getCheckTransferApp();

}



