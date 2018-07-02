package com.shop.service;

import com.shop.DAO.IOrderDAO;
import com.shop.model.OrderMainBean;

public class OrderService {
	IOrderDAO iOrderDAO;

	public OrderService(IOrderDAO order) {
		this.iOrderDAO = order;
	}
	
	public void addOrder(OrderMainBean omb) {
		iOrderDAO.addOrderMain(omb);
	}
	
	
}
