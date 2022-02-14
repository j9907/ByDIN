package com.Bydin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	
}
