package com;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hibtest1.entity.*;

import com.springtest1.biz.*;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

public class JsonAction extends ActionSupport implements ServletRequestAware {
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

    public void setStorageBiz(StorageBiz storageBiz) {
        this.storageBiz = storageBiz;
    }

    ProducerBiz producerBiz;
    PlaceBiz placeBiz;
    StorageAppBiz storageAppBiz;
    StorageBiz storageBiz;

    public void setWithholdingBiz(WithholdingBiz withholdingBiz) {
        this.withholdingBiz = withholdingBiz;
    }

    DeliverBiz deliverBiz;
    WithholdingBiz withholdingBiz;

    public void setDeliverBiz(DeliverBiz deliverBiz) {
        this.deliverBiz = deliverBiz;
    }

    public void setStorageAppBiz(StorageAppBiz storageAppBiz) {
        this.storageAppBiz = storageAppBiz;
    }

    public void setPlaceBiz(PlaceBiz placeBiz) {
        this.placeBiz = placeBiz;
    }

    public void setProducerBiz(ProducerBiz producerBiz) {
        this.producerBiz = producerBiz;
    }

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
     *
     * @return SUCCESS
     */
    public String excuteAjax() {            //商品

     /*   try {
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
        } */


        try {
            List<Goods> goodslist = goodsBiz.getGoodsCheck();
            Goods g = goodslist.get(0);
            System.out.println(g.getGoodsId() + "传值JsonAction");
            JSONObject json = new JSONObject();
            json.put("goodsList", goodslist);
            result = json.toString();//给result赋值，传递给页面
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String excuteProducerAjax() {    //商户
        try {
            List<Producer> producerlist = producerBiz.getProducerCheck();
            JSONObject json = new JSONObject();
            json.put("producerList", producerlist);
            result = json.toString();
        } catch (Exception e) {
            e.printStackTrace();

        }
        return SUCCESS;
    }

    public String excutePlaceAjax() {
        try {
            List<Place> placeList=placeBiz.getAllPlace();
            JSONObject json = new JSONObject();
            json.put("placeList", placeList);
            result = json.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String excuteCheck() {
        String id = request.getParameter("id");
        int storageAppId = Integer.valueOf(id);
        System.out.println("JsonActionCheck传值"+storageAppId);
        StorageApp condition=new StorageApp();
        condition.setStorageAppId(storageAppId);
        System.out.println(condition.getStorageAppId()+"condition.setStorageAppId");
        List list = storageAppBiz.getStorageAppList(condition);
        System.out.println(list.size());
        StorageApp storageApp=(StorageApp)list.get(0);
        System.out.print(storageApp.getProducerName()+storageApp.getStoragePlace()+storageApp.getGoodsName());
        storageApp.setState("yesno");                               //改申请state
        storageAppBiz.editStorageApp(storageApp);

        return SUCCESS;
    }

    public String doWithholding(){
        String id = request.getParameter("id");
        int storageId = Integer.valueOf(id);
        System.out.println(storageId+"流动的明细取到的id");
        Storage condition=new Storage();
        condition.setStorageId(storageId);
        List<Storage>storageList= storageBiz.getStorageList(condition);
        Storage storage=storageList.get(0);
        Integer goodsId=storage.getGoods().getGoodsId();
        String goodsName=storage.getGoods().getGoodsName();
        Integer placeId=storage.getPlace().getPlaceId();
        String placeName=storage.getPlace().getPlaceName();
        String type=storage.getStorageType();

        Integer producerId=storage.getProducer().getProducerId();
        String producerName=storage.getProducer().getProducerName();
        JSONObject json = new JSONObject();
        json.put("goodsId",goodsId);
        json.put("goodsName",goodsName);
        json.put("placeId",placeId);
        json.put("placeName",placeName);
        json.put("producerId",producerId);
        json.put("producerName",producerName);
        json.put("type",type);
        System.out.println(goodsId+goodsName+placeId+placeName+producerName);
        result = json.toString();
        return SUCCESS;
    }

    public String  doWithholdingCheck(){      //检查是否可以预提，预提数小于等于预提后可用库存
        return SUCCESS;
    }

    public String doDeliver(){
        String id = request.getParameter("id");
        int withholdingId = Integer.valueOf(id);
        System.out.println(withholdingId+"流动的明细取到的id");
        Withholding  condition=new Withholding();
        condition.setWithholdingId(withholdingId);
        List<Withholding>withholdingList= withholdingBiz.search(condition);
        Withholding withholding=withholdingList.get(0);
        Integer goodsId=withholding.getGoods().getGoodsId();
        String goodsName=withholding.getGoods().getGoodsName();
        Integer placeId=withholding.getPlace().getPlaceId();
        String placeName=withholding.getPlace().getPlaceName();
        String type=withholding.getUseType();

        Integer producerId=withholding.getProducer().getProducerId();
        String producerName=withholding.getProducer().getProducerName();
        JSONObject json = new JSONObject();
        json.put("goodsId",goodsId);
        json.put("goodsName",goodsName);
        json.put("placeId",placeId);
        json.put("placeName",placeName);
        json.put("producerId",producerId);
        json.put("producerName",producerName);
        json.put("type",type);
        System.out.println(goodsId+goodsName+placeId+placeName+producerName);
        result = json.toString();
        return SUCCESS;
    }



}
