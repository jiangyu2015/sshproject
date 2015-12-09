package com;

import com.hibtest1.entity.Events;

import com.hibtest1.entity.Goods;
import com.hibtest1.entity.Withholding;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.EventsBiz;
import com.springtest1.biz.GoodsBiz;
import com.springtest1.biz.PlaceBiz;
import com.springtest1.biz.WithholdingBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

/**
 * Created by user on 2015/12/8.
 */
public class WithholdingManagerAction extends ActionSupport implements RequestAware, SessionAware {
    EventsBiz eventsBiz;
    WithholdingBiz withholdingBiz;
    GoodsBiz goodsbiz;
    PlaceBiz placebiz;

    public void setEventsBiz(EventsBiz eventsBiz) {
        this.eventsBiz = eventsBiz;
    }

    public void setWithholdingBiz(WithholdingBiz withholdingBiz) {
        this.withholdingBiz = withholdingBiz;
    }

    public void setGoodsbiz(GoodsBiz goodsbiz) {
        this.goodsbiz = goodsbiz;
    }

    public void setPlacebiz(PlaceBiz placebiz) {
        this.placebiz = placebiz;
    }

    public Map<String, Object> getRequest() {
        return request;
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

    public Withholding getWithholding() {
        return withholding;
    }

    public void setWithholding(Withholding withholding) {
        this.withholding = withholding;
    }

    public Events getEvents() {
        return events;
    }

    public void setEvents(Events events) {
        this.events = events;
    }

    Map<String, Object> request;
    Map<String, Object> session;
    Events events;
    Withholding withholding;

    public String addEvents() {
        Events condition = new Events();
        if (events.getEventName() != null && !events.getEventName().equals(""))
            condition.setEventName(events.getEventName());
        if (events.getActivityId() != null && !events.getActivityId().equals(""))
            condition.setActivityId(events.getActivityId());
        if (events.getRemark() != null && !events.getRemark().equals(""))
            condition.setRemark(events.getRemark());
        //还要增加userName
        eventsBiz.add(condition);
        return "success";
    }




}
