package com.Bydin.Ajax;

import org.apache.ibatis.annotations.Select;

import com.Bydin.member.MemberDTO;

public interface AjaxDAO {

	@Select("select * from member where userid = #{userid}")
	MemberDTO selectuserid(String userid);

}
