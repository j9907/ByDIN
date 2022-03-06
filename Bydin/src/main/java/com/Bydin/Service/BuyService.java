package com.Bydin.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.parchase.BuyDAO;
import com.Bydin.parchase.ParchaseDTO;
import com.Bydin.parchase.ParchasedetailDTO;

@Service
public class BuyService {

	@Autowired private BuyDAO bdao;
	
	
	public int addcart(HashMap<String, Object> param) {
		int row = bdao.addcart(param);
		int detail = bdao.adddetail(param);
		return detail;
	}


	public List<ParchasedetailDTO> getcart(int idx) {
		return bdao.getcart(idx);
	}

}
