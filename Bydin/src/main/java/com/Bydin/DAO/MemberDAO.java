package com.Bydin.DAO;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	@Insert("insert into member(userid,userpw,username,useremail,phoneno,useradd,birth,gender) "
			+ "values (#{userid},#{userpw},#{username},#{useremail},#{phoneno},#{useradd},#{birth},#{gender})")
	public int insertuser(MemberDTO member);

}
