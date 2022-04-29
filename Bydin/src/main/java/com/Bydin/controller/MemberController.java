package com.Bydin.controller;

import java.io.File;
import java.io.IOException;
import java.lang.annotation.Inherited;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.MemberService;
import com.Bydin.Service.PurchaseService;
import com.Bydin.member.MemberDTO;

@Controller
@RequestMapping("member/")
public class MemberController {

	@Autowired private MemberService ms;
	@Inject BCryptPasswordEncoder pwdencoder;
	@Autowired private PurchaseService ps;
	
	
	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public ModelAndView login(MemberDTO member,HttpSession session) {
		ModelAndView mav = new ModelAndView("member/login");
		MemberDTO dto = ms.selectuser(member.getUserid());
		if(dto != null && member != null) {
			boolean pwdMatch = pwdencoder.matches(member.getUserpw(),dto.getUserpw());
			System.out.println(pwdMatch);
			session.setAttribute("login", dto != null && pwdMatch == true ? dto : null);
			}
		mav.addObject("msg",session.getAttribute("login") == null ? "아이디 또는 비밀번호가 잘못되었습니다." : "로그인완료");
//		mav.setViewName(session.getAttribute("login") == null && dto == null  ? "redirect:/member/login" : "redirect:/");
		return mav;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("terms")
	public ModelAndView terms() throws IOException{
		ModelAndView mav = new ModelAndView();
		ClassPathResource pri = new ClassPathResource("privacy/privacy.txt");
		ClassPathResource te = new ClassPathResource("privacy/Terms.txt");
		File p_f = pri.getFile();
		File t_f = te.getFile();
		Scanner psc = new Scanner(p_f);
		Scanner tsc = new Scanner(t_f);
		String privacy = "";
		String terms = "";
		
		while(psc.hasNextLine()) {
			String pdata = psc.nextLine();
			privacy += pdata + "\n";
		}
		while(tsc.hasNextLine()) {
			String tdata = tsc.nextLine();
			terms += tdata + "\n";
		}
		psc.close();
		tsc.close();
		mav.addObject("privacy", privacy);
		mav.addObject("terms", terms);
		return mav;
	}
	
	@GetMapping("signup")
	public void signup() {}
	
	@PostMapping("signup")
	public ModelAndView signup(MemberDTO member) {
		ModelAndView mav = new ModelAndView();
		System.out.println(member.getGender());
		member.setUserpw(pwdencoder.encode(member.getUserpw()));
		int row = ms.insertuser(member);
		System.out.println(row);
		mav.setViewName(row != 0 ? "member/joinend" : "member/signup");
		return mav;
	}
	
	
	@GetMapping("mypage")
	public ModelAndView cart(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		System.out.println(dto.getIdx());
		List<HashMap<String, Object>> cartdto = ps.getCart(dto.getIdx());
		System.out.println(cartdto);
		
		List<HashMap<String, Object>> orderdto = ps.getDetail(dto.getIdx());
		mav.addObject("orderdto", orderdto);
		System.out.println("orderdto : " + orderdto);
		
		List<HashMap<String, Object>> purchasedto = ps.getPurchase(dto.getIdx());
		mav.addObject("purchasedto", purchasedto);
		System.out.println("purchasedto : " + purchasedto);
		
		
		mav.addObject("cartdto", cartdto);
		return mav;
	}
	
	@GetMapping("modInfo/{num}")
	public ModelAndView modInfo(@PathVariable int num) {
		ModelAndView mav = new ModelAndView("member/modInfo");
		MemberDTO login = ms.selectone(num);
		mav.addObject("login", login);
		return mav;
	}
	
	@PostMapping("modInfo/{num}")
	public ModelAndView modInfo(@PathVariable int num, MemberDTO member, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		member.setIdx(num);
		member.setUserpw(pwdencoder.encode(member.getUserpw()));
		int row = ms.modInfo(member);
		
		MemberDTO dto = ms.selectuser(member.getUserid());
		session.setAttribute("login", dto);
		
		mav.setViewName(row != 0 ? "redirect:/member/mypage" : "member/modInfo"+num);
		return mav;
	}
	
}
