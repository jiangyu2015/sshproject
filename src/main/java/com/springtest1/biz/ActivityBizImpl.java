package com.springtest1.biz;

import com.hibtest1.entity.Activity;
import com.springtest1.dao.ActivityDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dell on 2015/11/29.
 */
public class ActivityBizImpl implements ActivityBiz {
    private ActivityDAO activityDAO;
    public void setActivityDAO(ActivityDAO activityDAO) {
        this.activityDAO = activityDAO;
    }

    @Transactional
    public List<Activity> getAllActivity() {
        return activityDAO.getAllActivity();
    }
}
