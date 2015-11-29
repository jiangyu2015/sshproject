package com;

import com.hibtest1.entity.Activity;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.ActivityBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2015/11/29.
 */
public class ActivityManagerAction extends ActionSupport implements RequestAware, SessionAware {
    ActivityBiz activityBiz;
    Map<String, Object> request;
    Map<String, Object> session;
    Activity activity;

    public Map<String, Object> getRequest() {
        return request;
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public void setActivityBiz(ActivityBiz activityBiz) {
        this.activityBiz = activityBiz;

    }

    public String listActivity() {
        List<Activity> activities = activityBiz.getAllActivity();
        Activity activity = (Activity) activities.get(0);
        System.out.println("id" + activity.getAid() + "活动类型" + activity.getActivityType()
                + "活动消耗" + activity.getConsumeNumber() + "活动id" + activity.getWithholding().getActivityId()
                + "活动预提总数" + activity.getWithholding().getWitholdingNumber());
        session.put("activitylistall", activities);
        return "activity";
    }
}
