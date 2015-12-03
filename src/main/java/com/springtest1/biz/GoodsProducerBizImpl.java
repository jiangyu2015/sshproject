package com.springtest1.biz;

import com.hibtest1.entity.GoodsProducer;
import com.springtest1.dao.GoodsProducerDAO;

/**
 * Created by user on 2015/12/3.
 */
public class GoodsProducerBizImpl  implements  GoodsProducerBiz{
    private GoodsProducerDAO goodsProducerdao;
    public void add(GoodsProducer condition) {
        goodsProducerdao.add(condition);
    }
}
