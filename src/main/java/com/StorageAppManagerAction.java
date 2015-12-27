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
        session.put("storageapplistcheck", storageApp);
        return "storageAppCheck";

    }

    public String storageAppOk() {               //通过          需要增加不能为空的提示
        System.out.println("通过checkStorageApp");
        StorageApp condition = new StorageApp();
        System.out.println(storageApp.getStorageAppId());
        condition.setStorageAppId(storageApp.getStorageAppId());
        System.out.println(condition.getGoodsName() + "商户" + condition.getProducerName() + condition.getStoragePlace());
        List list = storageAppBiz.getStorageAppList(condition);
        System.out.println(list.size());
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

        Goods goods = (Goods) goodsBiz.getGoodsList(storageApp.getGoods()).get(0);
        System.out.println("StorageApp通过时传入的商品id是" + goods.getGoodsId());
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
        if (storageApp.getAdduser() != null && !storageApp.getAdduser().equals("")) //入库申请人加入到入库明细中
            storage.setAdduser(storageApp.getAdduser());
        storage.setCategory("正常入库");
        storage.setState("no");
        storageBiz.add(storage);
        return "success";
    }

    public String searchStorageAppList() {  //改了
        System.out.println(producerName);
        StorageApp condition = new StorageApp();
        condition.setProducerName(producerName);
        // condition.setGoodsName(goodsName);
        List list = storageAppBiz.getStorageAppList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {

            session.put("storageapplist", list);
            return "success";
        } else
            return "input";
    }


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
        System.out.println("ok");

        if (storageApp.getProducerName() != null)        //商户名称   //有名称有id，要改,哎 多此一举，还有前台读出来也要改了
            condition.setProducerName(storageApp.getProducerName());
        if (storageApp.getGoodsName() != null) {          //商品名称
            if (storageApp.getGoodsName().indexOf("|") != -1) {
                String[] strs = storageApp.getGoodsName().split("\\|");      //增加goods
                String name = strs[0];
                condition.setGoodsName(name);
            } else return "input";
        }
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
        condition.setState("no");  //处理状态新增默认为no 待审核
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        condition.setApplicationDate(date);
        System.out.println("当前时间" + date);
        if (storageApp.getGoodsName().indexOf("|") != -1) {
            String[] strs = storageApp.getGoodsName().split("\\|");      //增加goods
            Integer id = Integer.parseInt(strs[1]);
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = (Goods) goodsBiz.getGoodsList(g).get(0);
            System.out.println(goods.getGoodsName());
            condition.setGoods(goods);
        } else {
            return "input";
        }

        Producer producer = producerBiz.getProducer(storageApp.getProducerName()).get(0);       //增加商户
        condition.setProducer(producer);
        Place place = placeBiz.getPlace(storageApp.getStoragePlace()).get(0);
        System.out.println("输出仓库id" + place.getPlaceId());
        condition.setPlace(place);
        if (session.get("name") != null) {                   //得到增加人
            condition.setAdduser(session.get("name").toString());
        }
        storageAppBiz.add(condition);
        session.put("storageapplist", condition);  //两个地方用到，edit不知道会不会有问题
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
        StorageApp s = new StorageApp();
        s.setStorageAppId(storageApp.getStorageAppId());
        StorageApp condition = new StorageApp();
        condition = (StorageApp) storageAppBiz.getStorageAppList(s).get(0);
     /*   if (storageApp.getStorageAppId() != null && !storageApp.getStorageAppId().equals("")) {
            condition.setStorageAppId(storageApp.getStorageAppId());
        }*/
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
        if (session.get("name") != null) {
            condition.setEdituser(session.get("name").toString()); //得到修改人
        }
        if (storageAppBiz.editStorageApp(condition)) {
            System.out.println("condition" + condition.getProducerName());
            System.out.println(condition.getGoodsName());
            session.put("storageapplist", condition);
            return "success";
        } else return "input";

    }


}
