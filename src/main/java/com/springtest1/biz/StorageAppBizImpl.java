package com.springtest1.biz;

import com.dto.EnteringWarehouseDto;
import com.hibtest1.entity.StorageApp;
import com.springtest1.dao.StorageAppDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/11/26.
 */
public class StorageAppBizImpl implements StorageAppBiz {
    private StorageAppDAO storageAppDAO;

    public void setStorageAppDAO(StorageAppDAO storageAppDAO) {
        this.storageAppDAO = storageAppDAO;
    }

    @Transactional
    public List getAllStorageApp() {
        return storageAppDAO.getAllStorageApp();
    }

    @Transactional
    public List<StorageApp> getCheckStorageApp() {    //审核单子
        return storageAppDAO.getCheckStorageApp();
    }

    public List getStorageAppList(StorageApp condition) {
        List list = storageAppDAO.search(condition);
        return list;
    }

    public void add(StorageApp condition) {
        System.out.println("BIzImpl传值商品" + condition.getGoodsName() + "商户" + condition.getProducerName() + "库存地点" + condition.getStoragePlace());
        storageAppDAO.add(condition);
    }

    @Override
    public void add(EnteringWarehouseDto enteringWarehouseDto) {
        StorageApp storageApp = new StorageApp();
        storageApp.setSldId(enteringWarehouseDto.getGoodsId());
        storageAppDAO.add(storageApp);
    }

  /*  public boolean delGoods(StorageApp storageApp) {
        return storageAppDAO.delGoods(storageApp);
    }  */

    public boolean editStorageApp(StorageApp storageApp) {
        System.out.println("biz里面的" + storageApp.getProducerName());
        storageAppDAO.editStorageApp(storageApp);
        return true;
    } //修改AllList商品

}
