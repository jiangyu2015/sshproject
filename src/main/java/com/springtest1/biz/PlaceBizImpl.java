package com.springtest1.biz;

import com.hibtest1.entity.Place;
import com.springtest1.dao.PlaceDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by user on 2015/11/25.
 */
public class PlaceBizImpl implements PlaceBiz {
    private PlaceDAO PlaceDAO;

    public void setPlaceDAO(PlaceDAO PlaceDAO) {
        this.PlaceDAO = PlaceDAO;
    }

    @Transactional
    public List getAllPlace() {
        System.out.println("我经过这里AllPlace");
        return PlaceDAO.getAllPlace();
    }
    public List getPlaceList( Place condition){
        List list = PlaceDAO.search(condition);
        return list;
    }

    public void add(Place condition) {
        PlaceDAO.add(condition);
    }

    public boolean delGoods(Place Place) {
        return PlaceDAO.delGoods(Place);
    }
    
}
