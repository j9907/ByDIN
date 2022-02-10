package com.Bydin.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bydin.DAO.MemberDAO;
import com.Bydin.DAO.MemberDTO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	
	public int insertuser(MemberDTO member) {
		return dao.insertuser(member);
	}

	public MemberDTO selectuser(MemberDTO member) {
		return dao.selectuser(member);
	}
	
}
