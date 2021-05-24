package com.thank.store;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.thank.store.dto.MemberDTO;
import com.thank.store.service.CustomerService;
import com.thank.store.service.MemberService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping()
	public String login() {
		return "redirect:customer/";
	}

	@GetMapping(value="/")
	public String login2() {
		return "customer/login";
	}
	
	@PostMapping(value="signup")
	public String signUp(
			@ModelAttribute MemberDTO memberDTO,
			Model model,
			HttpSession session) {
		log.info(memberDTO.toString());
		try {
			MemberDTO memberInfo = memberService.getMember(memberDTO);
			log.info(memberInfo.toString());
			
			session.setAttribute("memberInfo", memberInfo);
			return "redirect:../home";
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg",e.getMessage());
			model.addAttribute("url", "./");
			return "result";
		}
	}
	
	@PostMapping()
	public String login(
			@ModelAttribute MemberDTO memberDTO,
			Model model,
			HttpSession session) {
		log.info(memberDTO.toString());
		try {
			MemberDTO memberInfo = memberService.getMember(memberDTO);
			log.info(memberInfo.toString());
			
			session.setAttribute("memberInfo", memberInfo);
			return "redirect:../home";
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg",e.getMessage());
			model.addAttribute("url", "./");
			return "result";
		}
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		session.invalidate();
		
		ModelAndView mav = new ModelAndView("result");
		mav.addObject("msg", memberInfo.getName() + 
				 "(" + memberInfo.getId() + ")님이 로그아웃 하였습니다.");
		mav.addObject("url", "./");
		return mav;
	}
	
	
}