package com.shop.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.AccountBean;
import com.shop.service.UserService;

@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Signup() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super .init(config); 		//沒有這行ServletContect會被遺棄QQ
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountBean account = new AccountBean();
		UserService userService = (UserService) getServletContext().getAttribute("userService");
		account.setAccount(req.getParameter("valUser"));
		account.setAddr(req.getParameter("valAddr"));
		account.setEmail(req.getParameter("valEmail"));
		account.setName(req.getParameter("valName"));
		account.setPassword(req.getParameter("valPwd"));
		account.setTel(req.getParameter("valPhone"));
		String passwordCheck = req.getParameter("valPwdCheck");
		if (passwordCheck.equals(req.getParameter("valPwd"))) {
			if (userService.signup(account)) {
				// 回傳註冊成功畫面
			} else {
				// 回傳註冊失敗畫面(帳號已存在)
			}
		} else {
			// 回傳註冊失敗畫面(密碼確認與密碼不同) ---->建議用Js判斷，此行可去掉
		}
	}

}
