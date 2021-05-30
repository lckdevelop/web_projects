package com.thank.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ExamDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManagerDTO;
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
	
}
