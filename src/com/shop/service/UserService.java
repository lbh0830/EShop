package com.shop.service;

import com.shop.DAO.IAccountDAO;
import com.shop.model.AccountBean;

public class UserService {
	IAccountDAO iAccountDAO;

	public UserService(IAccountDAO userDAO) {
		this.iAccountDAO = userDAO;
	}

	public boolean signup(AccountBean account) {
		boolean isSuccessed = false;
		if (!iAccountDAO.isUserExisted(account)) {
			iAccountDAO.addAccount(account);
			isSuccessed = true;
		}
		return isSuccessed;
	}

	public boolean login(AccountBean account) {
		boolean isSuccessed = false;
		if(!iAccountDAO.getAccount(account).getAccount().equals("")){
			isSuccessed = true;
		}
		return isSuccessed;
	}

}
