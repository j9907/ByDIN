package com.Bydin.admin;

import org.apache.ibatis.annotations.Insert;

import com.Bydin.item.TotalGoodsDTO;

public interface AdminDAO {

	@Insert("insert into totalGoods(name, price, image, ctgcode, uploadDate, stock, info) values(#{name}, #{price}, #{image}, #{ctgcode}, #{uploadDate}, #{stock}, #{info})")
	int addItem(TotalGoodsDTO dto);


}
