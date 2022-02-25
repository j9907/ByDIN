package com.Bydin.Ajax;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.Bydin.board.ReplyDTO;
import com.Bydin.item.CtgDTO;
import com.Bydin.member.MemberDTO;

public interface AjaxDAO {

	@Select("select * from member where userid = #{userid}")
	MemberDTO selectuserid(String userid);

	@Select("select * from reply where boardidx = #{idx}")
	List<ReplyDTO> replylist(int idx);

	@Select("select * from ctg")
	List<CtgDTO> getCtg();



}
