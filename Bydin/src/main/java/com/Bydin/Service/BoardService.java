package com.Bydin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.board.boardDAO;
import com.Bydin.board.boardDTO;



@Service
public class BoardService {

	@Autowired private boardDAO dao;

	public List<boardDTO> selectboard() {
		return dao.selectboard();
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
}
