package com.thank.store.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.PurchaseListDTO;
import com.thank.store.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	
	//작성자 : 방지훈
	//작성일자: 2021/05/23 16:50
	@GetMapping("/home")
	public String home(@ModelAttribute CustomerDTO customerDTO ,Model model) {
		long no = 1;
		customerDTO = new CustomerDTO();
		long purchasecount = 0;
		try {
			customerDTO = customerService.getCustomerInfo(no);
			purchasecount = customerService.getPurchaseCount(no);
			
			model.addAttribute("customerDTO", customerDTO);
			model.addAttribute("purchasecount",purchasecount);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "customer/home";
	}
	
	
}
