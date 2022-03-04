package com.Bydin.Ajax;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.Bydin.board.ReplyDTO;
import com.Bydin.item.CtgDTO;
import com.Bydin.item.TotalGoodsDTO;
import com.Bydin.member.MemberDTO;

public interface AjaxDAO {

	@Select("select * from member where userid = #{userid}")
	MemberDTO selectuserid(String userid);

	@Select("select * from reply where boardidx = #{idx}")
	List<ReplyDTO> replylist(int idx);

	@Select("select ctgref,ctgcode2 from ctg where ctgcode1 = #{ctg1} and ctglevel=2")
	List<CtgDTO> getCtg(HashMap<String, Object> param);

	@Select("select * from totalGoods where ctgcode2 = #{ctgcode2}")
	List<TotalGoodsDTO> getflt(HashMap<String, Object> param);



}
