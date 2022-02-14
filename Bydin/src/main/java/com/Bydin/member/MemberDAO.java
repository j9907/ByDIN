package com.Bydin.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	@Insert("insert into member(userid,userpw,username,useremail,phoneno,useradd,birth,gender) "
			+ "values (#{userid},#{userpw},#{username},#{useremail},#{phoneno},#{useradd},#{birth},#{gender})")
	public int insertuser(MemberDTO member);

	@Select("select * from member where userid=#{userid}")
	public MemberDTO selectuser(String userid);

}
