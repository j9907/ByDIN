package com.Bydin.DAO;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.Bydin.admin.TotalGoodsDTO;

@Repository
public interface MemberDAO {

	@Insert("insert into member(userid,userpw,username,useremail,phoneno,useradd,birth,gender) "
			+ "values (#{userid},#{userpw},#{username},#{useremail},#{phoneno},#{useradd},#{birth},#{gender})")
	public int insertuser(MemberDTO member);

	@Select("select * from member where userid=#{userid} and userpw=#{userpw}")
	public MemberDTO selectuser(MemberDTO member);

	

	

}
