package com.chaeky.jpashop.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.chaeky.jpashop.domain.Address;
import com.chaeky.jpashop.domain.Item;
import com.chaeky.jpashop.domain.Member;
import com.chaeky.jpashop.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {
	//controller는 service와 작용하는거 알쥐~?
	private final MemberService memberService;
	
	// 회원등록 페이지로 gogo
	// get방식 매핑(받는것이 목적)
	@GetMapping(value = "/members/new")
	public String createForm(Model model) {
		model.addAttribute("memberForm", new MemberForm()); //validation유효성 검사를위해 model이빈 껍데기라도 보내주자.
		return "members/createMemberForm";
	}
	
	// 작성된 회원 폼을 등록하기
	//post방식 매핑(등록하는것이 목적)
	@PostMapping(value = "/members/new")
	// validate검사를 한 후 오류가 있으면 그 오류가 bindingresult에 담긴다.
	public String create(@Valid MemberForm form, BindingResult result) {
		// 사용자가 이름을 입력하지 않았을 때(result에 오류가 담겼을  때)
		// redirect를 호출하는것이 아닌 그 페이지 그대로 나둔다.
		if (result.hasErrors()) {
			// result에 담긴 오류를 가져갈수 있다.
			return "members/createMemberForm";
		}
		
		Address address = new Address(form.getCity(), form.getStreet(), form.getZipcode());
		
		Member member = new Member();
		member.setName(form.getName());
		member.setAddress(address);
		
		memberService.join(member);
		
		return "redirect:/";
	}
	
	// 회원목록 조회
	@GetMapping(value = "/members")
	public String list(@PageableDefault Pageable pageable, Model model) {
		Page<Member> members = memberService.findAll(pageable);
		model.addAttribute("members", members);
		
		return "members/memberList";
	}

}