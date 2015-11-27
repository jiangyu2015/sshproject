package com;

import com.hibtest1.entity.Storage;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.StorageBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

/**
 * Created by user on 2015/11/27.
 */
public class StorageManagerAction extends ActionSupport implements RequestAware, SessionAware {
    StorageBiz storageBiz;
    Map<String, Object> request;
    Map<String, Object> session;
    Storage storage;
    String goodsName;   //商品名称
    String storagePlace;  //入库地点
    Integer goodsId;   //商品id

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getPlaceId() {
        return placeId;
    }

    public void setPlaceId(Integer placeId) {
        this.placeId = placeId;
    }

    Integer placeId;  //仓库id

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


    public String listStorage() {
        List storage = storageBiz.getAllStorage();
        Storage storage1 = (Storage) storage.get(0);
        session.put("storagealistall", storage);

        return "storage";
    }

    public String searchStorageList() {
        System.out.println(goodsId);
        Storage condition = new Storage();
        condition.setGoodsId(goodsId);
        // condition.setGoodsName(goodsName);
        List list = storageBiz.getStorageList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            //  session.put("goodslist", list);
            session.put("storagelist", list);
            return "success";
        } else
            return "input";
    }

 /*   public String delStorage() {
        System.out.println(storageName);
        Storage condition = new Storage();
        condition.setStorageName(storageName);
        List<Storage> list = storageBiz.getStorageList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Storage storage = new Storage();
            storage = (Storage) list.get(0);
            boolean e = storageBiz.delGoods(storage);
            if (e) return "success";
            else return "input";
        } else return "input";
    }  */

    public String addStorage() throws Exception {                  //增加入库申请
        System.out.println("addStorage");
        Storage condition = new Storage();
        System.out.println(storage.getGoodsId() + "入库申请商品id我传过来了");
 /*       if (storage.getProducerName() != null && !storage.getProducerName().equals(""))
            condition.setProducerName(storage.getProducerName());
        else {
            ActionContext.getContext().put("yesWords", "请输入商户名称!");
            return "input";
        }
        if (storage.getGoodsName() != null && !storage.getGoodsName().equals(""))
            condition.setGoodsName(storage.getGoodsName());
        else {
            ActionContext.getContext().put("yesWords", "请输入商品名称!");
            return "input";
        }
        if (storage.getStoragePlace() != null && !storage.getStoragePlace().equals(""))
            condition.setStoragePlace(storage.getStoragePlace());
        else {
            ActionContext.getContext().put("yesWords", "请输入仓库名称!");
            return "input";
        }*/
        System.out.println("ok");
        if (storage.getGoodsId() != null)        //商品id
            condition.setGoodsId(storage.getGoodsId());
        if (storage.getPlaceId() != null)                 //仓库id
            condition.setPlaceId(storage.getPlaceId());
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

  /*  public String modifyShow() {                        //更新显示
        Storage condition = new Storage();
        condition.setStorageName(storageName);
        List list = storageBiz.getStorageList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Storage storage = new Storage();
            storage = (Storage) list.get(0);
            session.put("storage", storage);
            return "success";
        } else return "input";
    } */

    public String editStorage() {
        Storage condition = new Storage();
        if (storage.getStorageId() != null && !storage.getStorageId().equals("")) {
            condition.setStorageId(storage.getStorageId());
        }
        if (storage.getGoodsId() != null && !storage.getGoodsId().equals(""))        //商品id
            condition.setGoodsId(storage.getGoodsId());
        if (storage.getPlaceId() != null && !storage.getPlaceId().equals(""))                 //仓库id
            condition.setPlaceId(storage.getPlaceId());
        if (storage.getStorageDate() != null && !storage.getStorageDate().equals(""))                      //实际入库时间
            condition.setStorageDate(storage.getStorageDate());
        if (storage.getStorageNumber() != null && !storage.getStorageNumber().equals(""))               //实收数量
            condition.setStorageNumber(storage.getStorageNumber());
        if (storage.getStorageType() != null && !storage.getStorageType().equals(""))          //入库类型
            condition.setStorageType(storage.getStorageType());
        if (storage.getRemark() != null && !storage.getRemark().equals(""))          //备注
            condition.setRemark(storage.getRemark());
        if (storageBiz.editStorage(condition)) {
            System.out.println("condition" + condition.getPlaceId());
            System.out.println(condition.getGoodsId());
            session.put("storagelist", condition);
            return "success";
        } else return "input";

    }
}
