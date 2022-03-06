package com.Bydin.parchase;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface BuyDAO {
	
	
	@Insert("insert into parchase(member_idx,totalprice,order_state,totalcount) values (#{member},#{total},'결제전',#{count})")
	int addcart(HashMap<String, Object> param);
	
	@Insert("insert into parchase_detail(order_idx,item_name,item_stock,item_price,item_idx) select parchase.idx,totalgoods.name,totalgoods.stock,totalgoods.price,totalgoods.idx "
			+ "from totalgoods,parchase where totalgoods.idx = #{idx}")
	int adddetail(HashMap<String, Object> param);

	@Select("select distinct totalgoods.image ,item_name,item_price,totalcount from totalgoods,parchase_detail,parchase where parchase.member_idx = #{idx} and totalgoods.idx = parchase_detail.item_idx")
	List<ParchasedetailDTO> getcart(int idx);

}
