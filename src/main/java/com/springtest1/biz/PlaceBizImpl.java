package com.springtest1.biz;

import com.hibtest1.entity.Place;
import com.springtest1.dao.PlaceDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/11/25.
 */
public class PlaceBizImpl implements PlaceBiz {
    private PlaceDAO placeDAO;

    public void setPlaceDAO(PlaceDAO PlaceDAO) {
        this.placeDAO = PlaceDAO;
    }

    @Transactional
    public List getAllPlace() {
        System.out.println("我经过这里AllPlace");
        return placeDAO.getAllPlace();
    }
    public List<Place> getPlaceList( Place condition){
        List<Place> list = placeDAO.search(condition);
        return list;
    }

    public void add(Place condition) {
        placeDAO.add(condition);
    }
    public boolean editPlace(Place place) {
       placeDAO.editPlace(place);
        return true;
    } //修改


    @Transactional
    public List<Place> getPlace(String name){
        System.out.println("我经过这里getPlaceBiz"+name);
        return placeDAO.getPlace(name);
    }
    
}
