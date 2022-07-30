package com.chaeky.jpashop.controller;

import lombok.Getter;
import lombok.Setter;
import javax.validation.constraints.NotEmpty;

@Getter @Setter
public class MemberForm {
	@NotEmpty(message = "회원 이름은 필수 입니다")
	private String name; // 이름 유효성 검사
	
	private String city;
	private String street;
	private String zipcode;
}
