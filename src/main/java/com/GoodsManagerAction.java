package com;

import com.hibtest1.entity.Goods;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.GoodsBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

public class GoodsManagerAction extends ActionSupport implements RequestAware,SessionAware{
	GoodsBiz goodsBiz;
	
	public void setGoodsBiz(GoodsBiz goodsBiz) {
		this.goodsBiz = goodsBiz;
	}
	Map<String,Object> request;
	Map<String,Object> session;

	public Map<String, Object> getRequest() {
		return request;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	private Goods goods;
	private String goodsName;

	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
/*	public String searchGoodsList(){
		List goodsList=goodsBiz.getGoodsList();
		session.put("goodsList", goodsList);
		return "goodsList";
	}
	
*/
	public String searchGoodsList() {
		System.out.println(goodsName);
		Goods condition=new Goods();
		condition.setGoodsName(goodsName);
		List list = goodsBiz.getGoodsList(condition);
		if (list.size() > 0) {
			Goods goods = new Goods();
			goods  = (Goods) list.get(0);
			session.put("goodslist", list);
			return "success";
		} else
			return "fail";
	}
	
	public String addGoods() throws Exception {
		Goods condition = new Goods();
		System.out.println(goods.getGoodsName());
		if (goods.getGoodsName() != null && !goods.getGoodsName().equals(""))
			condition.setGoodsName(goods.getGoodsName());
		else {
			ActionContext.getContext().put("yesWords", "请输入商品名称!");
			return "input";
		}
		List list = goodsBiz.getGoodsList(condition);
		if (list.size() > 0) {
			System.out.println("yes");
			ActionContext.getContext().put("noWords", "已有该商品，无法添加!");
			return "input";
		} else {
			System.out.println("ok");
			if (goods.getGoodsBackName() != null)
				condition.setGoodsBackName(goods.getGoodsBackName());
			if (goods.getBaozhiqi()!= null)
				condition.setBaozhiqi(goods.getBaozhiqi());
			if (goods.getCreationDate()!= null)
				condition.setCreationDate(goods.getCreationDate());
			if (goods.getExpirationDate()!= null)
				condition.setExpirationDate(goods.getExpirationDate());
			if (goods.getGoodsName()!= null)
				condition.setGoodsName(goods.getGoodsName());
			if (goods.getLength()!= null)
				condition.setLength(goods.getLength());
			if(goods.getMweight()!=null)
				condition.setMweight(goods.getMweight());   //没写完
			
			 
			goodsBiz.add(condition);
			return "success";
		}
	}

}
