package com.proj.spring.mvc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//@WebFilter("Home.jsp")
public class FilterLogin implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest hsr = (HttpServletRequest) request;
		HttpSession s = hsr.getSession();
		if(s.getAttribute("uname")!=null) {
			System.out.println("inside filter");
			chain.doFilter(request, response);
		}
		else {
			response.getWriter().print("Login first23");
			request.getRequestDispatcher("LoginViewNew.jsp");
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}

	@Override
	public void destroy() {}


}
