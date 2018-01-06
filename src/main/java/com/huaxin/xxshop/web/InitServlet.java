package com.huaxin.xxshop.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

@SuppressWarnings("serial")
public class InitServlet extends HttpServlet {
	@Override
	public void init() throws ServletException {
		ServletContext context = getServletContext();
		context.setAttribute("base", context.getContextPath());
		context.setAttribute("site", "新新网上商城");
	}
}
