package com.Bydin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.BoardService;
import com.Bydin.board.ReplyDTO;
import com.Bydin.board.boardDTO;

@Controller
@RequestMapping("qna/")
public class BoardController {

	@Autowired private BoardService bs;
	
	@GetMapping("board")
	public ModelAndView boardList() {
			return boardList(1);				
	}

	@GetMapping("{page}")
	public ModelAndView boardList(@PathVariable int page) {
			return bs.selectboard(page);			
	}
	
//	@GetMapping("board")
//	public ModelAndView board() {
//		ModelAndView mav = new ModelAndView();
//		List<boardDTO> list = bs.selectboard();
//		mav.addObject("list",list);
//		return mav;
//	}
	
	@GetMapping("write")
	public void write() {}
	
	@PostMapping("write")
	public ModelAndView write(boardDTO dto,MultipartRequest upload) {
		ModelAndView mav = new ModelAndView();
		MultipartFile file = upload.getFile("file");
		int cnt = bs.upload(file);	
		dto.setImg(file.getOriginalFilename());
		int row = bs.insertboard(dto);
		mav.setViewName(row != 0 ? "redirect:/qna/board" : "qna/write");
		return mav;
	}
	
	@GetMapping("read/{num}")
	public ModelAndView read(@PathVariable int num) {
		ModelAndView mav = new ModelAndView("qna/read");
		boardDTO list = bs.selectone(num);
		int row = bs.replycount(num);
		mav.addObject("list", list);
		mav.addObject("row", row);
		return mav;
	}
	
	@GetMapping("confirm/{num}")
	public ModelAndView confirm(@PathVariable int num) {
		ModelAndView mav = new ModelAndView("qna/confirm");
		return mav;
	}
	
	@PostMapping("confirm/{num}")
	public ModelAndView confirm(@PathVariable int num,String password) {
		ModelAndView mav = new ModelAndView();
		String check = bs.checkpass(num);
		String msg = "비밀번호가 다릅니다";
		if(password.equals(check)) {
			mav.setViewName("redirect:/qna/read/" + num);
		}
		if(!password.equals(check)){
			mav.setViewName("qna/confirm");
			mav.addObject("msg",msg);
		}
		return mav;
	}
	
	@RequestMapping(value = "del/{num}", method = RequestMethod.GET)
	public String del(@PathVariable int num) {
		int row = bs.deleteboard(num);
		return "redirect:/qna/board";
	}
	
	@PostMapping("reply/{num}")
	public ModelAndView reply(@PathVariable int num,ReplyDTO dto) {
		ModelAndView mav = new ModelAndView();
		dto.setBoardidx(num);
		int row = bs.insertreply(dto);
		if(row != 0) {
			mav.setViewName("redirect:/qna/read/" + num);
		}
		return mav;
	}
	
	@GetMapping("modify/{num}")
	public ModelAndView modify(@PathVariable int num) {
		ModelAndView mav = new ModelAndView("qna/modify");
		boardDTO list = bs.selectone(num);
		mav.addObject("list", list);
		return mav;
	} 
	
	@PostMapping("modify/{num}")
	public ModelAndView modify(@PathVariable int num, boardDTO dto) {
		ModelAndView mav = new ModelAndView();
		dto.setIdx(num);
		int row = bs.updateboard(dto);
		if(row != 0) {
			mav.setViewName("redirect:/qna/read/" + num);
		}
		return mav;
	}
	
}
