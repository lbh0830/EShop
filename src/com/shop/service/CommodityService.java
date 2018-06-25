package com.shop.service;

import java.util.ArrayList;
import java.util.List;

import com.shop.DAO.ICommodityDAO;
import com.shop.model.CommodityBean;

public class CommodityService {
	ICommodityDAO iCommodityDAO;

	public CommodityService(ICommodityDAO commodityDAO) {
		this.iCommodityDAO = commodityDAO;
	}
	
	public List<CommodityBean> get() {
		return iCommodityDAO.getCommodity("id", false);
	}	
	
	public void add(CommodityBean commodity) {
		iCommodityDAO.addCommodity(commodity);
		
	}
}
