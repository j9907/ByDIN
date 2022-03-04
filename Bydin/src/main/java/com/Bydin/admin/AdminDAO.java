package com.Bydin.admin;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Bydin.item.CtgDTO;
import com.Bydin.item.TotalGoodsDTO;

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


}
