package com;

import com.dto.EnteringWarehouseDto;
import com.hibtest1.entity.*;
import com.hibtest1.entity.StorageApp;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.*;
import org.apache.logging.log4j.core.appender.SyslogAppender;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Date;

/**
 * Created by user on 2015/11/26.
 */
public class StorageAppManagerAction extends ActionSupport implements RequestAware, SessionAware {
    StorageAppBiz storageAppBiz;
    GoodsBiz goodsBiz;
    PlaceBiz placeBiz;
    ProducerBiz producerBiz;
    Map<String, Object> request;

    public void setStorageBiz(StorageBiz storageBiz) {
        this.storageBiz = storageBiz;
    }

    StorageBiz storageBiz;

    public void setGoodsBiz(GoodsBiz goodsBiz) {
        this.goodsBiz = goodsBiz;
    }

    public void setPlaceBiz(PlaceBiz placeBiz) {
        this.placeBiz = placeBiz;
    }

    public void setProducerBiz(ProducerBiz producerBiz) {
        this.producerBiz = producerBiz;
    }

    Map<String, Object> session;
    StorageApp storageApp;

    //  EnteringWarehouseDto enteringWarehouseDto;

    String goodsName;
    String producerName;
    String storagePlace;

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getStoragePlace() {
        return storagePlace;
    }

    public void setStoragePlace(String storagePlace) {
        this.storagePlace = storagePlace;
    }

    public void setStorageAppBiz(StorageAppBiz storageAppBiz) {
        this.storageAppBiz = storageAppBiz;
    }

    public Map<String, Object> getRequest() {
        return request;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public StorageApp getStorageApp() {
        return storageApp;
    }

    public void setStorageApp(StorageApp storageApp) {
        this.storageApp = storageApp;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public String listStorageApp() {               //得到所有入库申请单
        List storageApp = storageAppBiz.getAllStorageApp();
        StorageApp storageApp1 = (StorageApp) storageApp.get(0);
        System.out.println(storageApp1.getGoodsName());
        session.put("storageapplistall", storageApp);

        return "storageApp";
    }

    public String checkStorageApp() {               //得到所需审核的单子
        System.out.println("审核checkStorageApp");
        List<StorageApp> storageApp = storageAppBiz.getCheckStorageApp();
        StorageApp storageApp1 = (StorageApp) storageApp.get(0);
        System.out.println(storageApp1.getGoodsName());
        session.put("storageapplistcheck", storageApp);
        return "storageAppCheck";
    }

    public String storageAppOk() {               //通过
        System.out.println("通过checkStorageApp");
        StorageApp condition = new StorageApp();
        System.out.println(storageApp.getStorageAppId());
        condition.setStorageAppId(storageApp.getStorageAppId());
        System.out.println(condition.getGoodsName() + "商户" + condition.getProducerName() + condition.getStoragePlace());
        List list = storageAppBiz.getStorageAppList(condition);
        System.out.println(list.size());
        StorageApp storageApp = (StorageApp) list.get(0);
        storageApp.setState("yesok");
        storageAppBiz.editStorageApp(storageApp);                //更改状态yesok
        Storage storage = new Storage();           //新建入库明细表
      /*  if (storageApp.getGoods().getGoodsId() != null && !storageApp.getGoods().getGoodsId().equals(""))        //商品id
            storage.setGoodsId(storageApp.getGoods().getGoodsId());
        if (storageApp.getProducer().getProducerId() != null && !storageApp.getProducer().getProducerId().equals(""))        //商户id
            storage.setProducerId(storageApp.getProducer().getProducerId());
        if (storageApp.getPlace().getPlaceId() != null && !storageApp.getPlace().getPlaceId().equals("")) {              //仓库id
            System.out.println("入库明细添加仓库id我传过来了" + storage.getPlaceId());
            storage.setPlaceId(storageApp.getPlace().getPlaceId());
        }*/


        Goods goods = goodsBiz.getGoods(storageApp.getGoodsName()).get(0);
        storage.setGoods(goods);
        Producer producer = producerBiz.getProducer(storageApp.getProducerName()).get(0);
        storage.setProducer(producer);
        Place place = placeBiz.getPlace(storageApp.getStoragePlace()).get(0);
        System.out.println("输出仓库id" + place.getPlaceId());
        storage.setPlace(place);


        if (storageApp.getExpectedDate() != null && !storageApp.getExpectedDate().equals(""))                      //预期入库时间
            storage.setExpectedDate(storageApp.getExpectedDate());
        if (storageApp.getExpectedNumber() != null && !storageApp.getExpectedNumber().equals(""))               //预收数量
            storage.setExpectedNumber(storageApp.getExpectedNumber());
        if (storageApp.getStorageType() != null && !storageApp.getStorageType().equals(""))          //入库类型
            storage.setStorageType(storageApp.getStorageType());
        storage.setState("no");
        storageBiz.add(storage);
        return "success";
    }

    public String searchStorageList() {
        System.out.println(producerName);
        StorageApp condition = new StorageApp();
        condition.setProducerName(producerName);
        // condition.setGoodsName(goodsName);
        List list = storageAppBiz.getStorageAppList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            //    StorageApp storageApp = new StorageApp();
            //  session.put("goodslist", list);
            session.put("storageapplist", list);
            return "success";
        } else
            return "input";
    }

 /*   public String delStorageApp() {
        System.out.println(storageAppName);
        StorageApp condition = new StorageApp();
        condition.setStorageAppName(storageAppName);
        List<StorageApp> list = storageAppBiz.getStorageAppList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            StorageApp storageApp = new StorageApp();
            storageApp = (StorageApp) list.get(0);
            boolean e = storageAppBiz.delGoods(storageApp);
            if (e) return "success";
            else return "input";
        } else return "input";
    }  */

    public String addStorageApp() throws Exception {                  //增加入库申请
        //    System.out.println(enteringWarehouseDto);
        System.out.println("addStorageApp");
        StorageApp condition = new StorageApp();
        System.out.println(storageApp.getProducerName() + "入库申请我传过来了");
        if (storageApp.getProducerName() != null && !storageApp.getProducerName().equals(""))
            condition.setProducerName(storageApp.getProducerName());
        else {
            ActionContext.getContext().put("yesWords", "请输入商户名称!");
            return "input";
        }
        if (storageApp.getGoodsName() != null && !storageApp.getGoodsName().equals(""))
            condition.setGoodsName(storageApp.getGoodsName());
        else {
            ActionContext.getContext().put("yesWords", "请输入商品名称!");
            return "input";
        }
        if (storageApp.getStoragePlace() != null && !storageApp.getStoragePlace().equals(""))
            condition.setStoragePlace(storageApp.getStoragePlace());
        else {
            ActionContext.getContext().put("yesWords", "请输入仓库名称!");
            return "input";
        }
        System.out.println("ok");

        if (storageApp.getProducerName() != null)        //商户名称
            condition.setProducerName(storageApp.getProducerName());
        if (storageApp.getGoodsName() != null)                 //商品名称
            condition.setGoodsName(storageApp.getGoodsName());
        if (storageApp.getStoragePlace() != null) {                     //仓库地址
            condition.setStoragePlace(storageApp.getStoragePlace());
            System.out.print("传入仓库地址" + storageApp.getStoragePlace());
        }
        if (storageApp.getCommodityRating() != null)               //商品评级
            condition.setCommodityRating(storageApp.getCommodityRating());
        if (storageApp.getExpectedDate() != null)          //预期入库时间
            condition.setExpectedDate(storageApp.getExpectedDate());
        if (storageApp.getExpectedNumber() != null)          //预期入库数量
            condition.setExpectedNumber(storageApp.getExpectedNumber());
        if (storageApp.getSldId() != null)          //三联单编号
            condition.setSldId(storageApp.getSldId());
        if (storageApp.getStorageType() != null && !storageApp.getStorageType().equals(""))          //入库类型
            condition.setStorageType(storageApp.getStorageType());
      /*  if (storageApp.getState() != null)          //处理状态
            condition.setState(storageApp.getState());*/
        condition.setState("no");  //处理状态新增默认为no 待审核
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        condition.setApplicationDate(date);
        System.out.println("当前时间" + date);
        Goods goods = goodsBiz.getGoods(storageApp.getGoodsName()).get(0);
        condition.setGoods(goods);
        Producer producer = producerBiz.getProducer(storageApp.getProducerName()).get(0);
        condition.setProducer(producer);
        Place place = placeBiz.getPlace(storageApp.getStoragePlace()).get(0);
        System.out.println("输出仓库id" + place.getPlaceId());
        condition.setPlace(place);
        storageAppBiz.add(condition);
        return "success";

    }

  /*  public String modifyShow() {                        //更新显示
        StorageApp condition = new StorageApp();
        condition.setStorageAppName(storageAppName);
        List list = storageAppBiz.getStorageAppList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            StorageApp storageApp = new StorageApp();
            storageApp = (StorageApp) list.get(0);
            session.put("storageApp", storageApp);
            return "success";
        } else return "input";
    } */

    public String editStorageApp() {
        StorageApp condition = new StorageApp();
        if (storageApp.getStorageAppId() != null && !storageApp.getStorageAppId().equals("")) {
            condition.setStorageAppId(storageApp.getStorageAppId());
        }
        if (storageApp.getProducerName() != null && !storageApp.getProducerName().equals(""))        //商户名称
            condition.setProducerName(storageApp.getProducerName());
        if (storageApp.getStoragePlace() != null && !storageApp.getStoragePlace().equals(""))                      //仓库地址
            condition.setStoragePlace(storageApp.getStoragePlace());
        if (storageApp.getGoodsName() != null && !storageApp.getGoodsName().equals(""))                 //商品名称
            condition.setGoodsName(storageApp.getGoodsName());
        if (storageApp.getCommodityRating() != null && !storageApp.getCommodityRating().equals(""))               //商品评级
            condition.setCommodityRating(storageApp.getCommodityRating());
        if (storageApp.getExpectedDate() != null && !storageApp.getExpectedDate().equals(""))          //预期入库时间
            condition.setExpectedDate(storageApp.getExpectedDate());
        if (storageApp.getExpectedNumber() != null && !storageApp.getExpectedNumber().equals(""))          //预期入库数量
            condition.setExpectedNumber(storageApp.getExpectedNumber());
        if (storageApp.getSldId() != null && !storageApp.getSldId().equals(""))          //三联单编号
            condition.setSldId(storageApp.getSldId());
        if (storageApp.getState() != null && !storageApp.getState().equals(""))          //处理状态
            condition.setState(storageApp.getState());
        if (storageApp.getStorageType() != null && !storageApp.getStorageType().equals(""))          //入库类型
            condition.setStorageType(storageApp.getStorageType());
        if (storageAppBiz.editStorageApp(condition)) {
            System.out.println("condition" + condition.getProducerName());
            System.out.println(condition.getGoodsName());
            session.put("storageapplist", condition);
            return "success";
        } else return "input";

    }


}
