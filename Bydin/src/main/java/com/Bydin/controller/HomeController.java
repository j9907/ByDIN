package com.Bydin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.ItemService;
import com.Bydin.item.TotalGoodsDTO;

@Controller
public class HomeController {
	@Autowired private ItemService is;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		List<TotalGoodsDTO> dto1 = is.getStudyroomItem();
		List<TotalGoodsDTO> dto2 = is.getBedroomItem();
		List<TotalGoodsDTO> dto3 = is.getLivingroomItem();
		List<TotalGoodsDTO> dto4 = is.getKichenItem();
		List<TotalGoodsDTO> dto5 = is.getChairItem();
		mav.addObject("dto1", dto1);
		mav.addObject("dto2", dto2);
		mav.addObject("dto3", dto3);
		mav.addObject("dto4", dto4);
		mav.addObject("dto5", dto5);
		return mav;
		}
	
	
}
