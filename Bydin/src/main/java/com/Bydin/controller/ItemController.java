package com.Bydin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.ItemService;
import com.Bydin.item.TotalGoodsDTO;

@Controller
@RequestMapping("item/")
public class ItemController {
	
	@Autowired private ItemService is;
	
	@GetMapping("studyroom")
	public ModelAndView studyroom() {
		ModelAndView mav = new ModelAndView();
		List<TotalGoodsDTO> dto1 = is.getStudyroomItem();
		mav.addObject("dto1", dto1);
		return mav;
	}
	
	@GetMapping("bedroom")
	public ModelAndView bedroom() {
		ModelAndView mav = new ModelAndView();
		List<TotalGoodsDTO> dto2 = is.getBedroomItem();
		mav.addObject("dto2", dto2);
		return mav;
	}
	
	@GetMapping("livingroom")
	public ModelAndView livingroom() {
		ModelAndView mav = new ModelAndView();
		List<TotalGoodsDTO> dto3 = is.getLivingroomItem();
		mav.addObject("dto3", dto3);
		return mav;
	}
	
	@GetMapping("kichen")
	public ModelAndView kichen() {
		ModelAndView mav = new ModelAndView();
		List<TotalGoodsDTO> dto4 = is.getKichenItem();
		mav.addObject("dto4", dto4);
		return mav;
	}
	
	@GetMapping("chair")
	public ModelAndView chair() {
		ModelAndView mav = new ModelAndView();
		List<TotalGoodsDTO> dto5 = is.getChairItem();
		mav.addObject("dto5", dto5);
		return mav;
	}
	
	@GetMapping("newitem")
	public ModelAndView newitem() {
		ModelAndView mav = new ModelAndView();
		List<TotalGoodsDTO> newitem = is.getNewItem();
		mav.addObject("newitem", newitem);
		return mav;
	}
	
	@GetMapping("itemview/{num}")
	public ModelAndView itemview(@PathVariable int num) {
		ModelAndView mav = new ModelAndView("item/itemview");
		TotalGoodsDTO item = is.getItem(num);
		mav.addObject("item",item);
		return mav;
	}
}
