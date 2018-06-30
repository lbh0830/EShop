package com.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.model.CommodityBean;
import com.shop.service.CommodityService;
import com.shop.service.UserService;

@WebServlet("/Commodity")
public class Commodity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Commodity() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		CommodityService commodityService = (CommodityService) getServletContext().getAttribute("commodityService");
		HttpSession session = req.getSession();
		
		if(req.getParameter("account").equals("admin")) {
			session.setAttribute("commodity", commodityService.get());
			req.getRequestDispatcher("commodityAdmin.jsp").forward(req, resp);
		}
		else if(req.getParameter("account").equals("member")) {
			session.setAttribute("commodity", commodityService.get(req.getParameter("item")));
			req.getRequestDispatcher("item.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


}
