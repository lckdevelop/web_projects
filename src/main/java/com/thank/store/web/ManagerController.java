package com.thank.store.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManagerDTO;
import com.thank.store.service.ManagerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@GetMapping("/home")
	public String home(@ModelAttribute ManagerDTO managerDTO, Model model) {
		long no = 1;
		managerDTO = new ManagerDTO();
		
		try {
			managerDTO = managerService.getManagerInfo(no);
			model.addAttribute("managerDTO", managerDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		log.info(managerDTO.getManagerno() + ": MANAGERNO");
		log.info(managerDTO.getCvsno() + ": CVSNO");
		return "manager/home";
	}
	
	@GetMapping("/exam")
	public String exam() {
		return "manager/home";
	}
	
	@RequestMapping(value="/allList/{cvsno}", method=RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<CvsProductDTO> allList(@PathVariable long cvsno) {
		List<CvsProductDTO> allList = new ArrayList<>();
		log.info(cvsno + ": cvsnono닷" );
		try {
			allList = managerService.getAllProductList(cvsno);
			log.info("나 호출");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return allList;
	}
}
