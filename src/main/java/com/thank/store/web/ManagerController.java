package com.thank.store.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManagerDTO;
import com.thank.store.dto.MemberDTO;
import com.thank.store.dto.ProfitDTO;
import com.thank.store.service.ManagerService;
import com.thank.store.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/exe")
	public String exex(@ModelAttribute ManagerDTO managerDTO,
      				   @ModelAttribute ManSearchDTO searchDTO,
				       @RequestParam(defaultValue="1") long pg,
				       HttpSession session,
				       Model model) {
		ManagerDTO managerInfo = (ManagerDTO)session.getAttribute("managerInfo");
		long managerNo = managerInfo.getManagerno(); // 세션 매니저번호
		long cvsNo = managerInfo.getCvsno(); // 세션 매니저지점번호
		managerDTO = new ManagerDTO();
		
		try {
			managerDTO = managerService.getManagerInfo(managerNo);
			model.addAttribute("managerDTO", managerDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		searchDTO.setPagingDTO(new ManPagingDTO(pg));
		searchDTO.setCvstore_no(cvsNo);
		try {
			List<CvsProductDTO> allList = managerService.getAllProductList(searchDTO);
			ManPagingDTO pagingDTO = managerService.getPagingInfo(searchDTO);
			model.addAttribute("allList", allList);
			model.addAttribute("pagingDTO", pagingDTO);
			model.addAttribute("searchDTO", searchDTO);
			model.addAttribute("enrollCheck", searchDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		return "manager/newhome";
	}
	
	/*
	 * 작성자: 이채경
	 * 작성일자: 2021/05/23 
	 */
	@RequestMapping("/home")
	public String home(@ModelAttribute ManagerDTO managerDTO,
      				   @ModelAttribute ManSearchDTO searchDTO,
				       @RequestParam(defaultValue="1") long pg,
				       HttpSession session,
				       Model model) {
		ManagerDTO managerInfo = (ManagerDTO)session.getAttribute("managerInfo");
		long managerNo = managerInfo.getManagerno(); // 세션 매니저번호
		long cvsNo = managerInfo.getCvsno(); // 세션 매니저지점번호
		managerDTO = new ManagerDTO();
		
		try {
			managerDTO = managerService.getManagerInfo(managerNo);
			model.addAttribute("managerDTO", managerDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		searchDTO.setPagingDTO(new ManPagingDTO(pg));
		searchDTO.setCvstore_no(cvsNo);
		try {
			List<CvsProductDTO> allList = managerService.getAllProductList(searchDTO);
			ManPagingDTO pagingDTO = managerService.getPagingInfo(searchDTO);
			model.addAttribute("allList", allList);
			model.addAttribute("pagingDTO", pagingDTO);
			model.addAttribute("searchDTO", searchDTO);
			model.addAttribute("enrollCheck", searchDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		return "manager/home";
	}
	
	/*
	 * 작성자: 이채경
	 * 작성일자: 2021/05/24 
	 */
	@GetMapping("/enrolled")
	public String enrolled(@ModelAttribute ManagerDTO managerDTO, 
		       @RequestParam(defaultValue="1") long pg, 
		       @ModelAttribute ManSearchDTO searchDTO,
		       HttpSession session,
		       Model model) {
		ManagerDTO managerInfo = (ManagerDTO)session.getAttribute("managerInfo");
		long managerNo = managerInfo.getManagerno(); // 세션 매니저번호
		long cvsNo = managerInfo.getCvsno(); // 세션 매니저지점번호
		managerDTO = new ManagerDTO();
		
		try {
			managerDTO = managerService.getManagerInfo(managerNo);
			model.addAttribute("managerDTO", managerDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		searchDTO.setPagingDTO(new ManPagingDTO(pg));
		searchDTO.setCvstore_no(cvsNo);

		try {
			List<CvsProductDTO> enrolledList = managerService.getEnrolledProductList(searchDTO);
			ManPagingDTO pagingDTO = managerService.getEnrolledPagingInfo(searchDTO);
			model.addAttribute("enrolledList", enrolledList);
			model.addAttribute("pagingDTO", pagingDTO);
			model.addAttribute("searchDTO", searchDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		return "manager/enrolledPage";
	}
	
	/*
	 * 작성자: 이채경
	 * 작성일자: 2021/05/24
	 */
	@GetMapping("/enroll")
	public String enrollAvail(@ModelAttribute ManagerDTO managerDTO, 
		       @RequestParam(defaultValue="1") long pg, 
		       @ModelAttribute ManSearchDTO searchDTO,
		       HttpSession session,
		       Model model) {
		ManagerDTO managerInfo = (ManagerDTO)session.getAttribute("managerInfo");
		long managerNo = managerInfo.getManagerno(); // 세션 매니저번호
		long cvsNo = managerInfo.getCvsno(); // 세션 매니저지점번호
		managerDTO = new ManagerDTO();
		
		try {
			managerDTO = managerService.getManagerInfo(managerNo);
			model.addAttribute("managerDTO", managerDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		searchDTO.setPagingDTO(new ManPagingDTO(pg));
		searchDTO.setCvstore_no(cvsNo);
		try {
			List<CvsProductDTO> enrollAvailList = managerService.getEnrolAvaiProductList(searchDTO);
			ManPagingDTO pagingDTO = managerService.getAvailPagingInfo(searchDTO);
			model.addAttribute("enrollAvailList", enrollAvailList);
			model.addAttribute("pagingDTO", pagingDTO);
			model.addAttribute("searchDTO", searchDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		return "manager/enrollPage";
	}
	
	/*
	 * 작성자: 이채경
	 * 작성일자: 2021/05/26
	 */
	@RequestMapping("/enrollAction")
	public String enrollAction(@ModelAttribute ManagerDTO managerDTO,
					   			@ModelAttribute CvsProductDTO cvsProductDTO,
					   			@RequestParam long pg,
					   			@ModelAttribute ManSearchDTO searchDTO,
					   			HttpSession session,
					   			Model model) {
		try {
			int updateEnrollRow = managerService.enrollAction(cvsProductDTO);
			log.info(updateEnrollRow + " : updateEnrollRow");
			
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		model.addAttribute("pg", pg);
		
		return "redirect:./" + cvsProductDTO.getFrom();
	}
	
	/*
	 * 작성자: 이채경
	 * 작성일자: 2021/05/26
	 */
	@RequestMapping("/cancelAction")
	public String cancelAction(@ModelAttribute ManagerDTO managerDTO,
   							   @ModelAttribute CvsProductDTO cvsProductDTO,
   							   @RequestParam long pg,
   							   @ModelAttribute ManSearchDTO searchDTO,
					   	       Model model) {
		try {
			int check = managerService.enrollmentCheck(cvsProductDTO.getNo());
			log.info(check + ": check");
			
			if (check != 2) {
				int updatecancelRow = managerService.cancelAction(cvsProductDTO);
				log.info(updatecancelRow + " : updatecancelRow");
			} else {
				log.info("여기 탔습니다요~");
				model.addAttribute("enrollCheck", "이미 판매 완료 된 상품입니다.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		model.addAttribute("pg", pg);
		
		return "redirect:./" + cvsProductDTO.getFrom();
	}
	
	/*
	 * 작성자: 이채경
	 * 작성일자: 2021/05/29
	 */
	@GetMapping("/profit")
	public String showProfit(@ModelAttribute ManagerDTO managerDTO,
			   				 @ModelAttribute CvsProductDTO cvsProductDTO,
			   				 HttpSession session,
			   				 Model model) {
		
		ManagerDTO managerInfo = (ManagerDTO)session.getAttribute("managerInfo");
		long managerNo = managerInfo.getManagerno();
		managerDTO = new ManagerDTO();
		
		try {
			managerDTO = managerService.getManagerInfo(managerNo);
			model.addAttribute("managerDTO", managerDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		return "/manager/profit";
	}
	
	/*
	 * 작성자: 이채경
	 * 작성일자: 2021/05/29
	 */
	@RequestMapping(value = "/profit/{cvstoreNo}/{searchYear}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getProfitList(@PathVariable long cvstoreNo, @PathVariable String searchYear) {
		Gson gson = new Gson();
		log.info(cvstoreNo + ": cvstoreNo");
		log.info(searchYear + "searchYear");

		List<ProfitDTO> monthList = new ArrayList<>();
		ProfitDTO profitDTO = new ProfitDTO();
		
		profitDTO.setCvstoreno(cvstoreNo);
		profitDTO.setSearchYear(searchYear);
		
		try {
			monthList = managerService.profitPerMonth(profitDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return gson.toJson(monthList);
		
	}
	
	/*
	 * 작성자: 이채경
	 * 작성일자: 2021/05/29
	 */
	@RequestMapping(value = "/category/{cvstoreNo}/{searchYear}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getCategoryList(@PathVariable long cvstoreNo, @PathVariable String searchYear) {
		Gson gson = new Gson();
		log.info(cvstoreNo + ": cvstoreNo");
		log.info(searchYear + "searchYear");

		List<ProfitDTO> categoryList = new ArrayList<>();
		ProfitDTO profitDTO = new ProfitDTO();
		
		profitDTO.setCvstoreno(cvstoreNo);
		profitDTO.setSearchYear(searchYear);
		
		try {
			categoryList = managerService.profitPerCategory(profitDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return gson.toJson(categoryList);
		
	}
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/24 10:50
	 */
	@GetMapping()
	public String login(HttpServletRequest request) {
		HttpSession session=request.getSession();
		System.out.println("지금 매니저의 세션 상태는: "+session.getAttribute("managerInfo"));
		System.out.println(session.getAttribute("managerInfo"));
		if(session.getAttribute("managerInfo")!=null) {
			return "redirect:/manager/home";
		}
		else {
			return "/manager/login";
		}
	}
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/24 10:50
	 */
	@GetMapping("signup")
	public String signup() {
		return "manager/signup";
	}
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/25 10:54
	 * 수정일자: 2021/05/26 23:25
	 * 세션으로 받아온 id/pw로 해당 member의 no 받고, 그 no로 member_no 얻어서 managerDTO의 no 리턴
	 */
	@PostMapping()
	public String login(@ModelAttribute MemberDTO memberDTO, 
			Model model,
			HttpSession session) {
		log.info(memberDTO.toString());
		try {

			MemberDTO memberInfo = memberService.getMember(memberDTO);

			if(memberService.getAccountType(memberDTO)==1) {
				long managerNoFromMember= managerService.getManagerNoFromMember(memberDTO);
				System.out.println("멤버 pk로 구한 manager의 pk: "+managerNoFromMember);
				System.out.println("멤버의 no와 manager의 member_no가 같은 "+managerNoFromMember);
				ManagerDTO managerInfo = managerService.getManagerInfo(managerNoFromMember);
				System.out.println(managerInfo.toString());
				log.info(managerInfo.toString());
				session.setAttribute("managerInfo", managerInfo);

				return "redirect:/manager/home";
			}
			else {
				model.addAttribute("msg","아이디나 비밀번호가 틀립니다.");
				model.addAttribute("url", "./manager");
				return "manager/managerloginfailure";
			}		
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg",e.getMessage());
			model.addAttribute("url", "./manager");
			return "manager/managerloginfailure";
		}
	}
	

	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/24 10:50
	 */
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "logoutpage";
//	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		return "logout";
	}
	
	@GetMapping("/logoutconfirm")
	public String logoutconfirm(HttpSession session) {
		session.invalidate();
		System.out.println("/logoutconfirm 으로 왔음");
		return "redirect:../";
	}
	
	@GetMapping("/logoutcancel")
	public String logoutcancel(HttpSession session) {
		return "redirect:./";
	}
	
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/24 10:50
	 * 작성내용: 회원가입 시 cvstore 테이블의 manager_no 업데이트
	 */
	@PostMapping(value="/signup")
	public String signUp(
			@RequestParam("storecode")String storecode,
			@ModelAttribute MemberDTO memberDTO,
			Model model) {
		try {
			if(memberService.checkMemberExist(memberDTO)==0) {
				memberService.addManager(memberDTO);
				ManagerDTO managerDTO = new ManagerDTO();
				managerDTO.setManagerno(managerService.getManagerNoFromMember(memberDTO));
				managerDTO.setStorecode(storecode);
				managerService.updateStorecode(managerDTO);
				managerService.updateCVstoreFromManager(managerDTO);
			}

			return "redirect:../manager";
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg",e.getMessage());
			model.addAttribute("url", "./");
			return "result";
		}
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		System.out.println("idCheck까지 됐음");
		System.out.println(managerService.managerIdCheck(id));

		return managerService.managerIdCheck(id); 
	}
}
