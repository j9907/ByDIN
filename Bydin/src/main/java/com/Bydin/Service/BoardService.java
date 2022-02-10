package com.Bydin.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.board.boardDAO;



@Service
public class BoardService {

	@Autowired private boardDAO dao;
}
