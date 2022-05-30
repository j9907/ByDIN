package com.Bydin.Ajax;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Bydin.board.ReplyDTO;
import com.Bydin.item.CtgDTO;
import com.Bydin.item.Purchase_detailDTO;
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

	@Update("merge into purchase p "
			+ "using dual "
			+ "on (p.member_idx = #{member} and p.item_idx = #{itemidx}) "
			+ "when matched then "
			+ "update set totalprice = totalprice + #{totalprice}, totalcount = totalcount + #{count} "
			+ "when not matched then "
			+ "insert (member_idx, totalprice, order_state, totalcount, item_idx) values(#{member} ,#{totalprice},'장바구니',#{count}, #{itemidx})")
	int insertCart(HashMap<String, Object> param);

	@Insert("insert into purchase_detail "
			+ "(order_idx, item_name, item_stock, item_price, item_idx, order_state, "
			+ "member_idx, order_name, order_postcode, order_address, order_detailaddress, order_extraaddress) "
			+ "select purchase.idx,totalgoods.name,totalgoods.stock,totalgoods.price,totalgoods.idx,'장바구니',purchase.member_idx, "
			+ "member.username, member.postcode, member.address, member.detailaddress, member.extraaddress "
			+ "from totalgoods,purchase,member "
			+ "where purchase.member_idx = member.idx "
			+ "and totalgoods.idx = purchase.item_idx  "
			+ "and purchase.idx in (SELECT max(idx) FROM purchase group by idx) "
			+ "and rownum = 1 order by purchase.idx desc")
	int insertDetail(HashMap<String, Object> param);

}


