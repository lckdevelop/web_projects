package net.developia.h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import net.developia.h.model.MemberDTO;
import net.developia.h.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String loginPage() {
		
		return "body/login";
	}
	
	@PostMapping("/login")
	public String loginAction(HttpServletRequest request, @ModelAttribute MemberDTO memberDTO, Model model) {
		HttpSession session = request.getSession();

		try {
			if(memberService.loginCheck(memberDTO) == 1) {
				session.setAttribute("loginOk", true);
				session.setAttribute("member_id", memberDTO.getLoginId());
				session.setAttribute("member_pw", memberDTO.getLoginPassword());
				
				model.addAttribute("member_id", session.getAttribute("member_id"));
				model.addAttribute("member_pw", session.getAttribute("member_pw"));

				model.addAttribute("msg", "로그인 되었습니다.");
				model.addAttribute("url", "home");
				
				return "body/loginRedirect";
				
			} else {
				throw new Exception();
			}

		} catch (Exception e) {
			model.addAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "javascript:history.back();");
		}
		
		return "body/redirect1";
	}
	
	@GetMapping("/logout")
	public String logoutAction(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("url", "home");
		
		return "body/loginRedirect";
	}
	
	@GetMapping("/location")
	public String location() {
		
		return "body/location";
	}
}
