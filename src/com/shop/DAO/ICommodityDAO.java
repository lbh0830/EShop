package com.shop.DAO;

import java.util.List;

import com.shop.model.CommodityBean;
public interface ICommodityDAO {
	List<CommodityBean> getCommodity(String sorting, boolean isDESC);
	List<CommodityBean> getCommodity(String sorting, boolean isDESC, String cate);
	void updateCommodity(CommodityBean commodity);
	void addCommodity(CommodityBean commodity);
	void deleteCommodity(List<CommodityBean> list);
}
