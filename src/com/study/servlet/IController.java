package com.study.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IController {
	//viewPage를 반환할 것이기 때문에 String으로 반환 시켜주면 된다.
	public abstract String process(HttpServletRequest request, HttpServletResponse response) throws ServletException ;
}

