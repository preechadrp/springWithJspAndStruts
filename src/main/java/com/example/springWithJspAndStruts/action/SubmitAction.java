package com.example.springWithJspAndStruts.action;

import org.apache.struts2.ActionSupport;
import org.apache.struts2.ServletActionContext;

public class SubmitAction extends ActionSupport {

	private static final long serialVersionUID = 4041092288470959950L;

	private String username;
	private String password;

	@Override
	public String execute() {

		var req = ServletActionContext.getRequest();
		System.out.println("param username = " + req.getParameter("username"));
		System.out.println("param password = " + req.getParameter("password"));

		System.out.println("username = " + username);
		System.out.println("password = " + password);
		return SUCCESS;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}