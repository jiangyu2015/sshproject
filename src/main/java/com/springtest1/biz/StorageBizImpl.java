package com.springtest1.biz;

import com.hibtest1.entity.Storage;
import com.springtest1.dao.StorageDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/11/27.
 */
public class StorageBizImpl implements StorageBiz {
    private StorageDAO storageDAO;

    public void setStorageDAO(StorageDAO storageDAO) {
        this.storageDAO = storageDAO;
    }

    @Transactional
    public List<Storage> getCheckStorage() {    //审核单子
        return storageDAO.getCheckStorage();
    }

    @Transactional
    public List getAllStorage() {
        return storageDAO.getAllStorage();
    }

    public List getStorageList(Storage condition) {

        List list = storageDAO.search(condition);
        return list;
    }

    public void add(Storage condition) {
        storageDAO.add(condition);
    }

  /*  public boolean delGoods(Storage storage) {
        return storageDAO.delGoods(storage);
    }  */

    public boolean editStorage(Storage storage) {
        storageDAO.editStorage(storage);
        return true;
    } //修改AllList商品
}
