package com.Bydin.item;

import java.sql.Date;


public class TotalGoodsDTO {

	private int idx, no, price, stock;
	private String name, info, infoImg, ctgcode1, ctgcode2;
	private Date uploadDate;
	private String image;
	
	
	
	public String getInfoImg() {
		return infoImg;
	}
	public void setInfoImg(String infoImg) {
		this.infoImg = infoImg;
	}
	public String getCtgcode1() {
		return ctgcode1;
	}
	public void setCtgcode1(String ctgcode1) {
		this.ctgcode1 = ctgcode1;
	}
	public String getCtgcode2() {
		return ctgcode2;
	}
	public void setCtgcode2(String ctgcode2) {
		this.ctgcode2 = ctgcode2;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	
	

}
