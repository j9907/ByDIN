package com.Bydin.item;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemDAO {


	@Select("select * from totalGoods where ctgcode1='1-01'")
	List<TotalGoodsDTO> selectStudyroom();

	@Select("select * from totalGoods where ctgcode1='1-02'")
	List<TotalGoodsDTO> selectBedroom();

	@Select("select * from totalGoods where ctgcode1='1-03'")
	List<TotalGoodsDTO> selectLivingroom();

	@Select("select * from totalGoods where ctgcode1='1-04'")
	List<TotalGoodsDTO> selectKichen();

	@Select("select * from totalGoods where ctgcode1='1-05'")
	List<TotalGoodsDTO> selectChair();

	@Select("select * from" + 
			"(select * from totalgoods order by uploaddate desc)" + 
			"where rownum <= 20")
	List<TotalGoodsDTO> getNewItem();

	@Select("select * from totalGoods where idx = #{num}")
	TotalGoodsDTO getItem(int num);

	
}
