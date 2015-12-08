package com.springtest1.biz;

import com.hibtest1.entity.Events;
import com.springtest1.dao.EventsDAO;

/**
 * Created by user on 2015/12/8.
 */
public class EventsBizImpl implements EventsBiz  {
    private EventsDAO eventsDAO;
    public void add(Events events){
         eventsDAO.add(events);
    }

}
