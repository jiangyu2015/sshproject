package com.springtest1.biz;

import com.hibtest1.entity.TransferApp;
import com.springtest1.dao.TransferAppDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/12/25.
 */
public class TransferAppBizImpl  implements TransferAppBiz {
    private TransferAppDAO transferAppDAO;

    public void setTransferAppDAO(TransferAppDAO transferAppDAO) {
        this.transferAppDAO = transferAppDAO;
    }

    @Transactional
    public List getAllTransferApp() {
        return transferAppDAO.getAllTransferApp();
    }

    @Transactional
    public List<TransferApp> getCheckTransferApp() {    //审核单子
        return transferAppDAO.getCheckTransferApp();
    }

    public List getTransferAppList(TransferApp condition) {
        List list = transferAppDAO.search(condition);
        return list;
    }

    public void add(TransferApp condition) {
        transferAppDAO.add(condition);
    }

    public boolean editTransferApp(TransferApp transferApp) {
        transferAppDAO.editTransferApp(transferApp);
        return true;
    } //修改AllList商品

}

