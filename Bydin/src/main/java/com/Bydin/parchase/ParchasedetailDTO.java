package com.Bydin.parchase;

public class ParchasedetailDTO {
	private int idx,orderidx,item_stock,item_price;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getOrderidx() {
		return orderidx;
	}
	public void setOrderidx(int orderidx) {
		this.orderidx = orderidx;
	}
	public int getItem_stock() {
		return item_stock;
	}
	public void setItem_stock(int item_stock) {
		this.item_stock = item_stock;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	private String item_name;
}
