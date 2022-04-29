package com.Bydin.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.Bydin.board.boardDTO;

@Repository
public interface MemberDAO {

	@Insert("insert into member(userid,userpw,username,useremail,phoneno,birth,gender,postcode,address,detailAddress,extraAddress) "
			+ "values (#{userid},#{userpw},#{username},#{useremail},#{phoneno},#{birth},#{gender},#{postcode},#{address},#{detailAddress},#{extraAddress})")
	public int insertuser(MemberDTO member);

	@Select("select * from member where userid=#{userid}")
	public MemberDTO selectuser(String userid);

	@Select("select * from member where idx=#{idx}")
	public MemberDTO selectone(int idx);
	
	@Update("update member set userid=#{userid}, userpw=#{userpw}, username=#{username}, useremail=#{useremail}, phoneno=#{phoneno}, birth=#{birth}, gender=#{gender}, "
			+ "postcode=#{postcode}, address=#{address}, detailAddress=#{detailAddress}, extraAddress=#{extraAddress}, where idx=#{idx}")
	public int modInfo(MemberDTO member);


}
