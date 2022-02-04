package com.Bydin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.DAO.MemberDTO;
import com.Bydin.Service.MemberService;

@Controller
@RequestMapping("member/")
public class MemberController {

	@Autowired private MemberService ms;
	
	@GetMapping("login")
	public void login() {}
	
	@GetMapping("signup")
	public void signup() {}
	
	@PostMapping("signup")
	public ModelAndView signup(MemberDTO member) {
		ModelAndView mav = new ModelAndView();
		System.out.println(member.getGender());
		int row = ms.insertuser(member);
		System.out.println(row);
		return null;
	}
}
