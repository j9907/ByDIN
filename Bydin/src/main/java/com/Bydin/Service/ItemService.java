package com.Bydin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.item.ItemDAO;
import com.Bydin.item.TotalGoodsDTO;

@Service
public class ItemService {

	@Autowired private ItemDAO dao;

	public List<TotalGoodsDTO> getStudyroomItem() {
		return dao.selectStudyroom();
	}

	public List<TotalGoodsDTO> getBedroomItem() {
		return dao.selectBedroom();
	}

	public List<TotalGoodsDTO> getLivingroomItem() {
		return dao.selectLivingroom();
	}
	
	public List<TotalGoodsDTO> getKichenItem() {
		return dao.selectKichen();
	}

	public List<TotalGoodsDTO> getChairItem() {
		return dao.selectChair();
	}
	
	
}
