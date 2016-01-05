package com;

import com.hibtest1.entity.Goods;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.GoodsBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

public class GoodsManagerAction extends ActionSupport implements RequestAware, SessionAware {
    GoodsBiz goodsBiz;

    public void setGoodsBiz(GoodsBiz goodsBiz) {
        this.goodsBiz = goodsBiz;
    }

    Map<String, Object> request;
    Map<String, Object> session;

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
        Goods condition = new Goods();
        condition.setGoodsName(goodsName);
        List list = goodsBiz.getGoodsList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Goods goods = (Goods) list.get(0);
            //  session.put("goodslist", list);
            session.put("goodslist", list);
            return "success";
        } else
            return "fail";
    }

    public String addGoods() throws Exception {                  //增加商品
        Goods condition = new Goods();

        if (goods.getGoodsName() != null && !goods.getGoodsName().equals(""))
            condition.setGoodsName(goods.getGoodsName());
        List list = goodsBiz.isGoods(goods);
        if (list.size() > 0) {
          /*  session.put("nowords", "已有该商品，无法添加!");*/
            request.put("nowords", "已有该商品，无法添加!");
            return "input";
        } else

        {
            if (goods.getGoodsBackName() != null)        //后台名字
                condition.setGoodsBackName(goods.getGoodsBackName());
            if (goods.getBaozhiqi() != null)                      //保质期
                condition.setBaozhiqi(goods.getBaozhiqi());
            if (goods.getCreationDate() != null)                 //生成日期
                condition.setCreationDate(goods.getCreationDate());
            if (goods.getExpirationDate() != null)               //截止日期
                condition.setExpirationDate(goods.getExpirationDate());
            if (goods.getGoodsName() != null)          //商品名称
                condition.setGoodsName(goods.getGoodsName());
            if (goods.getLength() != null)              //长
                condition.setLength(goods.getLength());
            if (goods.getMweight() != null)                  //毛重
                condition.setMweight(goods.getMweight());
            if (goods.getPrice() != null)                //价格
                condition.setPrice(goods.getPrice());
            if (goods.getTall() != null)                   //高
                condition.setTall(goods.getTall());
            if (goods.getValue() != null)                   //价值
                condition.setValue(goods.getValue());
            if (goods.getUnit() != null)
                condition.setUnit(goods.getUnit());   //单位
            if (goods.getWide() != null)
                condition.setWide(goods.getWide());   //宽
            if (goods.getVolume() != null)
                condition.setVolume(goods.getVolume());  //体积
            if (goods.getService() != null)
                condition.setService(goods.getService()); //实物服务
            if (goods.getVweight() != null)
                condition.setVweight(goods.getVweight()); //体积重量
            if (goods.getStandard() != null)
                condition.setStandard(goods.getStandard());  //装箱规格
            if (session.get("name") != null) {
                condition.setAdduser(session.get("name").toString()); //得到增加人
            }
            condition.setState("no");
            session.put("goodslist", condition);
            goodsBiz.add(condition);
            return "success";
        }
    }

    public String delGoods() {
        System.out.println(goodsName);
        Goods condition = new Goods();
        condition.setGoodsName(goodsName);
        List<Goods> list = goodsBiz.getGoodsList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Goods goods = new Goods();
            goods = (Goods) list.get(0);
            boolean e = goodsBiz.delGoods(goods);
            if (e) return "success";
            else return "input";
        } else return "input";
    }

    public String listGoods() {
        List goods = goodsBiz.getAllGoods();
        session.put("goodslistall", goods);
        return "goods";
    }

 /*   public String listGoodsTest() {
        List goods = goodsBiz.getAllGoods();
        session.put("goodslistall", goods);
        return NONE;
    }*/

    public String modifyShow() {   //有问题
        Goods condition = new Goods();
        condition.setGoodsName(goodsName);
        List list = goodsBiz.getGoodsList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Goods goods = (Goods) list.get(0);
            session.put("goods", goods);
            return "success";
        } else return "input";
    }

    public String modify() {
        Goods condition = (Goods) session.get("goods");
        if (goods.getGoodsBackName() != null && !goods.getGoodsBackName().equals(""))        //后台名字
            condition.setGoodsBackName(goods.getGoodsBackName());
        if (goods.getBaozhiqi() != null && !goods.getBaozhiqi().equals(""))                      //保质期
            condition.setBaozhiqi(goods.getBaozhiqi());
        if (goods.getCreationDate() != null && !goods.getCreationDate().equals(""))                 //生成日期
            condition.setCreationDate(goods.getCreationDate());
        if (goods.getExpirationDate() != null && !goods.getExpirationDate().equals(""))               //截止日期
            condition.setExpirationDate(goods.getExpirationDate());
        if (goods.getGoodsName() != null && !goods.getGoodsName().equals(""))          //商品名称
            condition.setGoodsName(goods.getGoodsName());
        if (goods.getLength() != null && !goods.getLength().equals(""))              //长
            condition.setLength(goods.getLength());
        if (goods.getMweight() != null && !goods.getMweight().equals(""))                  //毛重
            condition.setMweight(goods.getMweight());
        if (goods.getPrice() != null && !goods.getPrice().equals(""))              //价格
            System.out.println(goods.getPrice() + "更新的价格");
        condition.setPrice(goods.getPrice());
        if (goods.getTall() != null && !goods.getTall().equals(""))                   //高
            condition.setTall(goods.getTall());
        if (goods.getValue() != null && !goods.getValue().equals(""))                   //价值
            condition.setValue(goods.getValue());
        if (goods.getUnit() != null && !goods.getUnit().equals(""))
            condition.setUnit(goods.getUnit());   //单位
        if (goods.getWide() != null && !goods.getWide().equals(""))
            condition.setWide(goods.getWide());   //宽
        if (goods.getVolume() != null && !goods.getVolume().equals(""))
            condition.setVolume(goods.getVolume());  //体积
        if (goods.getService() != null && !goods.getService().equals(""))
            condition.setService(goods.getService()); //实物服务
        if (goods.getVweight() != null && !goods.getVweight().equals(""))
            condition.setVweight(goods.getVweight()); //体积重量
        if (goods.getStandard() != null && !goods.getStandard().equals(""))
            condition.setStandard(goods.getStandard());  //装箱规格
        if (goods.getState() != null && !goods.getState().equals(""))
            condition.setState(goods.getState());  //开放状态
        if (session.get("name") != null) {
            condition.setEdituser(session.get("name").toString()); //得到修改人
        }
        if (goodsBiz.modifyGood(condition)) {
            session.put("goodslist", condition);
            request.put("message", "修改成功");  //先放着
            return "success";
        } else
            return "input";

    }

    public String editGoods() {
        Goods g = new Goods();
        g.setGoodsId(goods.getGoodsId());
        Goods condition = (Goods) goodsBiz.getGoodsList(g).get(0);
        System.out.println("修改的商品id" + goods.getGoodsId());
        if (goods.getGoodsBackName() != null && !goods.getGoodsBackName().equals(""))        //后台名字
            condition.setGoodsBackName(goods.getGoodsBackName());
        if (goods.getBaozhiqi() != null && !goods.getBaozhiqi().equals(""))                      //保质期
            condition.setBaozhiqi(goods.getBaozhiqi());
        if (goods.getCreationDate() != null && !goods.getCreationDate().equals(""))                 //生成日期
            condition.setCreationDate(goods.getCreationDate());
        if (goods.getExpirationDate() != null && !goods.getExpirationDate().equals(""))               //截止日期
            condition.setExpirationDate(goods.getExpirationDate());
        if (goods.getGoodsName() != null && !goods.getGoodsName().equals(""))          //商品名称
            condition.setGoodsName(goods.getGoodsName());
        if (goods.getLength() != null && !goods.getLength().equals(""))              //长
            condition.setLength(goods.getLength());
        if (goods.getMweight() != null && !goods.getMweight().equals(""))                  //毛重
            condition.setMweight(goods.getMweight());
        if (goods.getPrice() != null && !goods.getPrice().equals(""))              //价格
            condition.setPrice(goods.getPrice());
        if (goods.getTall() != null && !goods.getTall().equals(""))                   //高
            condition.setTall(goods.getTall());
        if (goods.getValue() != null && !goods.getValue().equals(""))                   //价值
            condition.setValue(goods.getValue());
        if (goods.getUnit() != null && !goods.getUnit().equals(""))
            condition.setUnit(goods.getUnit());   //单位
        if (goods.getWide() != null && !goods.getWide().equals(""))
            condition.setWide(goods.getWide());   //宽
        if (goods.getVolume() != null && !goods.getVolume().equals(""))
            condition.setVolume(goods.getVolume());  //体积
        if (goods.getService() != null && !goods.getService().equals(""))
            condition.setService(goods.getService()); //实物服务
        if (goods.getVweight() != null && !goods.getVweight().equals(""))
            condition.setVweight(goods.getVweight()); //体积重量
        if (goods.getStandard() != null && !goods.getStandard().equals(""))
            condition.setStandard(goods.getStandard());  //装箱规格
        if (goods.getState() != null && !goods.getState().equals(""))
            condition.setState(goods.getState());  //开放状态
        if (session.get("name") != null) {
            condition.setEdituser(session.get("name").toString()); //得到修改人
        }
        if (goodsBiz.modifyGood(condition)) {
            session.put("goodslist", condition);
            request.put("message", "修改成功");  //先放着
            return "success";
        } else
            return "input";
    }

    public String checkGoods() {               //得到所需审核的单子
        System.out.println("审核checkGoods");
        Goods g = new Goods();
        g.setState("no");
        List<Goods> goods = goodsBiz.getGoodsList(g);
        if (goods.size() > 0) {
            Goods goods1 = (Goods) goods.get(0);
            System.out.println(goods1.getGoodsName());
            session.put("goodslistcheck", goods);
        }
        return "goodsCheck";
    }

    public String checkGoodsSelect() { //得到查询的信息来审核 与search一样
        System.out.println(goodsName);
        Goods condition = new Goods();
        condition.setGoodsName(goodsName);
        List list = goodsBiz.getGoodsList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Goods goods = (Goods) list.get(0);
            //  session.put("goodslist", list);
            session.put("goodslistcheck", list);
            return "success";
        } else
            return "input";
    }
}
