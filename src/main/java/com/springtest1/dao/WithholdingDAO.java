package com.springtest1.dao;

import com.hibtest1.entity.Withholding;

import java.util.List;

/**
 * Created by dell on 2015/11/29.
 */
public interface WithholdingDAO {
  //  public List getAllWithholding();
   public void add(Withholding withholding); //预提添加
    public List<Withholding> getAllWithholding();
    public List<Withholding> search(final Withholding condition);//按条件查询
    public void modifyWithholding(Withholding withholding);
}
