package com;

import com.opensymphony.xwork2.ActionSupport;

public class MyAction extends ActionSupport {

	private String name;

	public String execute() throws Exception {
		System.out.print("123");
		return "success";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		System.out.print("123");
		this.name = name;
	}
}
