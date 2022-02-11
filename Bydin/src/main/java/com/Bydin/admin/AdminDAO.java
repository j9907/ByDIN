package com.Bydin.admin;

import org.apache.ibatis.annotations.Insert;

public interface AdminDAO {

	@Insert("insert into totalGoods(name, price, image, ctgcode, uploadDate, stock, info) values(#{name}, #{price}, #{image}, #{ctgcode}, #{uploadDate}, #{stock}, #{info})")
	int addItem(TotalGoodsDTO dto);


}
