package com.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.AccountBean;
import com.shop.service.UserService;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Login() {
        super();
    }

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountBean account = new AccountBean();
		UserService userService = (UserService) getServletContext().getAttribute("userService");
		account.setAccount(req.getParameter("valUser"));
		account.setPassword(req.getParameter("valPwd"));
		if(userService.login(account)) {
			req.getServletContext().setAttribute("login", req.getAttribute("valUser"));
			System.out.println("成功");
		}
		else {
			System.out.println("失敗");
			//回傳失敗畫面(帳密不符)
		}
		req.getRequestDispatcher("/index.html").forward(req,resp);
	}

}
