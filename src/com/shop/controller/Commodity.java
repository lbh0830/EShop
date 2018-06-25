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
		String action = req.getParameter("do");
		CommodityService commodityService = (CommodityService) getServletContext().getAttribute("commodityService");
		HttpSession session = req.getSession();
		switch (action) {
		case "admin":
			session.setAttribute("commodity", commodityService.get());
			resp.sendRedirect("commodityAdmin.jsp");
			break;
		case "add":
			req.getRequestDispatcher("commodityAdd.jsp").include(req, resp);

			break;
		case "update":

			break;
		case "delete":

			break;
		default:
			break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void add(HttpServletRequest req, HttpServletResponse resp) {
		CommodityBean cb = new CommodityBean();
		String name = req.getParameter("valName");
		String category = req.getParameter("valCategory");
		String  = req.getParameter("valName");
		String name = req.getParameter("valName");
		String name = req.getParameter("valName");
		String name = req.getParameter("valName");
		String name = req.getParameter("valName");
		String name = req.getParameter("valName");
	}
}
