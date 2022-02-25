package com.Bydin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Bydin.Ajax.AjaxService;
import com.Bydin.Service.ItemService;
import com.Bydin.board.ReplyDTO;
import com.Bydin.item.CtgDTO;
import com.Bydin.item.TotalGoodsDTO;
import com.Bydin.member.MemberDTO;

@RestController
public class AjaxController {
	@Autowired private AjaxService as;
	@Autowired private ItemService is;
	
	@GetMapping("checkuserid")
	public int checkuserid(String userid) {
		MemberDTO dto = as.selectuserid(userid);
		return dto != null ? 1 : 0;
	}
	
	@GetMapping("reply/{idx}")
	public List<ReplyDTO> reply(@PathVariable int idx){
		List<ReplyDTO> list = as.replylist(idx);
		return list;
	}

	@GetMapping("item/dto1")
	public List<TotalGoodsDTO> dto1(){
		List<TotalGoodsDTO> list = is.getStudyroomItem();
		return list;
	}
	@GetMapping("item/dto2")
	public List<TotalGoodsDTO> dto2(){
		List<TotalGoodsDTO> list = is.getBedroomItem();
		return list;
	}
	@GetMapping("item/dto3")
	public List<TotalGoodsDTO> dto3(){
		List<TotalGoodsDTO> list = is.getLivingroomItem();
		return list;
	}
	@GetMapping("item/dto4")
	public List<TotalGoodsDTO> dto4(){
		List<TotalGoodsDTO> list = is.getKichenItem();
		return list;
	}
	@GetMapping("item/dto5")
	public List<TotalGoodsDTO> dto5(){
		List<TotalGoodsDTO> list = is.getChairItem();
		return list;
	}
	

	@GetMapping("item/newitems")
	public List<TotalGoodsDTO> newitem(){
		List<TotalGoodsDTO> list = is.getNewItem();
		return list;
	}
	@GetMapping("ctg")
	public List<CtgDTO> ctgdto(@RequestParam HashMap<String, Object> param){
//		System.out.println(param);
		List<CtgDTO> list = as.getCtg(param);
		return list;
	}
	
	@GetMapping("filter")
	public List<TotalGoodsDTO> fltdto(@RequestParam HashMap<String, Object> param){
//		System.out.println(param);
		List<TotalGoodsDTO> list = as.getflt(param);
		return list;
	}
	

}
