package com;

import com.hibtest1.entity.Goods;
import com.hibtest1.entity.Place;
import com.hibtest1.entity.Producer;
import com.hibtest1.entity.Storage;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.GoodsBiz;
import com.springtest1.biz.PlaceBiz;
import com.springtest1.biz.ProducerBiz;
import com.springtest1.biz.StorageBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.StrutsConversionErrorInterceptor;

import java.util.List;
import java.util.Map;

/**
 * Created by user on 2015/11/27.
 */
public class StorageManagerAction extends ActionSupport implements RequestAware, SessionAware {
    StorageBiz storageBiz;
    GoodsBiz goodsBiz;
    PlaceBiz placeBiz;
    ProducerBiz producerBiz;
    Map<String, Object> request;
    Map<String, Object> session;

    public void setGoodsBiz(GoodsBiz goodsBiz) {
        this.goodsBiz = goodsBiz;
    }

    public void setPlaceBiz(PlaceBiz placeBiz) {
        this.placeBiz = placeBiz;
    }

    public void setProducerBiz(ProducerBiz producerBiz) {
        this.producerBiz = producerBiz;
    }

    Storage storage;
    String goodsName;   //商品名称
    String producerName;//商户
    String category;//查询用到类别
    Integer storageNumber;

    public Integer getStorageNumber() {
        return storageNumber;
    }

    public void setStorageNumber(Integer storageNumber) {
        this.storageNumber = storageNumber;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getStoragePlace() {
        return storagePlace;
    }

    public void setStoragePlace(String storagePlace) {
        this.storagePlace = storagePlace;
    }

    String storagePlace;  //入库地点

    public void setStorageBiz(StorageBiz storageBiz) {
        this.storageBiz = storageBiz;
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

    public Storage getStorage() {
        return storage;
    }

    public void setStorage(Storage storage) {
        this.storage = storage;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String listStorage() {
        List storage = storageBiz.getAllStorage();
        session.put("storagelistall", storage);
        return "storage";
    }

    public String searchStorageList() {      //增加这个方法需要注入 biz别忘了
        Storage condition = new Storage();
        if (goodsName != null && !goodsName.equals("")) {
        /*    if (goodsName.indexOf("|") != -1) {*/  //前台判断
            String[] strs = goodsName.split("\\|");
            Integer id = Integer.parseInt(strs[1]);
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = goodsBiz.getGoodsList(g).get(0);
            System.out.println(goods.getGoodsName());
            condition.setGoods(goods);
        }
        if (producerName != null && !producerName.equals("")) {
            Producer producer = producerBiz.getProducer(producerName).get(0);
            condition.setProducer(producer);

        }
        if (storagePlace != null && !storagePlace.equals("")) {
            Place place = placeBiz.getPlace(storagePlace).get(0);
            condition.setPlace(place);
        }
        List list = storageBiz.getStorageList(condition);
        session.put("storagelist", list);
        return "success";
    }

    public String searchStorageNoList() {      //查询未确认收货的 比上面的加了state=no
        Storage condition = new Storage();
        if (goodsName != null && !goodsName.equals("")) {
            String[] strs = goodsName.split("\\|");
            Integer id = Integer.parseInt(strs[1]);
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = goodsBiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        if (producerName != null && !producerName.equals("")) {
            Producer producer = producerBiz.getProducer(producerName).get(0);
            condition.setProducer(producer);
        }
        if (storagePlace != null && !storagePlace.equals("")) {
            Place place = placeBiz.getPlace(storagePlace).get(0);
            condition.setPlace(place);
        }
        if (category != null && !category.equals("")) {
            condition.setCategory(category);
        }
        condition.setOver(0);
        List list = storageBiz.getStorageList(condition);
        session.put("storagelistcheck", list);
        return "success";
    }

    public String searchStorageOkList() {      //查询未确认收货的 比上面的加了state=ok
        Storage condition = new Storage();
        if (goodsName != null && !goodsName.equals("")) {
            String[] strs = goodsName.split("\\|");
            Integer id = Integer.parseInt(strs[1]);
            Goods g = new Goods();
            g.setGoodsId(id);
            Goods goods = goodsBiz.getGoodsList(g).get(0);
            condition.setGoods(goods);
        }
        if (producerName != null && !producerName.equals("")) {
            Producer producer = producerBiz.getProducer(producerName).get(0);
            condition.setProducer(producer);
        }
        if (storagePlace != null && !storagePlace.equals("")) {
            Place place = placeBiz.getPlace(storagePlace).get(0);
            condition.setPlace(place);
        }
        if (category != null && !category.equals("")) {   //加不下 先没有
            condition.setCategory(category);
        }
        condition.setState("ok");
        List list = storageBiz.getStorageList(condition);
        session.put("storagelistok", list);
        return "success";
    }

    public String checkStorage() {               //得到所需入库的单子
        List<Storage> storage = storageBiz.getCheckStorage();
        session.put("storagelistcheck", storage);
        return "storageCheck";
    }

    public String storageOk() {               //确认入库
        Storage condition = new Storage();
        condition.setStorageId(storage.getStorageId());
        List list = storageBiz.getStorageList(condition);
        Storage storage2 = (Storage) list.get(0);
  /*      int overId = 0; //默认没有完结
        int expectedNumber = 0;*/
        storage2.setState("ok");
        if (storage.getStorageDate() != null && !storage.getStorageDate().equals(""))                      //实际入库时间
            storage2.setStorageDate(storage.getStorageDate());
        if (storage.getStorageNumber() != null && !storage.getStorageNumber().equals("")) {             //实收数量
            if (storageNumber != null)
                storage2.setStorageNumber(storage.getStorageNumber() + storageNumber);
            else
                storage2.setStorageNumber(storage.getStorageNumber());
        }
        if (storage.getRemark() != null && !storage.getRemark().equals(""))          //备注
            storage2.setRemark(storage.getRemark());
        if (storage.getOver() != null)   //确认完结没完结 多少可以在前端判断下
            storage2.setOver(storage.getOver());
        if (session.get("name") != null) {
            storage2.setCheckuser(session.get("name").toString()); //得到入库确认人
        }
     /*   if (storage.getExpectedNumber() != null)
            expectedNumber = storage.getExpectedNumber();
        if (expectedNumber <= storage.getStorageNumber())
            overId = 1;   //实际数大于等于预期数  完结;*/

        storageBiz.editStorage(storage2);                //更改状态ok1

        return "success";
    }

    /*   public String addStorage() throws Exception {                  //有错误 用不到不改了 增加入库申请
           Storage condition = new Storage();
           Goods g=new Goods();
           g.setGoodsName(goodsName);
           Goods goods = goodsBiz.getGoodsList(g).get(0);
           condition.setGoods(goods);
           Producer p=new Producer();
           p.setProducerName();
           Producer producer = producerBiz.getProducer(storagePlace).get(0);
           condition.setProducer(producer);
           Place place = placeBiz.getPlace(storagePlace).get(0);
           condition.setPlace(place);
           if (storage.getStorageDate() != null)                      //实际入库时间
               condition.setStorageDate(storage.getStorageDate());
           if (storage.getStorageNumber() != null)               //实收数量
               condition.setStorageNumber(storage.getStorageNumber());
           if (storage.getStorageType() != null)          //入库类型
               condition.setStorageType(storage.getStorageType());
           if (storage.getRemark() != null)          //备注
               condition.setRemark(storage.getRemark());
           storageBiz.add(condition);
           return "success";
       }
   */
    public String editStorage() {  //能改吗 不能
        Storage condition = new Storage();
        if (storage.getStorageId() != null && !storage.getStorageId().equals("")) {
            condition.setStorageId(storage.getStorageId());
        }
        if (storage.getStorageDate() != null && !storage.getStorageDate().equals(""))                      //实际入库时间
            condition.setStorageDate(storage.getStorageDate());
        if (storage.getStorageNumber() != null && !storage.getStorageNumber().equals("")) {             //实收数量
            condition.setStorageNumber(storage.getStorageNumber());
        }
        if (storage.getStorageType() != null && !storage.getStorageType().equals(""))          //入库类型
            condition.setStorageType(storage.getStorageType());
        if (storage.getRemark() != null && !storage.getRemark().equals(""))          //备注
            condition.setRemark(storage.getRemark());
        if (storageBiz.editStorage(condition)) {
            session.put("storagelist", condition);
            return "success";
        } else return "input";
    }

    public String listOkStorage() {   //查询已经入库state='ok'的
        Storage s = new Storage();
        s.setState("ok");
        List storage = storageBiz.getStorageList(s);
        session.put("storagelistok", storage);
        return "success";
    }

    public String storageAllot() {   //查询类别是正常调拨的
        Storage s = new Storage();
        s.setCategory("正常调拨");
        s.setState("no");
        List storage = storageBiz.getStorageList(s);
        session.put("storagelistcheck", storage);
        return "success";
    }

    public String storageTransfer() {   //查询类别是正常入库的
        Storage s = new Storage();
        s.setCategory("正常入库");
        s.setState("no");
        List storage = storageBiz.getStorageList(s);
        session.put("storagelistcheck", storage);
        return "success";
    }
}
