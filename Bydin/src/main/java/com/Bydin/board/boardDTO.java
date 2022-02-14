package com.Bydin.board;

import java.util.Date;

public class boardDTO {
//	IDX	NUMBER	No		1	
//	TITLE	VARCHAR2(100 BYTE)	No		2	
//	WRITER	VARCHAR2(100 BYTE)	No		3	
//	CONTENT	VARCHAR2(2000 BYTE)	No		4	
//	UPLOADDATE	DATE	Yes		5	
//	PASSWORD	VARCHAR2(50 BYTE)	Yes		6	
//	IMG	VARCHAR2(1000 BYTE)	Yes		7	
//	ANWERCHECK	NUMBER	Yes	"0 
//	"	8	
//	DIVISION	VARCHAR2(100 BYTE)	No		9	
//	EMAIL	VARCHAR2(100 BYTE)	Yes		10	
	
	private String title,writer,content,password,img,division,email,uploaddate;
	private int anwercheck,idx;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAnwercheck() {
		return anwercheck;
	}
	public void setAnwercheck(int anwercheck) {
		this.anwercheck = anwercheck;
	}
	
	
}
