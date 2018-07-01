package com.shop.model;

import java.io.Serializable;

public class OrderExtBean implements Serializable {
	String id,commodityId,price,buyQuantity;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBuyquantity() {
		return buyQuantity;
	}

	public void setBuyquantity(String buyQuantity) {
		this.buyQuantity = buyQuantity;
	}
}
