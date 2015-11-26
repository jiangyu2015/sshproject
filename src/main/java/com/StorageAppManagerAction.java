package com;

import com.hibtest1.entity.StorageApp;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.StorageAppBiz;
import org.apache.logging.log4j.core.appender.SyslogAppender;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

/**
 * Created by user on 2015/11/26.
 */
public class StorageAppManagerAction extends ActionSupport implements RequestAware, SessionAware {
    StorageAppBiz storageAppBiz;
    Map<String, Object> request;
    Map<String, Object> session;
    StorageApp storageApp;

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


    public String listStorageApp() {
        List storageApp = storageAppBiz.getAllStorageApp();
        StorageApp storageApp1 = (StorageApp) storageApp.get(0);
        session.put("storageapplistall", storageApp);

        return "storageApp";
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
        List list = storageAppBiz.getStorageAppList(condition);

        System.out.println("ok");

        if (storageApp.getProducerName() != null)        //商户名称
            condition.setProducerName(storageApp.getProducerName());
        if (storageApp.getGoodsName() != null)                 //商品名称
            condition.setGoodsName(storageApp.getGoodsName());
        if (storageApp.getStoragePlace() != null)                      //仓库地址
            condition.setStoragePlace(storageApp.getStoragePlace());
        if (storageApp.getCommodityRating() != null)               //商品评级
            condition.setCommodityRating(storageApp.getCommodityRating());
        if (storageApp.getExpectedDate() != null)          //预期入库时间
            condition.setExpectedDate(storageApp.getExpectedDate());
        if (storageApp.getExpectedNumber() != null)          //预期入库数量
            condition.setExpectedNumber(storageApp.getExpectedNumber());
        if (storageApp.getSldId() != null)          //三联单编号
            condition.setSldId(storageApp.getSldId());
        if (storageApp.getStorageType()!= null)          //入库类型
            condition.setStorageType(storageApp.getStorageType());
        if (storageApp.getState()!= null)          //处理状态
            condition.setState(storageApp.getState());
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
        if (storageApp.getExpectedDate() != null  && !storageApp.getExpectedDate().equals(""))          //预期入库时间
            condition.setExpectedDate(storageApp.getExpectedDate());
        if (storageApp.getExpectedNumber() != null  && !storageApp.getExpectedNumber().equals(""))          //预期入库数量
            condition.setExpectedNumber(storageApp.getExpectedNumber());
        if (storageApp.getSldId() != null && !storageApp.getSldId().equals(""))          //三联单编号
            condition.setSldId(storageApp.getSldId());
        if (storageApp.getState()!= null  && !storageApp.getState().equals(""))          //处理状态
            condition.setState(storageApp.getState());
        if (storageApp.getStorageType()!= null  && !storageApp.getStorageType().equals(""))          //入库类型
            condition.setStorageType(storageApp.getStorageType());

        if (storageAppBiz.editStorageApp(condition)) {
            System.out.println("condition" + condition.getProducerName());
            System.out.println(condition.getGoodsName());
            session.put("storageapplist", condition);
            return "success";
        } else return "input";


    }
}
