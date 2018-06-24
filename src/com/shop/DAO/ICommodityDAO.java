package com.shop.DAO;

import com.shop.model.CommodityBean;
public interface ICommodityDAO {
	void getCommodity();
	void updateCommodity(CommodityBean commodity);
	void deleteCommodity(CommodityBean commodity);
	void insertCommodity(CommodityBean commodity);
}
