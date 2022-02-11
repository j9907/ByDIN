package com.Bydin.Ajax;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.member.MemberDTO;

@Service
public class AjaxService {

	@Autowired private AjaxDAO dao;
	
	public MemberDTO selectuserid(String userid) {
		return dao.selectuserid(userid);
	}

}
