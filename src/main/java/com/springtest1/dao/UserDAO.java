package com.springtest1.dao;

import com.hibtest1.entity.Users;

import java.util.List;

public interface UserDAO {
	//public boolean  login(String username,String password);  //��¼
//	public boolean validate(String loginName,String loginPwd); //Ϊ���
	public List search(Users condition);
	public void register(Users user);
	

}
