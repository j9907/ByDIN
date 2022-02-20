package com.Bydin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.AdminService;
import com.Bydin.item.TotalGoodsDTO;

@Controller
@RequestMapping("admin/")
public class adminController {
	
	@Autowired private AdminService as;

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public void admin() {}
	
	@GetMapping("addItem")
	public void addItem() {	}
	@GetMapping("mngAcnt")
	public void mngAcnt() {	}
	@GetMapping("mngReply")
	public void mngReply() { }
	
	@PostMapping("addItem")
	public ModelAndView addItem(MultipartRequest upload, TotalGoodsDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/admin/addItem");
		MultipartFile file = upload.getFile("file");
		System.out.println(file);
		int cnt = as.upload(file);	
		dto.setImage(file.getOriginalFilename());		
		int add = as.addItem(dto);
		return mav;
		
	}
	
}
