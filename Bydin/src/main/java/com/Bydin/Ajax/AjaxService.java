package com.Bydin.Ajax;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.board.ReplyDTO;
import com.Bydin.item.CtgDTO;
import com.Bydin.item.Purchase_detailDTO;
import com.Bydin.item.TotalGoodsDTO;
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

	public List<TotalGoodsDTO> getflt(HashMap<String, Object> param) {
		return dao.getflt(param);
	}

	public int insertCart(HashMap<String, Object> param) {
		int row1 = dao.insertCart(param);
		int row2 = dao.insertDetail(param);
		System.out.println("row2 : " + row2);
		return row1;
	}

//	public int modCart(int idx, HashMap<String, Object> param) {
//		return dao.modCart(idx, param);
//	}

	

}
