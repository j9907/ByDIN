package com.Bydin.admin;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Bydin.board.BoardPaging;
import com.Bydin.item.CtgDTO;
import com.Bydin.item.PurchaseDTO;
import com.Bydin.item.Purchase_detailDTO;
import com.Bydin.item.TotalGoodsDTO;
import com.Bydin.member.MemberDTO;

public interface AdminDAO {

	@Insert("insert into totalGoods(name, price, image, ctgcode1, ctgcode2, uploadDate, stock, info, infoImg) "
			+ "values(#{name}, #{price}, #{image}, #{ctgcode1}, #{ctgcode2}, #{uploadDate}, #{stock}, #{info}, #{infoImg})")
	int addItem(TotalGoodsDTO dto);

	@Select("select * from ctg")
	List<CtgDTO> getCtg();

	@Select("select * from totalGoods where idx=#{idx}")
	TotalGoodsDTO selectOne(int idx);

	@Update("update totalGoods set name=#{name}, price=#{price}, image=#{image}, ctgcode1=#{ctgcode1}, ctgcode2=#{ctgcode2}, "
			+ "uploadDate=#{uploadDate}, stock=#{stock}, info=#{info}, infoImg=#{infoImg} where idx=#{idx}")
	int modItem(TotalGoodsDTO dto);

	@Select("select ctgref,ctgcode2 from ctg where ctgcode1 = #{ctgcode1} and ctglevel=2")
	List<CtgDTO> selectCtg(String ctgcode1);

	@Select("select count(*) from member")
	int selectCount(BoardPaging paging);

	@Select("select * from (select rownum as st, A.* from (select * from member order by idx desc) A where rownum <= #{last}) "
			+ "where st >= #{first} order by st desc")
	List<MemberDTO> selectMember(BoardPaging paging);

	@Select("select * from member where idx=#{num}")
	MemberDTO selectOneMember(int num);

	@Select("select * from purchase where member_idx=#{num}")
	List<PurchaseDTO> selectMemberPurchase(int num);

	@Select("select * from purchase_detail where member_idx=#{num}")
	List<Purchase_detailDTO> selectDetail(int num);


}
