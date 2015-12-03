package com.hibtest1.entity;

import java.io.Serializable;

/**
 * Created by user on 2015/11/25.
 */
public class Producer  implements Serializable {
    private Integer producerId;
    private String  producerName;
    private String producerAddress;
    private String linkman;
    private String telOne;
    private String telTwo;
    private String state;

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getProducerAddress() {
        return producerAddress;
    }

    public void setProducerAddress(String producerAddress) {
        this.producerAddress = producerAddress;
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    public String getTelOne() {
        return telOne;
    }

    public void setTelOne(String telOne) {
        this.telOne = telOne;
    }

    public String getTelTwo() {
        return telTwo;
    }

    public void setTelTwo(String telTwo) {
        this.telTwo = telTwo;
    }

    public Integer getProducerId() {
        return producerId;

    }

    public void setProducerId(Integer producerId) {
        this.producerId = producerId;
    }
}
