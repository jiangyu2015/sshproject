package com.springtest1.biz;

import com.hibtest1.entity.Withholding;
import com.springtest1.dao.WithholdingDAO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dell on 2015/11/29.
 */
public class WithholdingBizImpl implements WithholdingBiz {
    public void setWithholdingDAO(WithholdingDAO withholdingDAO) {
        this.withholdingDAO = withholdingDAO;
    }

    private WithholdingDAO withholdingDAO;

    public void add(Withholding withholding) {
        withholdingDAO.add(withholding);
    }

    @Transactional
    public List<Withholding> getAllWithholding() {
        return withholdingDAO.getAllWithholding();
    }

    public List<Withholding> search(Withholding condition) {
        return withholdingDAO.search(condition);
    }

    public boolean modifyWithholding(Withholding withholding) {
        withholdingDAO.modifyWithholding(withholding);
        return true;
    }

}
