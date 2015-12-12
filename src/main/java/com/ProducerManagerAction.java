package com;

import com.hibtest1.entity.Producer;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.ProducerBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

/**
 * Created by user on 2015/11/25.
 */
public class ProducerManagerAction extends ActionSupport implements RequestAware, SessionAware {
    ProducerBiz producerBiz;
    Map<String, Object> request;
    Map<String, Object> session;

    public void setProducerBiz(ProducerBiz producerBiz) {
        this.producerBiz = producerBiz;
    }

    public Map<String, Object> getRequest() {
        return request;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Producer getProducer() {
        return producer;
    }

    public void setProducer(Producer producer) {
        this.producer = producer;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    Producer producer;
    String producerName;

    public String listProducer() {
        List producer = producerBiz.getAllProducer();
        Producer producer1 = (Producer) producer.get(0);
        session.put("producerlistall", producer);
        return "producer";
    }

    public String searchProducerList() {
        System.out.println(producerName);
        Producer condition = new Producer();
        condition.setProducerName(producerName);
        System.out.println("商户查询Manager" + condition.getProducerName());
        List list = producerBiz.getProducerList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
          /*  Producer producer = new Producer();
            producer = (Producer) list.get(0);*/
            session.put("producerlist",list);
            return "success";
        } else
            return "input";
    }
    
    

    public String delProducer() {
        System.out.println(producerName);
        Producer condition = new Producer();
        condition.setProducerName(producerName);
        List<Producer> list = producerBiz.getProducerList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Producer producer = new Producer();
            producer = (Producer) list.get(0);
            boolean e = producerBiz.delProducer(producer);
            if (e) return "success";
            else return "input";
        } else return "input";
    }

    public String addProducer() throws Exception {                  //增加商品
        Producer condition = new Producer();
        System.out.println(producer.getProducerName() + "我传过来了");
        if (producer.getProducerName() != null && !producer.getProducerName().equals(""))
            condition.setProducerName(producer.getProducerName());
        else {
            ActionContext.getContext().put("yesWords", "请输入商户名称!");
            return "input";
        }
        List list = producerBiz.getProducerList(condition);
        if (list.size() > 0) {
            System.out.println("yes");
            ActionContext.getContext().put("noWords", "已有该商户，无法添加!");
            return "input";
        } else {
            System.out.println("ok");
            System.out.println(producer.getProducerName());
            if (producer.getProducerName() != null)        //商户名称
                condition.setProducerName(producer.getProducerName());
            if (producer.getProducerAddress() != null)                      //商户地址
                condition.setProducerAddress(producer.getProducerAddress());
            if (producer.getLinkman() != null)                 //联系人
                condition.setLinkman(producer.getLinkman());
            if (producer.getTelOne() != null)               //联系电话1
                condition.setTelOne(producer.getTelOne());
            if (producer.getTelTwo() != null)          //联系电话2
                condition.setTelTwo(producer.getTelTwo());
            condition.setState("no");
            producerBiz.add(condition);
            return "success";
        }
    }

    public String modifyShow() {                        //更新显示
        Producer condition = new Producer();
        condition.setProducerName(producerName);
        List list = producerBiz.getProducerList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            Producer producer = new Producer();
            producer = (Producer) list.get(0);
            session.put("producer", producer);
            return "success";
        } else return "input";
    }

    public String editProducer() {
        Producer condition = new Producer();
        if (producer.getProducerId() != null && !producer.getProducerId().equals("")) {
            condition.setProducerId(producer.getProducerId());
            System.out.println(producer.getProducerId());
        }
        if (producer.getProducerName() != null && !producer.getProducerName().equals("")) {
            condition.setProducerName(producer.getProducerName());
            System.out.println(producer.getProducerName());
        }
        if (producer.getProducerAddress() != null && !producer.getProducerAddress().equals("")) {
            condition.setProducerAddress(producer.getProducerAddress());
            System.out.println(producer.getProducerAddress());
        }
        if (producer.getLinkman() != null && !producer.getLinkman().equals("")) {
            condition.setLinkman(producer.getLinkman());
            System.out.println(producer.getLinkman());
        }
        if (producer.getTelOne() != null && !producer.getTelOne().equals("")) {
            condition.setTelOne(producer.getTelOne());
        }
        if (producer.getTelTwo() != null && !producer.getTelTwo().equals("")) {
            condition.setTelTwo(producer.getTelTwo());
        }
        if (producer.getState() != null && !producer.getState().equals("")) {
            condition.setState(producer.getState());
        }
        if (producerBiz.editProducer(condition)) {
            System.out.println("condition" + condition.getProducerName());
            System.out.println(condition.getTelTwo());
            session.put("producerlist", condition);
            return "success";
        } else return "input";
    }

 
    public String  checkProducer() {               //得到所需审核的单子
        Producer p = new Producer();
        p.setState("no");
        List<Producer> producer = producerBiz.getProducerList(p);
        if (producer.size() > 0) {
            session.put("producerlistcheck", producer);
        }
        return "producerCheck";
    }

    public String checkProducerSelect(){ //得到查询的信息来审核 与search一样
        System.out.println(producerName);
        Producer condition = new Producer();
        condition.setProducerName(producerName);
        List list = producerBiz.getProducerList(condition);
        System.out.println(list.size());
        if (list.size() > 0) {
            session.put("producerlistcheck", list);
            return "success";
        } else
            return "input";
    }
}
