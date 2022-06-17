package com.Bydin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.PurchaseService;
import com.Bydin.item.PurchaseDTO;
import com.Bydin.item.Purchase_detailDTO;
import com.Bydin.member.MemberDTO;

@Controller
@RequestMapping("purchase/")
public class PurchaseController {

	@Autowired private PurchaseService ps;
	
	@RequestMapping(value = {"cart", "buy"})
	public ModelAndView cart(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		System.out.println(dto.getIdx());
		List<HashMap<String, Object>> cartdto = ps.getCart(dto.getIdx());
		System.out.println(cartdto);
		mav.addObject("cartdto", cartdto);
		return mav;
	}
	
	@GetMapping("buying/{num}")
	public void buying() {}
	
	@PostMapping("buying/{num}")
	public ModelAndView buying(@PathVariable("num") int idx, Purchase_detailDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/member/mypage");
		
		int row = ps.buying(idx, dto);
		
		return mav;
	}
	
}
