package com.Bydin.item;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface PurchaseDAO {

	@Select("select DISTINCT totalgoods.image, purchase_detail.item_name, purchase.totalcount, purchase.order_state,purchase_detail.item_price, purchase.totalprice, purchase.item_idx, purchase.member_idx " + 
			"from totalgoods, purchase_detail, purchase " + 
			"where purchase.member_idx = #{idx} and purchase.item_idx = totalgoods.idx and purchase.item_idx = purchase_detail.item_idx")
	List<HashMap<String, Object>> selectCart(int idx);

	@Delete("delete from purchase_detail where item_idx = #{num}")
	int del_detailItem(int num);

	@Delete("delete from purchase where item_idx = #{num}")
	int deleteItem(int num);

	@Update("update purchase_detail set order_state='구매완료', order_name=#{1.order_name}, order_postcode=#{1.order_postcode}, order_address=#{1.order_address}, order_detailAddress=#{1.order_detailAddress}, order_extraAddress=#{1.order_extraAddress}, order_req=#{1.order_req} where member_idx=#{0}")
	int buying(int idx, Purchase_detailDTO dto);

	@Select("select * from purchase_detail where member_idx=#{idx}")
	List<HashMap<String, Object>> detail(int idx);

	@Select("select * from purchase where member_idx=#{idx}")
	List<HashMap<String, Object>> getPurchase(int idx);

}
