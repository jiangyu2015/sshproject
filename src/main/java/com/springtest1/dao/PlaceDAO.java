package com.springtest1.dao;

import java.util.List;
import com.hibtest1.entity.Place;

/**
 * Created by user on 2015/11/25.
 */
public interface PlaceDAO {
    public List getAllPlace();
    public List<Place> search(Place condition);   //查询
    public void add(Place condition);//add
    public void editPlace(Place place);

    public List<Place> getPlace(String name);  //找id查询

}
