package com;

import com.hibtest1.entity.Place;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.PlaceBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

/**
 * Created by user on 2015/11/25.
 */
public class PlaceManagerAction  extends ActionSupport implements RequestAware, SessionAware {
    PlaceBiz placeBiz;
    Map<String, Object> request;
    Map<String, Object> session;
    Place placer;

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

    public Place getPlacer() {
        return placer;
    }

    public void setPlacer(Place placer) {
        this.placer = placer;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public void setPlaceBiz(PlaceBiz placeBiz) {
        this.placeBiz = placeBiz;
    }

    String placeName;

    public String listplace() {
        List place = placeBiz.getAllPlace();
        Place place1 = (Place) place.get(0);
        System.out.print(place1.getPlaceName() + "aaaAction");
        session.put("placelistall", place);
        return "place";
    }
}
