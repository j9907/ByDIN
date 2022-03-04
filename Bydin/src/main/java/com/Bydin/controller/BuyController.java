package com.Bydin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("buy/")
public class BuyController {

	
	
	@GetMapping("cart/{num}")
	public String cart(@PathVariable int num, HttpSession session) {
		if(session.getAttribute("login") == null) {
			return "redirect:/member/login";
		}
		return "buy/cart";
		
	}
}
