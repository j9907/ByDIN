package com.Bydin.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.AdminService;
import com.Bydin.Service.PurchaseService;
import com.Bydin.item.CtgDTO;
import com.Bydin.item.PurchaseDTO;
import com.Bydin.item.Purchase_detailDTO;
import com.Bydin.item.TotalGoodsDTO;
import com.Bydin.member.MemberDTO;


@Controller
@RequestMapping("admin/")
public class AdminController {
	
	@Autowired private AdminService as;

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public void admin() {}
	
	@GetMapping("addItem")
	public void addItem() {	}
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
		return mav;
		
	}
//	0 = image
//			1 = infoImage
//
//			if(0번이 비었어){
//			0번은 기존이미지 넣고 1번만 이미지 변경}
//			if(1번이 비었어){
//			0번은 이미지 변경 1번은 기존이미지}
//			if(0,1번 다 이미지 있어){
//			둘다 이미지 변경}

	@PostMapping("modItem/{num}")
	public ModelAndView modItem(@PathVariable int num, @RequestParam("file") List<MultipartFile> upload, TotalGoodsDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/item/itemview/" + num);
		int cnt = 0;
		ArrayList<String> filename = new ArrayList<String>();
		ArrayList<String> dtoname = new ArrayList<String>();
		dtoname.add(dto.getImage());
		dtoname.add(dto.getInfoImg());
//		System.out.println("dto:" + dtoname);
//		System.out.println("upload:" + upload);
		
		for(MultipartFile f : upload) {
//			System.out.println("ori" + f.getOriginalFilename());
			filename.add(f.getOriginalFilename());
			cnt = as.upload(f);
		}
//		System.out.println("filename:" + filename);
		dto.setImage(filename.get(0));
		dto.setInfoImg(filename.get(1));
		
		if (filename.get(0).isEmpty()) {
			dto.setImage(dtoname.get(0));
		}
		if(filename.get(1).isEmpty()) {
			dto.setInfoImg(dtoname.get(1));
		}
		
		
		dto.setIdx(num);
		int mod = as.modItem(dto);
		return mav;
	}
	
	@GetMapping("mngAcnt")
	public ModelAndView acntList() {
		return acntList(1);
	}
	
	@GetMapping("mngAcnt/{page}")
	public ModelAndView acntList(@PathVariable int page) {
		return as.selectMember(page);
	}
	
	@GetMapping("memberView/{num}")
	public ModelAndView memberList(@PathVariable int num) {
		
		System.out.println(num);
		ModelAndView mav = new ModelAndView("admin/memberView");
		MemberDTO memberdto = as.selectOneMember(num);
		System.out.println(memberdto);
		List<PurchaseDTO> purchasedto = as.selectMemberPurchase(num);
		System.out.println(purchasedto);
		List<Purchase_detailDTO> detaildto = as.selectDetail(num);
		System.out.println(detaildto);
		
		mav.addObject("memberdto", memberdto);
		mav.addObject("purchasedto", purchasedto);
		mav.addObject("detaildto", detaildto);
		
		return mav;
	}
	
}
