package com.springtest1.biz;

import com.springtest1.dao.WithholdingDAO;

/**
 * Created by dell on 2015/11/29.
 */
public class WithholdingBizImpl implements WithholdingBiz {
    public void setWithholdingDAO(WithholdingDAO withholdingDAO) {
        this.withholdingDAO = withholdingDAO;
    }

    private WithholdingDAO withholdingDAO;
    
}
