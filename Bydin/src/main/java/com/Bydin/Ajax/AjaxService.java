package com.Bydin.Ajax;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.board.ReplyDTO;
import com.Bydin.item.CtgDTO;
import com.Bydin.member.MemberDTO;

@Service
public class AjaxService {

	@Autowired private AjaxDAO dao;
	
	public MemberDTO selectuserid(String userid) {
		return dao.selectuserid(userid);
	}

	public List<ReplyDTO> replylist(int idx) {
		return dao.replylist(idx);
	}

	public List<CtgDTO> getCtg(HashMap<String, Object> param) {
		return dao.getCtg(param);
	}

}
