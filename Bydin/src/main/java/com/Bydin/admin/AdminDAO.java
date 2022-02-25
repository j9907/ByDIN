package com.Bydin.admin;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.Bydin.item.CtgDTO;
import com.Bydin.item.TotalGoodsDTO;

public interface AdminDAO {

	@Insert("insert into totalGoods(name, price, image, ctgcode1, ctgcode2, uploadDate, stock, info, infoImg) "
			+ "values(#{name}, #{price}, #{image}, #{ctgcode1}, #{ctgcode2}, #{uploadDate}, #{stock}, #{info}, #{infoImg})")
	int addItem(TotalGoodsDTO dto);

	@Select("select * from ctg")
	List<CtgDTO> getCtg();


}
