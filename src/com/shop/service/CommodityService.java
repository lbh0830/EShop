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
		return iCommodityDAO.getCommodity();
	}

	public List<CommodityBean> get(String sorting, boolean isDESC, String cate) {
		return iCommodityDAO.getCommodity(sorting, isDESC, cate);
	}

	public void add(CommodityBean commodity) {
		iCommodityDAO.addCommodity(commodity);

	}

	public void update(CommodityBean commodity, boolean hasImage) {
		iCommodityDAO.updateCommodity(commodity, hasImage);
	}

	public void delete(String id) {
		iCommodityDAO.deleteCommodity(id);
	}
}
