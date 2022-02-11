package com.Bydin.item;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemDAO {


	@Select("select * from totalGoods where ctgcode='1-01'")
	List<TotalGoodsDTO> selectStudyroom();

	@Select("select * from totalGoods where ctgcode='1-02'")
	List<TotalGoodsDTO> selectBedroom();

	@Select("select * from totalGoods where ctgcode='1-03'")
	List<TotalGoodsDTO> selectLivingroom();

	@Select("select * from totalGoods where ctgcode='1-04'")
	List<TotalGoodsDTO> selectKichen();

	@Select("select * from totalGoods where ctgcode='1-05'")
	List<TotalGoodsDTO> selectChair();

	
}
