package com;

import com.hibtest1.entity.Users;
import com.springtest1.biz.UserBiz;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestSpringHibetnate {
	public static void main(String[] args) {
		System.out.println("aa");
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		System.out.println("ab");
		UserBiz userBiz = (UserBiz) context.getBean("userBiz");
		Users condition = new Users();
		condition.setLoginName("zhijie");
		condition.setLoginPwd("1234");
		List list = userBiz.login(condition);
		if (list.size() > 0) {
			System.out.println("ok");
		} else
			System.out.println("no");

	}

}
