package com.shop.service;

import com.shop.DAO.ICommodityDAO;

public class CommodityService {
	ICommodityDAO iCommodityDAO;

	public CommodityService(ICommodityDAO commodityDAO) {
		this.iCommodityDAO = commodityDAO;
	}
}
