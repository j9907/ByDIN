package com.Bydin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/")
public class adminController {

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public void admin() {}
	
	@GetMapping("addItem")
	public void addItem() {	}
	@GetMapping("mngAcnt")
	public void mngAcnt() {	}
	@GetMapping("mngReply")
	public void mngReply() { }
}
