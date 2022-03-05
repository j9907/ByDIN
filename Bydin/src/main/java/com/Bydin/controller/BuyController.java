package com.Bydin.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.BuyService;

@Controller
@RequestMapping("buy/")
public class BuyController {
	
	@Autowired private BuyService bs;
	
	// 메인페이지에서 장바구니 이동
	@GetMapping("cart")
	public void cart() {}
	
	@GetMapping("parchase")
	public ModelAndView addcart(@RequestParam HashMap<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		System.out.println(param.get("total"));
//		int row = bs.addcart(param);
		return mav;
	}
}
