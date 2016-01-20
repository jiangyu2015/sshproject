package com;

import com.dto.EnteringWarehouseDto;
import com.hibtest1.entity.*;
import com.core.util.*;
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
        session.put("storageapplistcheck", storageApp);
        return "storageAppCheck";

    }

    public String storageAppOk() {               //通过          需要增加不能为空的提示
        StorageApp condition = new StorageApp();
        condition.setStorageAppId(storageApp.getStorageAppId());
        int i = storageApp.getStorageAppId();
        List list = storageAppBiz.getStorageAppList(condition);
        StorageApp storageApp = (StorageApp) list.get(0);
        storageApp.setState("yesok");     //更改状态yesok
        Calendar calendar = Calendar.getInstance();   //更改审核时间
        Date date = calendar.getTime();
        storageApp.setAuditTime(date);
        if (session.get("name") != null) {
            storageApp.setCheckuser(session.get("name").toString()); //得到审核人
        }
        storageAppBiz.editStorageApp(storageApp);
        Storage storage = new Storage();           //新建入库明细表

        storage.setStorageAppId(i); //入库明细id增加入库申请id
        Goods goods = goodsBiz.getGoodsList(storageApp.getGoods()).get(0);
        storage.setGoods(goods);
        Producer producer = producerBiz.getProducer(storageApp.getProducerName()).get(0);
        storage.setProducer(producer);
        Place place = placeBiz.getPlace(storageApp.getStoragePlace()).get(0);
        storage.setPlace(place);

        if (storageApp.getExpectedDate() != null && !storageApp.getExpectedDate().equals(""))                      //预期入库时间
            storage.setExpectedDate(storageApp.getExpectedDate());
        if (storageApp.getExpectedNumber() != null && !storageApp.getExpectedNumber().equals(""))               //预收数量
            storage.setExpectedNumber(storageApp.getExpectedNumber());
        if (storageApp.getStorageType() != null && !storageApp.getStorageType().equals(""))          //入库类型
            storage.setStorageType(storageApp.getStorageType());
        if (storageApp.getAdduser() != null && !storageApp.getAdduser().equals("")) //入库申请人加入到入库明细中
            storage.setAdduser(storageApp.getAdduser());
        storage.setCategory("正常入库");
        storage.setState("no");
        storageBiz.add(storage);
        return "success";
    }

    public String searchStorageAppList() {  //改了
        StorageApp condition = new StorageApp();
        if (StringUtils.isEmpty(goodsName) && StringUtils.isEmpty(producerName) && StringUtils.isEmpty(storagePlace)) {          //商品名称不为空
            if (goodsName.indexOf("|") != -1) {
                String[] strs = goodsName.split("\\|");      //增加goods
                Integer id = Integer.parseInt(strs[1]);  //id
                Goods g = new Goods();
                g.setGoodsId(id);
                Goods goods = goodsBiz.getGoodsList(g).get(0);
                condition.setGoods(goods);
            } else {
                Goods g = new Goods();
                g.setGoodsName(goodsName);
                condition.setGoods(g);
            }

            Producer producer = producerBiz.getProducer(producerName).get(0);
            condition.setProducer(producer);
            Place place = placeBiz.getPlace(storagePlace).get(0);
            condition.setPlace(place);
        }


        List list = storageAppBiz.getStorageAppList(condition);
        session.put("storageapplist", list);
        return "success";

    }


    public String addStorageApp() throws Exception {                  //增加入库申请
        StorageApp condition = new StorageApp();
        if (storageApp.getProducerName() != null && !storageApp.getProducerName().equals(""))
            condition.setProducerName(storageApp.getProducerName());
        if (storageApp.getGoodsName() != null && !storageApp.getGoodsName().equals(""))
            condition.setGoodsName(storageApp.getGoodsName());
        if (storageApp.getStoragePlace() != null && !storageApp.getStoragePlace().equals(""))
            condition.setStoragePlace(storageApp.getStoragePlace());
        if (storageApp.getProducerName() != null)        //商户名称   //有名称有id，要改,哎 多此一举，还有前台读出来也要改了
            condition.setProducerName(storageApp.getProducerName());
        if (storageApp.getGoodsName() != null) {          //商品名称
            if (storageApp.getGoodsName().indexOf("|") != -1) {
                String[] strs = storageApp.getGoodsName().split("\\|");      //增加goods
                String name = strs[0];  //名称
                condition.setGoodsName(name);
                Integer id = Integer.parseInt(strs[1]);  //id
                Goods g = new Goods();
                g.setGoodsId(id);
                Goods goods = goodsBiz.getGoodsList(g).get(0);
                condition.setGoods(goods);
            } else return "input";
        }
        if (storageApp.getStoragePlace() != null) {                     //仓库地址
            condition.setStoragePlace(storageApp.getStoragePlace());
        }
        if (storageApp.getExpectedDate() != null)          //预期入库时间
            condition.setExpectedDate(storageApp.getExpectedDate());
        if (storageApp.getExpectedNumber() != null)          //预期入库数量
            condition.setExpectedNumber(storageApp.getExpectedNumber());
        if (storageApp.getSldId() != null)          //三联单编号
            condition.setSldId(storageApp.getSldId());
        if (storageApp.getStorageType() != null && !storageApp.getStorageType().equals(""))          //入库类型
            condition.setStorageType(storageApp.getStorageType());
        condition.setState("no");  //处理状态新增默认为no 待审核
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        condition.setApplicationDate(date);

  /*      if (storageApp.getGoodsName().indexOf("|") != -1) {
            String[] strs = storageApp.getGoodsName().split("\\|");      //增加goods
            Integer id = Integer.parseInt(strs[1]);
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = (Goods) goodsBiz.getGoodsList(g).get(0);
            System.out.println(goods.getGoodsName());
            condition.setGoods(goods);
        } else {
            return "input";
        }*/

        Producer producer = producerBiz.getProducer(storageApp.getProducerName()).get(0);       //增加商户
        condition.setProducer(producer);
        Place place = placeBiz.getPlace(storageApp.getStoragePlace()).get(0); //增加仓库
        condition.setPlace(place);
        if (session.get("name") != null) {                   //得到增加人
            condition.setAdduser(session.get("name").toString());
        }
        storageAppBiz.add(condition);
        session.put("storageapplist", condition);  //两个地方用到，edit不知道会不会有问题
        return "success";

    }


    public String editStorageApp() {
        StorageApp s = new StorageApp();
        s.setStorageAppId(storageApp.getStorageAppId());
        StorageApp condition = (StorageApp) storageAppBiz.getStorageAppList(s).get(0);
        if (storageApp.getProducerName() != null && !storageApp.getProducerName().equals("")) {      //商户名称
            condition.setProducerName(storageApp.getProducerName());
            Producer producer = producerBiz.getProducer(storageApp.getProducerName()).get(0);       //增加商户
            condition.setProducer(producer);
        }
        if (storageApp.getStoragePlace() != null && !storageApp.getStoragePlace().equals("")) {                 //仓库地址
            condition.setStoragePlace(storageApp.getStoragePlace());
            Place place = placeBiz.getPlace(storageApp.getStoragePlace()).get(0); //增加仓库
            condition.setPlace(place);
        }
        if (storageApp.getGoodsName() != null && !storageApp.getGoodsName().equals(""))                 //商品名称
            condition.setGoodsName(storageApp.getGoodsName());
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
        if (session.get("name") != null) {
            condition.setEdituser(session.get("name").toString()); //得到修改人
        }
        if (storageAppBiz.editStorageApp(condition)) {
            session.put("storageapplist", condition);
            return "success";
        } else return "input";

    }


}
