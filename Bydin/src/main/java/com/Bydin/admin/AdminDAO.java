package com.Bydin.admin;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDAO {

	
	@Insert("insert into totalgoods (name,price,image,ctgcode,uploaddate,stock,info) values (#{name},#{price},#{image},#{ctgcode},#{uploaddate},#{stock},#{info})")
	public int addItem(TotalGoodsDTO dto);
}
