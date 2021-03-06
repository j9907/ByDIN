package com.Bydin.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.board.BoardPaging;
import com.Bydin.board.ReplyDTO;
import com.Bydin.board.boardDAO;
import com.Bydin.board.boardDTO;



@Service
public class BoardService {

	@Autowired private boardDAO dao;
	

	public ModelAndView selectboard(int page) {
		ModelAndView mav = new ModelAndView("qna/board");
		BoardPaging paging = new BoardPaging();

		int boardCount = dao.selectCount(paging); // 현재 게시판의 게시글 총 개수
		paging.setPage(boardCount, page); // 전체 개수와 현재 페이지를 전달하면
		int first = paging.getFirst(); // 페이징 처리된 첫 글번호와 // 1
		int last = paging.getLast(); // 페이징 처리된 마지막 글번호를 받아온다 // 10
		List<boardDTO> list = dao.selectboard(paging);
		mav.addObject("list", list);

		mav.addObject("nowPage", page); // 현재 보고있는 페이지 번호
		mav.addObject("begin", paging.getBegin()); // 전체 페이지의 범위 시작
		mav.addObject("end", paging.getEnd()); // 전체 페이지의 범위 끝

		mav.addObject("prev", paging.hasPrev());
		mav.addObject("next", paging.hasNext());

		mav.addObject("number",0);
		
		return mav;
	}

	public int insertboard(boardDTO dto) {
		return dao.insertboard(dto); 
	}

	public boardDTO selectone(int idx) {
		return dao.selectone(idx);
	}

	public String checkpass(int idx) {
		return dao.checkpass(idx);
	}

	public int deleteboard(int num) {
		return dao.delboard(num);
	}

	public int insertreply(ReplyDTO dto) {
		int row = dao.insertreply(dto);
		if(row != 0) {
			int rownum = dao.updateanswer(dto.getBoardidx());
		}
		return row;
	}

	public int replycount(int num) {
		return dao.replycount(num);
	}

	public int updateboard(boardDTO dto) {
		return dao.updateboard(dto);
	}
	
private final String uploadPath = "C:\\upload";
	
	public void FileService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}

	public int upload(MultipartFile upload) {
		int cnt = 0;
			String fileName = upload.getOriginalFilename();
			System.out.println(fileName);
			File dest = new File(uploadPath, fileName);
			try {
				upload.transferTo(dest);
				cnt++;
			} catch (IllegalStateException | IOException e) {}
		return cnt;

	}
}
