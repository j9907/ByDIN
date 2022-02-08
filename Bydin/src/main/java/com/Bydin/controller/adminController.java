package com.Bydin.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.AdminService;
import com.Bydin.admin.TotalGoodsDTO;

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
	public ModelAndView addItem(MultipartFile upload, TotalGoodsDTO dto) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView("redirect:/addItem");
		
		if(upload.getOriginalFilename() != "") {
		File dir = new File("C:\\upload");
		if(dir.exists() == false) {
			dir.mkdirs();
		}
		File dest = new File(dir, upload.getOriginalFilename());
		
		upload.transferTo(dest);
			
		}
		// dto.setImage(upload.getOriginalFilename());
		
		int add = as.addItem(dto);
		
		return mav;
		
	}
}
