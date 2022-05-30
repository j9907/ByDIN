package com.Bydin.item;

public class Purchase_detailDTO {

	private int idx, order_idx, item_idx, member_idx, item_price, order_postcode;
	private String item_name, order_state, order_name, order_req, order_address, order_detailAddress, order_extraAddress;
	
	
	
	
	
	public int getOrder_postcode() {
		return order_postcode;
	}
	public void setOrder_postcode(int order_postcode) {
		this.order_postcode = order_postcode;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_detailAddress() {
		return order_detailAddress;
	}
	public void setOrder_detailAddress(String order_detailAddress) {
		this.order_detailAddress = order_detailAddress;
	}
	public String getOrder_extraAddress() {
		return order_extraAddress;
	}
	public void setOrder_extraAddress(String order_extraAddress) {
		this.order_extraAddress = order_extraAddress;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_req() {
		return order_req;
	}
	public void setOrder_req(String order_req) {
		this.order_req = order_req;
	}
	
	
}
