package com.Bydin.item;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemDAO {


	@Select("select * from totalGoods where ctgcode1='1-01' order by idx desc")
	List<TotalGoodsDTO> selectStudyroom();

	@Select("select * from totalGoods where ctgcode1='1-02' order by idx desc")
	List<TotalGoodsDTO> selectBedroom();

	@Select("select * from totalGoods where ctgcode1='1-03' order by idx desc")
	List<TotalGoodsDTO> selectLivingroom();

	@Select("select * from totalGoods where ctgcode1='1-04' order by idx desc")
	List<TotalGoodsDTO> selectKichen();

	@Select("select * from totalGoods where ctgcode1='1-05' order by idx desc")
	List<TotalGoodsDTO> selectChair();

	@Select("select * from" + 
			"(select * from totalgoods order by uploaddate desc)" + 
			"where rownum <= 20")
	List<TotalGoodsDTO> getNewItem();

	@Select("select * from totalGoods where idx = #{num}")
	TotalGoodsDTO getItem(int num);

	@Delete("delete from totalGoods where idx = #{num}")
	int deleteItem(int num);

	
}
