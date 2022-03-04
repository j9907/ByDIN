package com.Bydin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.AdminService;
import com.Bydin.item.CtgDTO;
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
	@GetMapping("modItem/{num}")
	public ModelAndView modItem(@PathVariable int num) {
		ModelAndView mav = new ModelAndView("admin/modItem");
		TotalGoodsDTO item = as.selectOne(num);
		mav.addObject("item", item);
		List<CtgDTO> ctg = as.selectCtg(item.getCtgcode1());
		mav.addObject("ctg", ctg);
		return mav;
	}
	@GetMapping("delItem")
	public void delItem() {}
	
	@PostMapping("addItem")
	public ModelAndView addItem(@RequestParam("file") List<MultipartFile> upload, TotalGoodsDTO dto) {
		int cnt = 0;
		ArrayList<String> filename = new ArrayList<String>();
		
		for(MultipartFile f : upload) {
			System.out.println(f.getOriginalFilename());
			filename.add(f.getOriginalFilename());
			cnt = as.upload(f);
		}
		
		dto.setImage(filename.get(0));
		dto.setInfoImg(filename.get(1));
		System.out.println(dto.getCtgcode2());
		System.out.println(dto.getCtgcode1());
		ModelAndView mav = new ModelAndView("redirect:/admin/addItem");
		int add = as.addItem(dto);
		return null;
		
	}
	
	@PostMapping("modItem/{num}")
	public ModelAndView modItem(@PathVariable int num, @RequestParam("file") List<MultipartFile> upload, TotalGoodsDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/item/itemview/" + num);
		int cnt = 0;
		ArrayList<String> filename = new ArrayList<String>();
		
		for(MultipartFile f : upload) {
			System.out.println(f.getOriginalFilename());
			filename.add(f.getOriginalFilename());
			cnt = as.upload(f);
		}
		
		dto.setImage(filename.get(0));
		dto.setInfoImg(filename.get(1));
		System.out.println(dto.getCtgcode2());
		System.out.println(dto.getCtgcode1());
		
		dto.setIdx(num);
		int mod = as.modItem(dto);
		System.out.println(mod);
		return mav;
	}
	
	
}
