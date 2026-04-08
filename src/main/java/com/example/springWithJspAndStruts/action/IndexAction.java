package com.example.springWithJspAndStruts.action;

import org.apache.struts2.ActionSupport;

public class IndexAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String message;

	@Override
	public String execute() {
		message = "Hello from Struts + Spring Boot!";
		return SUCCESS;
	}

	public String getMessage() {
		return message;
	}
}
