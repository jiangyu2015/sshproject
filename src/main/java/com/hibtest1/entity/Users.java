package com.hibtest1.entity;

import java.io.Serializable;

public class Users implements Serializable{
	private Integer id;
	private String loginName;
	private String loginPwd;
/*	private String reLoginPwd;      //注册用到的字段 密码确认
	public String getReLoginPwd() {
		return reLoginPwd;
	}
	public void setReLoginPwd(String reLoginPwd) {
		this.reLoginPwd = reLoginPwd;  
	}*/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

}
