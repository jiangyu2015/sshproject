package com.springtest1.biz;

import java.util.List;
import com.hibtest1.entity.Producer;

/**
 * Created by user on 2015/11/25.
 */
public interface ProducerBiz {
    public List getAllProducer();
    public List getProducerList( Producer condition);
    public void add(Producer condition);
    public boolean delGoods(Producer good);  //删除x
}
