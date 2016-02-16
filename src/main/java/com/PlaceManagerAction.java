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
public class PlaceManagerAction extends ActionSupport implements RequestAware, SessionAware {
    PlaceBiz placeBiz;
    Map<String, Object> request;
    Map<String, Object> session;
    Place place;

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

    public Place getPlace() {
        return place;
    }

    public void setPlace(Place placer) {
        this.place = placer;
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
        session.put("placelistall", place);
        return "place";
    }

    public String addPlace() throws Exception {                  //增加仓库
        Place condition = new Place();
        if (place.getPlaceName() != null && !place.getPlaceName().equals(""))
            condition.setPlaceName(place.getPlaceName());
        if (place.getPlaceName() != null && !place.getPlaceName().equals(""))        //仓库名称
            condition.setPlaceName(place.getPlaceName());
        if (place.getAddress() != null && !place.getAddress().equals(""))                      //仓库地址
            condition.setAddress(place.getAddress());
        if (place.getReceiver() != null && !place.getReceiver().equals(""))                 //仓库收货人
            condition.setReceiver(place.getReceiver());
        if (place.getTel() != null  && !place.getTel().equals(""))          //联系电话
            condition.setTel(place.getTel());
        placeBiz.add(condition);
        session.put("placelistall", condition);
        return "success";

    }

    public String editPlace() {
        Place p = new Place();
        p.setPlaceId(place.getPlaceId());
        Place condition = placeBiz.getPlaceList(p).get(0);
     /*   if (place.getPlaceId() != null && !place.getPlaceId().equals("")) {
            condition.setPlaceId(place.getPlaceId());
        }*/
        if (place.getPlaceName() != null && !place.getPlaceName().equals("")) {
            condition.setPlaceName(place.getPlaceName());
        }
        if (place.getAddress() != null && !place.getAddress().equals("")) {
            condition.setAddress(place.getAddress());
        }
        if (place.getReceiver() != null && !place.getReceiver().equals("")) {
            condition.setReceiver(place.getReceiver());
        }
        if (place.getTel() != null && !place.getTel().equals("")) {
            condition.setTel(place.getTel());
        }
        if (place.getState() != null && !place.getState() .equals("")) {
            condition.setState(place.getState());
        }
        if (placeBiz.editPlace(condition)) {
            session.put("placelistall", condition);
            return "success";
        } else return "input";
    }

}
