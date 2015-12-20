package com;

import com.hibtest1.entity.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.springtest1.biz.UserBiz;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.List;
import java.util.Map;

public class UserManagerAction extends ActionSupport implements RequestAware,SessionAware{
	
	private String loginName;
	private String loginPwd;
	private Users users;
	private String reLoginPwd;
	public String getReLoginPwd() {
		return reLoginPwd;
	}

	public void setReLoginPwd(String reLoginPwd) {
		this.reLoginPwd = reLoginPwd;
	}

	Map<String,Object> request;
	Map<String,Object> session;
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	// ���Ե�get��set����
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

	UserBiz userBiz;

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Users condition=new Users();
		condition.setLoginName(loginName);
		condition.setLoginPwd(loginPwd);		
		List list=userBiz.login(condition);
		if(list.size()>0){
			Users users=(Users)list.get(0);
			String name=users.getName();
			session.put("name", name);
			return "success"; 
		}else{		
			return "error";   
		}	
	}
	
	public String addUser() throws Exception{
	//	String relogin;
//		Users condition=new Users();
	//	condition.setReLoginPwd(reLoginPwd);
		
//		System.out.println(users.getReLoginPwd());
		userBiz.register(users);
		System.out.println("前端註冊名字為"+users.getLoginName());
		return "success";
		
		
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
		
	}

	@Override
	public void setRequest(Map<String, Object>  request){
		// TODO Auto-generated method stub
		this.request=request;
		
		
	}
}
