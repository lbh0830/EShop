package com.shop.DAO;

import com.shop.model.OrderMainBean;

public interface IOrderDAO {
	void addOrderMain(OrderMainBean omb);
	void addOrderExt(OrderMainBean omb);
	void updateProcess(OrderMainBean omb);
}
