package com;

import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.dto.CommodityDto;
import com.hibtest1.entity.*;

import com.springtest1.biz.*;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

public class JsonAction extends ActionSupport implements ServletRequestAware, SessionAware {
    private static final long serialVersionUID = 1L;

    private HttpServletRequest request;
    Map<String, Object> session;
    private String result;
    private Goods goods;
   /* private Withholding withholding;*/

    public void setGoodsBiz(GoodsBiz goodsBiz) {
        this.goodsBiz = goodsBiz;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

   /* public Withholding getWithholding() {
        return withholding;
    }

    public void setWithholding(Withholding withholding) {
        this.withholding = withholding;
    }*/

    public void setStorageBiz(StorageBiz storageBiz) {
        this.storageBiz = storageBiz;
    }

    GoodsBiz goodsBiz;
    ProducerBiz producerBiz;
    PlaceBiz placeBiz;
    StorageAppBiz storageAppBiz;
    AllotAppBiz allotAppBiz;
    TransferAppBiz transferAppBiz;
    StorageBiz storageBiz;
    SearchBiz searchBiz;
    DeliverBiz deliverBiz;
    WithholdingBiz withholdingBiz;

    public void setWithholdingBiz(WithholdingBiz withholdingBiz) {
        this.withholdingBiz = withholdingBiz;
    }

    public void setDeliverBiz(DeliverBiz deliverBiz) {
        this.deliverBiz = deliverBiz;
    }

    public void setAllotAppBiz(AllotAppBiz allotAppBiz) {
        this.allotAppBiz = allotAppBiz;
    }

    public void setTransferAppBiz(TransferAppBiz transferAppBiz) {
        this.transferAppBiz = transferAppBiz;
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

    public void setSearchBiz(SearchBiz searchBiz) {
        this.searchBiz = searchBiz;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    /**
     * 处理ajax请求
     *
     * @return SUCCESS
     */
    public String excuteAjax() {            //状态为yesok的商品
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
        List<Goods> goodslist = goodsBiz.getGoodsCheck();
        if (goodslist.size() > 0) {
            try {
                JSONObject json = new JSONObject();
                json.put("goodsList", goodslist);
                result = json.toString();//给result赋值，传递给页面
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }

    public String selectAllNoGoods() {            //所有未审核的查询商品
        try {
            Goods g = new Goods();
            g.setState("no");
            List<Goods> goods = goodsBiz.getGoodsList(g);
            if (goods.size() > 0) {
                JSONObject json = new JSONObject();
                json.put("goodsList", goods);
                result = json.toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }


    public String selectAllGoods() {            //所有商品
        try {
            List<Goods> goods = goodsBiz.getAllGoods();
            if (goods.size() > 0) {
                JSONObject json = new JSONObject();
                json.put("goodsList", goods);
                result = json.toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;

    }

    public String checkGoods() {            //检查商品相似
        try {
            String goodsName = request.getParameter("goodsName");  //解码两次
            goodsName = URLDecoder.decode(goodsName, "UTF-8");
            goodsName = URLDecoder.decode(goodsName, "UTF-8");
            List<Goods> goods = goodsBiz.getGoods(goodsName);
            if (goods.size() > 0) {
                JSONObject json = new JSONObject();
                json.put("goodsList", goods);
                result = json.toString();
            } else return ERROR;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String deleteGoods() {            //刪除
        try {
            String id = request.getParameter("goodsId");
            int goodsId = Integer.valueOf(id);

            Goods condition = new Goods();
            condition.setGoodsId(goodsId);
            List<Goods> list = goodsBiz.getGoodsList(condition);

            if (list.size() > 0) {
                Goods goods = list.get(0);
                boolean e = goodsBiz.delGoods(goods);
                if (e) return SUCCESS;
                else return ERROR;
            } else return ERROR;

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String selectProducer() {            //状态为yesok的商户
        List<Producer> producerlist = producerBiz.getProducerCheck();
        if (producerlist.size() > 0) {
            try {
            /*    Producer g = producerlist.get(0);
                System.out.println(g.getProducerId() + "传值JsonAction");*/
                JSONObject json = new JSONObject();
                json.put("producerList", producerlist);
                result = json.toString();//给result赋值，传递给页面
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }


    public String excuteProducerAjax() {    //状态为no的查询未审核
        try {
            Producer p = new Producer();
            p.setState("no");
            List<Producer> producer = producerBiz.getProducerList(p);
            if (producer.size() > 0) {
                JSONObject json = new JSONObject();
                json.put("producerList", producer);
                result = json.toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String selectAllProduecer() {            //所有商户
        try {
            List<Producer> producer = producerBiz.getAllProducer();
            if (producer.size() > 0) {
                JSONObject json = new JSONObject();
                json.put("producerList", producer);
                result = json.toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;

    }


    public String excutePlaceAjax() {
        try {
            List<Place> placeList = placeBiz.getAllPlace();
            JSONObject json = new JSONObject();
            json.put("placeList", placeList);
            result = json.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String getInfo() {
        try {
            if (request.getParameter("placeName") != null && request.getParameter("placeName") != "") {
                String placeName = request.getParameter("placeName");
                placeName = URLDecoder.decode(placeName, "UTF-8");
                placeName = URLDecoder.decode(placeName, "UTF-8");
                Place p = new Place();
                p.setPlaceName(placeName);
                List<Place> placeList = placeBiz.getPlaceList(p);
                Place place = placeList.get(0);
                JSONObject json1 = new JSONObject();
                json1.put("place", place);
                result = json1.toString();
            }
            if (request.getParameter("goodsName") != null && request.getParameter("goodsName") != "") {
                String goodsName = request.getParameter("goodsName");
                goodsName = URLDecoder.decode(goodsName, "UTF-8");
                goodsName = URLDecoder.decode(goodsName, "UTF-8");
                Goods g = new Goods();
                if (goodsName.indexOf("|") != -1) {
                    String[] strs = goodsName.split("\\|");
                    Integer id = Integer.parseInt(strs[1]);
                    g.setGoodsId(id);
                }
                List<Goods> goodsList = goodsBiz.getGoodsList(g);
                Goods goods = goodsList.get(0);
                Date c = goods.getCreationDate();
                Date e = goods.getExpirationDate();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                JSONObject json2 = new JSONObject();
                String creationDate = "";
                String expirationDate = "";
                if (c != null) {
                    creationDate = df.format(c);
                }
                if (e != null) {
                    expirationDate = df.format(e);
                }
                json2.put("goods", goods);
                json2.put("creationDate", creationDate);
                json2.put("expirationDate", expirationDate);
                result = json2.toString();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String excuteCheck() {   //入库申请审核未通过
        String id = request.getParameter("id");
        int storageAppId = Integer.valueOf(id);
        StorageApp condition = new StorageApp();
        condition.setStorageAppId(storageAppId);
        List list = storageAppBiz.getStorageAppList(condition);
        StorageApp storageApp = (StorageApp) list.get(0);
        storageApp.setState("yesno");                               //改申请state
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        storageApp.setAuditTime(date);
        if (session.get("name") != null) {
            storageApp.setCheckuser(session.get("name").toString()); //得到审核人
        }
        storageAppBiz.editStorageApp(storageApp);

        return SUCCESS;
    }

    public String allotCheck() {   //调拨申请审核未通过
        String id = request.getParameter("id");
        int allotAppId = Integer.valueOf(id);
        AllotApp condition = new AllotApp();
        condition.setAllotAppId(allotAppId);
        List list = allotAppBiz.getAllotAppList(condition);
        AllotApp allotApp = (AllotApp) list.get(0);

        allotApp.setState("yesno");                               //改申请state
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        allotApp.setAuditTime(date);
        if (session.get("name") != null) {
            allotApp.setCheckuser(session.get("name").toString()); //得到审核人
        }
        allotAppBiz.editAllotApp(allotApp);
        return SUCCESS;
    }

    public String transferCheck() {   //转库申请审核未通过
        String id = request.getParameter("id");
        int transferAppId = Integer.valueOf(id);
        TransferApp condition = new TransferApp();
        condition.setTransferAppId(transferAppId);
        List list = transferAppBiz.getTransferAppList(condition);
        TransferApp transferApp = (TransferApp) list.get(0);
        transferApp.setState("yesno");                               //改申请state
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        transferApp.setAuditTime(date);
        if (session.get("name") != null) {
            transferApp.setCheckuser(session.get("name").toString()); //得到审核人
        }
        transferAppBiz.editTransferApp(transferApp);
        return SUCCESS;
    }

    public String doWithholding() {
        String id = request.getParameter("id");
        int storageId = Integer.valueOf(id);
        System.out.println(storageId + "流动的明细取到的id");
        Storage condition = new Storage();
        condition.setStorageId(storageId);
        List<Storage> storageList = storageBiz.getStorageList(condition);
        Storage storage = storageList.get(0);
        Integer goodsId = storage.getGoods().getGoodsId();
        String goodsName = storage.getGoods().getGoodsName();
        Integer placeId = storage.getPlace().getPlaceId();
        String placeName = storage.getPlace().getPlaceName();
        String type = storage.getStorageType();
        Integer producerId = storage.getProducer().getProducerId();
        String producerName = storage.getProducer().getProducerName();
        JSONObject json = new JSONObject();
        json.put("goodsId", goodsId);
        json.put("goodsName", goodsName);
        json.put("placeId", placeId);
        json.put("placeName", placeName);
        json.put("producerId", producerId);
        json.put("producerName", producerName);
        json.put("type", type);
        System.out.println(goodsId + goodsName + placeId + placeName + producerName);
        result = json.toString();
        return SUCCESS;
    }

    public String doWithholdingCheck() {      //检查是否可以预提，预提数小于等于预提后可用库存
        String gid = request.getParameter("goodsId");
        int placeId = 0;
        int producerId = 0;
        int goodsId = Integer.valueOf(gid);
        if (request.getParameter("placeId") != null && request.getParameter("placeId") != "") {
            String kid = request.getParameter("placeId");
            placeId = Integer.valueOf(kid);
        }
        if (request.getParameter("placeName") != null && request.getParameter("placeName") != "") {
            String placeName = request.getParameter("placeName");
            Place pl = new Place();
            pl.setPlaceName(placeName);
            Place place = placeBiz.getPlaceList(pl).get(0);
            placeId = place.getPlaceId();
        }

        if (request.getParameter("producerId") != null && request.getParameter("producerId") != "") {
            String pid = request.getParameter("producerId");
            producerId = Integer.valueOf(pid);
        }
        if (request.getParameter("producerName") != null && request.getParameter("producerName") != "") {
            String producerName = request.getParameter("producerName");
            Producer p = new Producer();
            p.setProducerName(producerName);
            Producer producer = producerBiz.getProducerList(p).get(0);
            producerId = producer.getProducerId();
        }

        String type = request.getParameter("type");
        List<CommodityDto> commodityDtoList = searchBiz.searchWithholding(goodsId, producerId, placeId, type);
        System.out.println("搜查成功" + commodityDtoList.size());
        JSONObject json = new JSONObject();
        if (commodityDtoList.size() > 0) {
            CommodityDto commodityDto = commodityDtoList.get(0);
            BigDecimal a = commodityDto.getAvailableInventory(); //预提后可用库存
            int availableInventory = a.intValue();
            json.put("availableInventory", availableInventory);
            result = json.toString();
        }
        Goods g = new Goods();
        g.setGoodsId(goodsId);
        List<Goods> goodsList = goodsBiz.getGoodsList(g);
        g = goodsList.get(0);
        String goodsUnit = g.getUnit();
        System.out.println("后台单位是" + g.getUnit());
        json.put("goodsUnit", goodsUnit);
        result = json.toString();

        return SUCCESS;
    }


    public String doDeliver() {                     //出库 点取预提表
        String id = request.getParameter("id");
        int withholdingId = Integer.valueOf(id);
        System.out.println(withholdingId + "流动的明细取到的预提id");
        Withholding condition = new Withholding();
        condition.setWithholdingId(withholdingId);
        List<Withholding> withholdingList = withholdingBiz.search(condition);
        Withholding withholding = withholdingList.get(0);
        Integer goodsId = withholding.getGoods().getGoodsId();
        String goodsName = withholding.getGoods().getGoodsName();
        Integer placeId = withholding.getPlace().getPlaceId();
        String placeName = withholding.getPlace().getPlaceName();
        String type = withholding.getUseType();

        Integer producerId = withholding.getProducer().getProducerId();
        String producerName = withholding.getProducer().getProducerName();
        JSONObject json = new JSONObject();
        json.put("goodsId", goodsId);
        json.put("goodsName", goodsName);
        json.put("placeId", placeId);
        json.put("placeName", placeName);
        json.put("producerId", producerId);
        json.put("producerName", producerName);
        json.put("type", type);
        System.out.println(goodsId + goodsName + placeId + placeName + producerName);
        result = json.toString();
        return SUCCESS;
    }

    public String doRelease() {
      /*  Date as = new Date(new Date().getTime()-24*60*60*1000);
        SimpleDateFormat matter1 = new SimpleDateFormat("yyyy-MM-dd");
        String yesterday = matter1.format(as);*/
        Date date = new Date();//取时间
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE, -1);//把日期往后增加一天.整数往后推,负数往前移动
        date = calendar.getTime();
        String yt = request.getParameter("id"); //预提id
        int withholdingId = Integer.valueOf(yt);
        Withholding condition = new Withholding();
        condition.setWithholdingId(withholdingId);
        Withholding withholding = withholdingBiz.search(condition).get(0);
        withholding.setDeteline(date);
        withholdingBiz.modifyWithholding(withholding);
         /*   JSONObject json = new JSONObject();
            json.put("difference", difference);
            result = json.toString();*/
        return SUCCESS;


    }

    public String deliverSelect() {  //检测已出库多少，还可以预提多少 改
        String yt = request.getParameter("withholdingNumber"); //预提数
        int withholdingNumber = Integer.valueOf(yt);
     /*   String xh = request.getParameter("sumwithholdingdeliver"); //预提消耗总数
        int sumwithholdingdeliver = Integer.valueOf(xh);
        int difference = withholdingNumber - sumwithholdingdeliver;  //剩余消耗数
        JSONObject json = new JSONObject();
        json.put("difference", difference);
        result = json.toString();*/
        String id = request.getParameter("id");
        int withholdingId = Integer.valueOf(id);
        Withholding condition = new Withholding();
        condition.setWithholdingId(withholdingId);
        List<Withholding> list = withholdingBiz.search(condition);
        if (list.size() > 0) {
            List<Deliver> delivers = deliverBiz.searchWithholdingDeliver(withholdingId);
            int sumDeliver;
            if (delivers.size() > 0) {
                Deliver deliver = delivers.get(0);
                BigDecimal a = deliver.getSumDeliver(); //预提号对应的总的出库数
                sumDeliver = a.intValue();
            } else {
                sumDeliver = 0;
            }
            int difference = withholdingNumber - sumDeliver;  //剩余消耗数
            JSONObject json = new JSONObject();
            json.put("difference", difference);
            result = json.toString();
            return SUCCESS;
        } else return ERROR;

    }

    public String goodsCheck() {
        String id = request.getParameter("id");
        int goodsId = Integer.valueOf(id);
        Goods condition = new Goods();
        condition.setGoodsId(goodsId);
        List list = goodsBiz.getGoodsList(condition);
        if (list.size() > 0) {
            Goods goods = (Goods) list.get(0);
            goods.setState("yesno");                               //改申请state
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            goods.setAuditTime(date);
            if (session.get("name") != null) {
                goods.setCheckuser(session.get("name").toString()); //新增审核人
                System.out.println(session.get("name"));
            }
            goodsBiz.modifyGood(goods);
        }
        return SUCCESS;
    }

    public String goodsCheckOk() {
        String id = request.getParameter("id");
        int goodsId = Integer.valueOf(id);
        System.out.println("JsonActionCheck传值" + goodsId);
        Goods condition = new Goods();
        condition.setGoodsId(goodsId);
        List list = goodsBiz.getGoodsList(condition);
        if (list.size() > 0) {
            System.out.println(list.size());
            Goods goods = (Goods) list.get(0);
            goods.setState("yesok");                               //改申请state
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            goods.setAuditTime(date);
            if (session.get("name") != null)
                goods.setCheckuser(session.get("name").toString()); //新增审核人
            goodsBiz.modifyGood(goods);
        }
        return SUCCESS;
    }

    public String producerCheck() {     //没通过
        String id = request.getParameter("id");
        int producerId = Integer.valueOf(id);
        System.out.println("JsonActionCheck传值" + producerId);
        Producer condition = new Producer();
        condition.setProducerId(producerId);
        List list = producerBiz.getProducerList(condition);
        if (list.size() > 0) {
            System.out.println(list.size());
            Producer producer = (Producer) list.get(0);
            producer.setState("yesno");                               //改申请state
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            producer.setAuditTime(date);
            if (session.get("name") != null) {
                producer.setCheckuser(session.get("name").toString()); //得到审核人
            }
            producerBiz.editProducer(producer);
        }
        return SUCCESS;
    }

    public String producerCheckOk() {
        String id = request.getParameter("id");
        int producerId = Integer.valueOf(id);
        System.out.println("JsonActionCheck传值" + producerId);
        Producer condition = new Producer();
        condition.setProducerId(producerId);
        List list = producerBiz.getProducerList(condition);
        if (list.size() > 0) {
            System.out.println(list.size());
            Producer producer = (Producer) list.get(0);
            producer.setState("yesok");                               //改申请state
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            producer.setAuditTime(date);
            if (session.get("name") != null) {
                producer.setCheckuser(session.get("name").toString()); //得到审核人
            }
            producerBiz.editProducer(producer);
        }
        return SUCCESS;
    }


}
