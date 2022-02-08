package com.Bydin.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.admin.AdminDAO;
import com.Bydin.admin.TotalGoodsDTO;

@Service
public class AdminService {
	@Autowired private AdminDAO dao;

	public int addItem(TotalGoodsDTO dto) {
		return dao.insertItem(dto);
	}
	
	
}
