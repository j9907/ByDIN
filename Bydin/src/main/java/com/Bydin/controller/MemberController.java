package com.Bydin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.DAO.MemberDTO;
import com.Bydin.Service.MemberService;

@Controller
@RequestMapping("member/")
public class MemberController {

	@Autowired private MemberService ms;
	
	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public ModelAndView login(MemberDTO member,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = ms.selectuser(member);
		if(dto != null) {session.setAttribute("login", dto);}
		mav.setViewName(dto != null ? "redirect:/" : "login");
		return mav;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("signup")
	public ModelAndView signup() throws IOException{
		ModelAndView mav = new ModelAndView("member/signup");
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
	
	@PostMapping("signup")
	public ModelAndView signup(MemberDTO member) {
		ModelAndView mav = new ModelAndView();
		System.out.println(member.getGender());
		int row = ms.insertuser(member);
		System.out.println(row);
		mav.setViewName(row != 0 ? "member/joinend" : "member/signup");
		return mav;
	}
	
	
}
