package com.springtest1.biz;


import com.hibtest1.entity.TransferApp;

import java.util.List;

/**
 * Created by user on 2015/12/25.
 */
public interface TransferAppBiz {
    public List getAllTransferApp();

    public List getTransferAppList(TransferApp condition);

    public void add(TransferApp condition);

    public boolean editTransferApp(TransferApp transferApp); //修改AllList

    public List<TransferApp> getCheckTransferApp();
}
