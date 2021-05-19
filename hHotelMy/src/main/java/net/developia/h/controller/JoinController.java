package net.developia.h.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import net.developia.h.model.MemberDTO;
import net.developia.h.service.MemberService;

@Slf4j
@Controller
public class JoinController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/join")
	public String joinPage() {
		return "body/join";
	}
	
	@PostMapping("/join")
	public String joinAction(@ModelAttribute MemberDTO memberDTO, Model model) {
		try {
			memberService.insertMember(memberDTO);
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			model.addAttribute("url", "home");
			
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "javascript:history.back();");
		}
		
		return "body/redirect1";
	}
	
	@PostMapping(value="/idcheck", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idDuplicateCheck(@RequestParam String id) {
		log.info(id);
		
		boolean idDuplBool = false;
		String idDuplStr = null;
		
		try {
			idDuplBool = memberService.idDuplicateCheck(id);
			log.info(idDuplBool + "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (idDuplBool == true) {
			idDuplStr = "not_usable";
		} else {
			idDuplStr = "usable";
		}
		
		return idDuplStr;
	}
	
	@PostMapping(value="/emailcheck", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String emDuplicateCheck(@RequestParam String email) {
		log.info(email);
		
		boolean emDuplBool = false;
		String emDuplStr = null;
		
		try {
			emDuplBool = memberService.emDuplicateCheck(email);
			log.info(emDuplBool + "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (emDuplBool == true) {
			emDuplStr = "not_usable";
		} else {
			emDuplStr = "usable";
		}
		
		return emDuplStr;
	}
}
