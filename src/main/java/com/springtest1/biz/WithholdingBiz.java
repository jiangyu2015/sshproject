package com.springtest1.biz;

import com.hibtest1.entity.Withholding;

import java.util.List;

/**
 * Created by dell on 2015/11/29.
 */
public interface WithholdingBiz  {
  //  public List getAllWithholding();
  public void add(Withholding withholding);
  public List<Withholding> getAllWithholding();
  public List<Withholding> search( Withholding condition);
  public boolean modifyWithholding(Withholding withholding);
}
