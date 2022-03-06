package com.Bydin.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.BuyService;
import com.Bydin.member.MemberDTO;
import com.Bydin.parchase.ParchaseDTO;
import com.Bydin.parchase.ParchasedetailDTO;

@Controller
@RequestMapping("buy/")
public class BuyController {
	
	@Autowired private BuyService bs;
	
	// 메인페이지에서 장바구니 이동
	@GetMapping("cart")
	public ModelAndView cart(HttpSession session) {
		ModelAndView mav = new ModelAndView("buy/cart");
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		List<ParchasedetailDTO> list = bs.getcart(login.getIdx());
		System.out.println(list);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("parchase")
	@ResponseBody
	public int addcart(@RequestParam HashMap<String, Object> param) {
//		System.out.println(param.get("total").getClass().getName());
//		System.out.println(param.get("member").getClass().getName());		
		int row = bs.addcart(param);
//		System.out.println(row); 
		return row != 0 ? 1 : 0;
	}
}
