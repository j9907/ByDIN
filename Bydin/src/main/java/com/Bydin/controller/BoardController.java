package com.Bydin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Bydin.Service.BoardService;

@Controller
@RequestMapping("qna/")
public class BoardController {

	@Autowired private BoardService bs;
	
	@GetMapping("board")
	public void board() {}
}
