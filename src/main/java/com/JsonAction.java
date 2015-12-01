package com;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hibtest1.entity.Goods;
import com.springtest1.biz.GoodsBiz;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

public class JsonAction extends ActionSupport implements ServletRequestAware{
    private static final long serialVersionUID = 1L;

    private HttpServletRequest request;
    private String result;
    private Goods goods;

    public void setGoodsBiz(GoodsBiz goodsBiz) {
        this.goodsBiz = goodsBiz;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    GoodsBiz goodsBiz;

    public void setServletRequest(HttpServletRequest arg0) {
        this.request = arg0;
    }
    public String getResult() {
        return result;
    }
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * 处理ajax请求
     * @return SUCCESS
     */
    public String excuteAjax(){

 /*       try {
            //获取数据
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String position = request.getParameter("position");

            //将数据存储在map里，再转换成json类型数据，也可以自己手动构造json类型数据
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("name", name);
            map.put("age",age);
            map.put("position", position);

            JSONObject json = JSONObject.fromObject(map);//将map对象转换成json类型数据
            result = json.toString();//给result赋值，传递给页面
        } catch (Exception e) {
            e.printStackTrace();
        }  */

        try{
            String name=request.getParameter("item");

        }catch (Exception e) {
            e.printStackTrace();
        }

        return SUCCESS;
    }


}
