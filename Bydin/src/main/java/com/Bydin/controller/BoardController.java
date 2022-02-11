package com.Bydin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.BoardService;
import com.Bydin.board.boardDTO;

@Controller
@RequestMapping("qna/")
public class BoardController {

	@Autowired private BoardService bs;
	
	@GetMapping("board")
	public ModelAndView board() {
		ModelAndView mav = new ModelAndView();
		List<boardDTO> list = bs.selectboard();
		mav.addObject("list",list);
		return mav;
	}
	
	@GetMapping("write")
	public void write() {}
	
	@PostMapping("write")
	public ModelAndView write(boardDTO dto) {
		ModelAndView mav = new ModelAndView();
		int row = bs.insertboard(dto);
		return mav;
	}
}
