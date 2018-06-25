package com.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.service.CommodityService;
import com.shop.service.UserService;


@WebServlet("/Commodity")
public class Commodity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Commodity() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String action = req.getParameter("do");
		CommodityService commodityService = (CommodityService) getServletContext().getAttribute("commodityService");
		req.getSession().setAttribute("commodity", commodityService.get());
		
		
		
		resp.sendRedirect("commodityAdmin.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
