package com.Bydin.admin;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class TotalGoodsDTO {
	//create table totalGoods(
	//		idx		    number		    default totalGoods_seq.nextval primary key,
	//		no		    number		    not null,
	//		name		varchar2(100)	not null,
	//		price		number		    not null,
	//		image		varchar2(1000)	,
	//		ctgcode		number		    not null,
	//		uploadDate	date		    default sysdate,
	//		stock		number		    ,
	//		info		varchar2(2000)  ,	
	//	);
	
	private int idx, no, price, ctgcode, stock;
	private String name, info;
	private Date uploadDate;
	private MultipartFile image;
	
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
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
	public int getCtgcode() {
		return ctgcode;
	}
	public void setCtgcode(int ctgcode) {
		this.ctgcode = ctgcode;
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
