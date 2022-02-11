package com.Bydin.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.member.MemberDAO;
import com.Bydin.member.MemberDTO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	
	public int insertuser(MemberDTO member) {
		return dao.insertuser(member);
	}

	public MemberDTO selectuser(String userid) {
		return dao.selectuser(userid);
	}
	
}
