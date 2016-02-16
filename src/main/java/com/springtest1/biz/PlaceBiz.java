package com.springtest1.biz;


import com.hibtest1.entity.Place;

import java.util.List;

/**
 * Created by user on 2015/11/25.
 */
public interface PlaceBiz {
    public List getAllPlace();
    public List<Place> getPlaceList( Place condition);
    public void add(Place condition);
    public boolean editPlace(Place place);
    public List<Place> getPlace(String name);

}
