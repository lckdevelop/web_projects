package com.thank.store.web;



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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thank.store.dto.CusSearchDTO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.MemberDTO;
import com.thank.store.dto.PagingDTO;
import com.thank.store.service.CustomerService;
import com.thank.store.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping()
	public String login2() {
		return "/customer/login";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "/customer/signup";
	}
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/25 14:14
	 */
	/*
	 * 수정 : 방지훈
	 * 21/05/27 01:30
	 */
	@GetMapping("/purchaselist")
	public String qrcode(@RequestParam(defaultValue="0") long purchasecount ,@ModelAttribute CustomerDTO customerDTO ,Model model, HttpSession session) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		customerDTO = new CustomerDTO();
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(memberInfo.getNo());
			
			model.addAttribute("customerDTO", customerDTO);
			model.addAttribute("purchasecount",purchasecount);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "/customer/purchaselist";
	}
	
	//작성자 : 방지훈
	//작성일자: 2021/05/23 20:50
	@GetMapping("/home")
	public String home(@ModelAttribute CustomerDTO customerDTO ,Model model, HttpSession session) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		String searchKeyword = "";
		customerDTO = new CustomerDTO();
		long purchasecount = 0;
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(memberInfo.getNo());
			log.info(customerDTO.toString());
			log.info(""+purchasecount);
			model.addAttribute("customerDTO", customerDTO);
			model.addAttribute("purchasecount",purchasecount);
			model.addAttribute("searchKeyword",searchKeyword);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "customer/home";
	}
	
	//작성자 : 방지훈
	//작성일자: 2021/05/25 10:48
	@GetMapping("/searchresult")
	public String selectMaincategory(@RequestParam(defaultValue="1") long pg, @ModelAttribute CusSearchDTO searchDTO, @ModelAttribute CustomerDTO customerDTO,Model model, HttpSession session) {
		log.info(searchDTO.toString());
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		List<String> subCategoryList;
		searchDTO.setPagingDTO(new PagingDTO(pg));
		long purchasecount = 0;
		long recordCount = 0;
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(memberInfo.getNo());
			List<CvstoreDTO> cvstoreList= customerService.searchCvstoreList(searchDTO);
			recordCount = customerService.getTotalRecord(searchDTO);
			searchDTO.setPagingDTO(new PagingDTO(searchDTO.getPagingDTO().getPg(), recordCount));
			subCategoryList = customerService.getSubCategory(searchDTO);
			log.info("검색기능 : "+searchDTO.toString());
			model.addAttribute("customerDTO", customerDTO);				
			model.addAttribute("purchasecount",purchasecount);
			model.addAttribute("cvstoreList", cvstoreList);
			model.addAttribute("searchDTO", searchDTO);
			model.addAttribute("subCategoryList",subCategoryList);
		} catch (Exception e) {
			log.info(e.getMessage());
			log.info("에러");
		}
		return "customer/searchresult";
	}
	
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/23 23:43
	 */
	@PostMapping()
	public String login(@ModelAttribute MemberDTO memberDTO, 
			Model model,
			HttpSession session) {
		log.info(memberDTO.toString());
		try {
//			int memberType = memberService.getAccountType(memberDTO);
//			if(memberType==0) {
//				MemberDTO memberInfo = memberService.getMember(memberDTO);
//				session.setAttribute("memberInfo", memberInfo);
//				return "redirect:./customer/home";
//			}
//			else {
//				model.addAttribute("msg","아이디나 비밀번호가 틀립니다.");
//				model.addAttribute("url", "./customer");
//				return "result";
//			}
			MemberDTO memberInfo = memberService.getMember(memberDTO);
			if(memberService.getAccountType(memberDTO)==0) {
				session.setAttribute("memberInfo", memberInfo);
				return "redirect:./customer/home";
			}
			else {
				model.addAttribute("msg","아이디나 비밀번호가 틀립니다.");
				model.addAttribute("url", "./customer");
				return "result";
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg",e.getMessage());
			model.addAttribute("url", "./customer");
			return "result";
		}
	}
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/23 23:43
	 */
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		session.invalidate();
		
		ModelAndView mav = new ModelAndView("result");
		mav.addObject("msg", memberInfo.getId() + 
				 "(" + memberInfo.getName() + ")님이 로그아웃 하였습니다.");
		mav.addObject("url", "../");
		return mav;
	}
	
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/24 09:28
	 */
	@PostMapping(value="/signup")
	public String signUp(
			@ModelAttribute MemberDTO memberDTO,
			Model model) {
		try {
			if(memberService.checkMemberExist(memberDTO)==0) {
				memberService.addCustomer(memberDTO);
			}

			return "redirect:./login";
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg",e.getMessage());
			model.addAttribute("url", "./");
			return "result";
		}
	}
	
	/*
	 * 작성자: 방지훈
	 * 작성일자: 2021/05/25 12:00
	 */
	@PostMapping(value="recharge", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CustomerDTO recharge(@ModelAttribute CustomerDTO changeCustomerDTO, @RequestParam long point, HttpSession session, Model model) {
		MemberDTO memberInfo = (MemberDTO)session.getAttribute("memberInfo");
		long purchasecount;
		try {
			changeCustomerDTO =  customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(memberInfo.getNo());
			changeCustomerDTO.setPoint(point);
			long result = customerService.rechargePoint(changeCustomerDTO);
			changeCustomerDTO =  customerService.getCustomerInfo(memberInfo.getNo());
			log.info("포인트충전 결과 : "+result);
		}catch(Exception e) {
			log.info(e.getMessage());
		}
		return changeCustomerDTO;
	}
	
	/*
	 * 작성자: 방지훈
	 * 작성일자: 2021/05/25 20:30
	 */
	@PostMapping(value="changeCategory", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<String> recharge(@ModelAttribute CustomerDTO customerDTO,@ModelAttribute CusSearchDTO changeSearchDTO, HttpSession session, Model model) {
		MemberDTO memberInfo = (MemberDTO)session.getAttribute("memberInfo");
		long purchasecount;
		List<String> subCategoryList = null;
		log.info("카테고리 현황 : "+changeSearchDTO.toString());
		try {
			customerDTO =  customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(memberInfo.getNo());
			subCategoryList = customerService.getSubCategory(changeSearchDTO);
			
			model.addAttribute("searchDTO",changeSearchDTO);
			model.addAttribute("subCategoryList",subCategoryList);
		}catch(Exception e) {
			log.info(e.getMessage());
		}
		return subCategoryList;
	}
}
