package com;

import com.dto.CommodityDto;
import com.hibtest1.pageBean.PageBean;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.SearchBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2015/12/6.
 */
public class SearchManagerAction extends ActionSupport implements RequestAware, SessionAware {
    SearchBiz searchBiz;
    Map<String, Object> request;
    CommodityDto commodityDto;
    private String goodsName;

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public CommodityDto getCommodityDto() {
        return commodityDto;
    }

    public void setCommodityDto(CommodityDto commodityDto) {
        this.commodityDto = commodityDto;
    }

    public Map<String, Object> getRequest() {
        return request;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public void setSearchBiz(SearchBiz searchBiz) {
        this.searchBiz = searchBiz;
    }

    Map<String, Object> session;
    //分页
    private int page= 1;//第几页
    private List<CommodityDto> listCommodityDto;
    private PageBean pageBean;
  /*private int pageSize;   //下面自己定

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }*/

    public int getPage() {
        return page;
    }

    public void setPage(int page) {//若URL中无此参数,会默认为第1页
        this.page = page;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public List<CommodityDto> getListCommodityDto() {
        return listCommodityDto;
    }

    public void setListCommodityDto(List<CommodityDto> listCommodityDto) {
        this.listCommodityDto = listCommodityDto;
    }

    public String searchInventoryFlow(){
        List<CommodityDto> list = searchBiz.searchInventoryFlow();
        if (list.size() > 0) {
            session.put("inventoryflow", list);
            return "success";
        } else
            return "fail";
      /*  this.pageBean =searchBiz.queryForPage(20, page);
        this.listCommodityDto=this.pageBean.getListCommodityDto();
        session.put("inventoryflow", listCommodityDto);
        session.put("pageBeanCommodityDto", pageBean);
        return "success";*/
    }

    public String searchInventoryFlowGoods() {   //查带商品的总库存流动
        List<CommodityDto> list = searchBiz.searchAllGoods(goodsName);
        session.put("inventoryflowgoods", list);
        return "success";
    }

    public String searchAll()  throws Exception{
      /*  List<CommodityDto> list = searchBiz.searchAll();
        session.put("inventoryflowall", list);
        return "success";*/

        this.pageBean =searchBiz.queryForPage(20, page);
        this.listCommodityDto=this.pageBean.getListCommodityDto();
        session.put("inventoryflowall", listCommodityDto);
        session.put("pagebeancommoditydto", pageBean);
        return "success";
    }

}
