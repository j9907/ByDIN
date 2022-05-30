package com.Bydin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Ajax.AjaxService;
import com.Bydin.Service.ItemService;
import com.Bydin.Service.MemberService;
import com.Bydin.Service.PurchaseService;
import com.Bydin.board.ReplyDTO;
import com.Bydin.item.CtgDTO;
import com.Bydin.item.Purchase_detailDTO;
import com.Bydin.item.TotalGoodsDTO;
import com.Bydin.member.MemberDTO;

@RestController
public class AjaxController {
	@Autowired private AjaxService as;
	@Autowired private ItemService is;
	@Autowired private PurchaseService ps;
	@Autowired private MemberService ms;
	
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
	
	@GetMapping("cart")
	public int cart(@RequestParam HashMap<String, Object> param) {
		int row = as.insertCart(param);
		return row;
	}
	
//	@GetMapping("purchase/buying/{num}")
//	public ModelAndView buying(@PathVariable("num") int idx, @RequestParam HashMap<String, Object> param) {
//		ModelAndView mav = new ModelAndView();
//		System.out.println("idx: " + idx);
//		System.out.println("dto : "+ param);
//		int row = as.modCart(idx, param);
//		
//		return mav;
//	}
	
	@GetMapping("cartlist")
	public List<HashMap<String, Object>> cartlist(HttpSession session){
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		return ps.getCart(dto.getIdx());
	}
	
	@GetMapping("purchase/del/{num}")
	public void del(@PathVariable int num) {
		int row = ps.del_datailItem(num);
		if(row == 1) {int row2 = ps.deleteItem(num);}
	}

	@GetMapping("member/del_member/{num}")
	public ModelAndView del_member(@PathVariable int num, HttpSession session) {
		ModelAndView mav = new ModelAndView("member/delMember");
		int row = ms.del_member(num);
		session.invalidate();
		return mav;
	}
}
