package com.springtest1.dao;

/**
 * Created by user on 2015/12/25.
 */

import java.util.List;
import com.hibtest1.entity.AllotApp;

public  interface AllotAppDAO {
    public List getAllAllotApp();
    public List search(AllotApp condition);   //查询
    public void add(AllotApp condition);//add

    public void editAllotApp(AllotApp allotApp); //修改AllList

    public List<AllotApp> getCheckAllotApp();
}