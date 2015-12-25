package com.springtest1.biz;


import com.hibtest1.entity.AllotApp;
import com.springtest1.dao.AllotAppDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/12/25.
 */
public class AllotAppBizImpl implements AllotAppBiz {
    private AllotAppDAO allotAppDAO;

    public void setAllotAppDAO(AllotAppDAO allotAppDAO) {
        this.allotAppDAO = allotAppDAO;
    }

    @Transactional
    public List getAllAllotApp() {
        return allotAppDAO.getAllAllotApp();
    }

    @Transactional
    public List<AllotApp> getCheckAllotApp() {    //审核单子
        return allotAppDAO.getCheckAllotApp();
    }

    public List getAllotAppList(AllotApp condition) {
        List list = allotAppDAO.search(condition);
        return list;
    }

    public void add(AllotApp condition) {
        allotAppDAO.add(condition);
    }

    public boolean editAllotApp(AllotApp allotApp) {
        allotAppDAO.editAllotApp(allotApp);
        return true;
    } //修改AllList商品

}
