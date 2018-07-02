package com.shop.DAO;

import java.util.List;

import com.shop.model.AccountBean;
import com.shop.model.OrderMainBean;

public interface IOrderDAO {
	void addOrderMain(OrderMainBean omb);
	void updateProcess(OrderMainBean omb);
	List<OrderMainBean> getOrderMain(AccountBean account);
}
