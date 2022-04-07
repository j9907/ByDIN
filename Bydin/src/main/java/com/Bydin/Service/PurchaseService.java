package com.Bydin.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.item.PurchaseDAO;
import com.Bydin.item.PurchaseDTO;
import com.Bydin.item.Purchase_detailDTO;

@Service
public class PurchaseService {
	@Autowired private PurchaseDAO dao;

	public List<HashMap<String, Object>> getCart(int idx) {
		return dao.selectCart(idx);
	}

	public int deleteItem(int num) {
		return dao.deleteItem(num);
	}

	public int del_datailItem(int num) {
		return dao.del_detailItem(num);
	}

	public int buying(int idx, Purchase_detailDTO dto) {
		return dao.buying(idx, dto);
	}

	public List<HashMap<String, Object>> getDetail(int idx) {
		return dao.detail(idx);
	}

	public List<HashMap<String, Object>> getPurchase(int idx) {
		return dao.getPurchase(idx);
	}

}
