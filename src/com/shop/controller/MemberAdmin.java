package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.AccountBean;
import com.shop.service.UserService;

@WebServlet("/MemberAdmin")
public class MemberAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberAdmin() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = (UserService) getServletContext().getAttribute("userService");
		ArrayList<AccountBean> list = (ArrayList<AccountBean>) userService.getAll();
		request.getSession().setAttribute("member", list);
		response.sendRedirect("memberAdmin.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
