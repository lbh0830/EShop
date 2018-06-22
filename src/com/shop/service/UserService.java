package com.shop.service;

import com.shop.DAO.IAccountDAO;
import com.shop.model.AccountBean;

public class UserService {
	IAccountDAO iAccountDAO;
	public UserService(IAccountDAO userDAO) {
		this.iAccountDAO = userDAO;
	}
	
	public boolean signup(AccountBean account) {
		boolean success = false;
		if(!iAccountDAO.isUserExisted(account)){
			iAccountDAO.addAccount(account);
			success = true;
		}
		return success;
	}
	
	
}
