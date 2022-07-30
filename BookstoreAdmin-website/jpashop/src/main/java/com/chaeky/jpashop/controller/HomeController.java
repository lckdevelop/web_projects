package com.chaeky.jpashop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j // lombok을 통해 로그 사용하기
public class HomeController {
	@RequestMapping("/")
	public String home() {
		log.info("home controller");
		return "home";
	}
}
