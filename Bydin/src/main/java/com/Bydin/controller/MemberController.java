package com.Bydin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Bydin.Service.MemberService;

@Controller
@RequestMapping("member/")
public class MemberController {

	@Autowired private MemberService ms;
	
	@GetMapping("login")
	public void login() {}
	
}
