package com.Bydin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.ItemService;
import com.Bydin.item.TotalGoodsDTO;

@Controller
public class ItemController {
	
	@Autowired private ItemService is;
	
}
