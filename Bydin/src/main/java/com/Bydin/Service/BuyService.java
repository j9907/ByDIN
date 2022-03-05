package com.Bydin.Service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.parchase.BuyDAO;

@Service
public class BuyService {

	@Autowired private BuyDAO bdao;
	
	
	public int addcart(HashMap<String, Object> param) {
		int row = bdao.addcart(param);
		return 0;
	}

}
