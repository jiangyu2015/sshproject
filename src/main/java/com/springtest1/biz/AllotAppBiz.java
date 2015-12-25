package com.springtest1.biz;

import com.dto.EnteringWarehouseDto;
import com.hibtest1.entity.AllotApp;

import java.util.List;

/**
 * Created by user on 2015/12/25.
 */
public interface AllotAppBiz {
    public List getAllAllotApp();

    public List getAllotAppList(AllotApp condition);

    public void add(AllotApp condition);

    public boolean editAllotApp(AllotApp allotApp); //修改AllList

    public List<AllotApp> getCheckAllotApp();
}
