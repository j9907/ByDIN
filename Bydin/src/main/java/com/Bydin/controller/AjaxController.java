package com.Bydin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Bydin.Ajax.AjaxService;
import com.Bydin.member.MemberDTO;

@RestController
public class AjaxController {
	@Autowired private AjaxService as;
	
	@GetMapping("checkuserid")
	public int checkuserid(String userid) {
		MemberDTO dto = as.selectuserid(userid);
		return dto != null ? 1 : 0;
	}
	
}
