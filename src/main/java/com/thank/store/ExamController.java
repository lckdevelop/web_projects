package com.thank.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thank.store.dto.ExamDTO;
import com.thank.store.service.ExamService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ExamController {
	@Autowired
	private ExamService service;
	
	@GetMapping("/hello")
	public String hello1(@ModelAttribute ExamDTO examDTO, Model model) {
		try {
			examDTO = service.getExam();
			log.info(examDTO.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("examDTO", examDTO);
		
		return "exam";
	}
	
	@GetMapping("/lala")
	public String index() {
		
		
		return "lala";
	}
	
	@PostMapping("/hello")
	public String hello2(@ModelAttribute ExamDTO examDTO) {
		try {
			examDTO = service.getExam();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//exam
		return "exam";
	}
	
//	@GetMapping("/home")
//	public String home2() {
//		log.info("여기 탐");
//		return "manager/index";
//	}
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 * @작성이유 : map.jsp 테스트 
	 */
	@GetMapping("/map")
	public String map() {
		return "map";
	}
	
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 * @작성이유 : map.jsp 테스트 
	 */
	@RequestMapping("/ajaxProductList")
	public String ajaxProductList() {
		return "map";
	}
}
