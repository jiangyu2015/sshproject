package com;

import com.dto.CommodityDto;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.SearchBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2015/12/6.
 */
public class SearchManagerAction extends ActionSupport implements RequestAware, SessionAware {
    SearchBiz searchBiz;
    Map<String, Object> request;
    CommodityDto commodityDto;

    public CommodityDto getCommodityDto() {
        return commodityDto;
    }

    public void setCommodityDto(CommodityDto commodityDto) {
        this.commodityDto = commodityDto;
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

    public void setSearchBiz(SearchBiz searchBiz) {
        this.searchBiz = searchBiz;
    }

    Map<String, Object> session;

    public String searchInventoryFlow() {
        List<CommodityDto> list = searchBiz.searchInventoryFlow();
        System.out.println(list.size());
        if (list.size() > 0) {
            session.put("inventoryflow", list);
            return "success";
        } else
            return "fail";
    }



}
