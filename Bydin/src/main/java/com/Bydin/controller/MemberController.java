package com.Bydin.controller;

import java.io.File;
import java.io.IOException;
import java.lang.annotation.Inherited;
import java.util.Scanner;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.Service.MemberService;
import com.Bydin.member.MemberDTO;

@Controller
@RequestMapping("member/")
public class MemberController {

	@Autowired private MemberService ms;
	@Inject BCryptPasswordEncoder pwdencoder;
	
	
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
	
	
}
