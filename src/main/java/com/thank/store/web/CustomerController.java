package com.thank.store.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import com.thank.store.dto.ChartDTO;
import com.thank.store.dto.CusSearchDTO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.MemberDTO;
import com.thank.store.dto.PagingDTO;
import com.thank.store.dto.ProductListDTO;
import com.thank.store.dto.ProfitDTO;
import com.thank.store.dto.PurchaseListDTO;
import com.thank.store.service.CustomerService;
import com.thank.store.service.MapService;
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
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("지금 세션 상태는: " + session.getAttribute("memberInfo"));
		System.out.println(session.getAttribute("memberInfo"));
		if (session.getAttribute("memberInfo") != null) {
			return "/customer/home";
		} else {
			return "/customer/login";
		}
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		System.out.println("idCheck까지 됐음");
		System.out.println(customerService.customerIdCheck(id));

		return customerService.customerIdCheck(id); 
	}

	@GetMapping("/signup")
	public String signup() {
		return "/customer/signup";
	}

	/*
	 * 작성자: 김수빈 작성일자: 2021/05/25 14:14
	 */
	/*
	 * 수정 : 방지훈 21/05/27 01:30
	 */
	@GetMapping("/purchaselist")
	public String qrcode(@RequestParam(defaultValue = "0") long purchasecount,
			@RequestParam(defaultValue = "1") long pg, @ModelAttribute CusSearchDTO searchDTO,
			@ModelAttribute CustomerDTO customerDTO, Model model, HttpSession session) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		customerDTO = new CustomerDTO();
		List<PurchaseListDTO> purchaseList;
		searchDTO.setPagingDTO(new PagingDTO(pg));
		
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(customerDTO.getCustomerno());
			searchDTO.setCustomer_no(customerDTO.getCustomerno());
			purchaseList = customerService.getPurchaseList(searchDTO);
			searchDTO.setPagingDTO(new PagingDTO(searchDTO.getPagingDTO().getPg(), purchasecount));
			log.info(searchDTO.toString());
			log.info(""+purchasecount);
			log.info(purchaseList.toString());
			model.addAttribute("customerDTO", customerDTO);
			model.addAttribute("purchasecount", purchasecount);
			model.addAttribute("purchaseList", purchaseList);
			model.addAttribute("searchDTO", searchDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "customer/newpurchaselist";
	}

	// 작성자 : 방지훈
	// 작성일자: 2021/05/23 20:50
	@GetMapping("/home")
	public String home(@ModelAttribute CustomerDTO customerDTO, Model model, HttpSession session) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		String searchKeyword = "";
		customerDTO = new CustomerDTO();
		long purchasecount = 0;
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(customerDTO.getCustomerno());
			log.info(customerDTO.toString());
			log.info("" + purchasecount);
			model.addAttribute("customerDTO", customerDTO);
			model.addAttribute("purchasecount", purchasecount);
			model.addAttribute("searchKeyword", searchKeyword);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "customer/newhome";
	}

	// 작성자 : 방지훈
	// 작성일자: 2021/05/25 10:48
	@GetMapping("/searchresult")
	public String selectMaincategory(@RequestParam(defaultValue = "1") long pg, @ModelAttribute CusSearchDTO searchDTO,
			@ModelAttribute CustomerDTO customerDTO, Model model, HttpSession session) {
		log.info(searchDTO.toString());
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		
		double lat = Double.parseDouble((String) session.getAttribute("lat"));
		double lon = Double.parseDouble((String) session.getAttribute("lon"));
		
		List<String> subCategoryList;
		searchDTO.setPagingDTO(new PagingDTO(pg));
		long purchasecount = 0;
		long recordCount = 0;
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(customerDTO.getCustomerno());
			searchDTO.setLat(lat);
			searchDTO.setLon(lon);
			List<CvstoreDTO> cvstoreList = customerService.searchCvstoreList(searchDTO);
			recordCount = customerService.getTotalRecord(searchDTO);
			searchDTO.setPagingDTO(new PagingDTO(searchDTO.getPagingDTO().getPg(), recordCount));
			subCategoryList = customerService.getSubCategory(searchDTO);
			log.info("검색기능 : " + searchDTO.toString());
			log.info("거리 : "+cvstoreList.get(0).getDistance()); 
			model.addAttribute("customerDTO", customerDTO);
			model.addAttribute("purchasecount", purchasecount);
			model.addAttribute("cvstoreList", cvstoreList);
			model.addAttribute("searchDTO", searchDTO);
			model.addAttribute("subCategoryList", subCategoryList);
		} catch (Exception e) {
			log.info(e.getMessage());
			log.info("에러");
		}
		return "customer/newsearchresult";
	}

	/*
	 * 작성자: 김수빈 작성일자: 2021/05/23 23:43
	 */
	@PostMapping()
	public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
		log.info(memberDTO.toString());

		try {
			MemberDTO memberInfo = memberService.getMember(memberDTO);
			if (memberService.getAccountType(memberDTO) == 0) {
				session.setAttribute("memberInfo", memberInfo);
				return "redirect:/customer/home";
			} else {
				model.addAttribute("msg", "아이디나 비밀번호가 틀립니다.");
				model.addAttribute("url", "./customer");
				return "customer/customerloginfailure";
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "./customer");
			return "customer/customerloginfailure";
		}
	}

	/*
	 * 작성자: 김수빈 작성일자: 2021/05/23 23:43
	 */
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
	 * 작성자: 김수빈 작성일자: 2021/05/24 09:28
	 */
	@PostMapping(value = "signup")
	public String signUp(@ModelAttribute MemberDTO memberDTO, Model model) {
		try {
			if (memberService.checkMemberExist(memberDTO) == 0) {
				memberService.addCustomer(memberDTO);
			}

			return "redirect:../customer";
		} catch (Exception e) {
			log.info(e.getMessage());
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "./");
			return "result";
		}
	}

	/*
	 * 작성자: 방지훈 작성일자: 2021/05/25 12:00
	 */
	@PostMapping(value = "recharge", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CustomerDTO recharge(@ModelAttribute CustomerDTO changeCustomerDTO, @RequestParam long point,
			HttpSession session, Model model) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		long purchasecount;
		try {
			changeCustomerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(memberInfo.getNo());
			changeCustomerDTO.setPoint(point);
			long result = customerService.rechargePoint(changeCustomerDTO);
			changeCustomerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			log.info("포인트충전 결과 : " + result);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return changeCustomerDTO;
	}

	/*
	 * 작성자: 방지훈 작성일자: 2021/05/25 20:30
	 */
	@PostMapping(value = "changeCategory", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<String> recharge(@ModelAttribute CustomerDTO customerDTO, @ModelAttribute CusSearchDTO changeSearchDTO,
			HttpSession session, Model model) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		long purchasecount;
		List<String> subCategoryList = null;
		log.info("카테고리 현황 : " + changeSearchDTO.toString());
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(customerDTO.getCustomerno());
			subCategoryList = customerService.getSubCategory(changeSearchDTO);

			model.addAttribute("searchDTO", changeSearchDTO);
			model.addAttribute("subCategoryList", subCategoryList);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return subCategoryList;
	}

	/*
	 * 작성자: 방지훈 작성일자: 2021/05/25 20:30
	 */
	@PostMapping(value = "onecvsproduct", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CvsProductDTO getOneCvsProduct(@RequestParam long no, Model model, HttpSession session) {

		CvsProductDTO cvsProductDTO = new CvsProductDTO();

		try {
			cvsProductDTO = customerService.getOneCvsProduct(no);
			log.info("상품정보 : " + cvsProductDTO.toString());

		} catch (Exception e) {
			log.info(e.getMessage());
			log.info("에러");
		}
		return cvsProductDTO;
	}

	/*
	 * 작성자: 방지훈 작성일자: 2021/05/28 01:00
	 */
	@PostMapping(value = "purchaseproduct", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CustomerDTO purchaseProduct(@RequestParam long no, Model model, HttpSession session) {

		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		CustomerDTO customerDTO = new CustomerDTO();
		CvsProductDTO cvsProductDTO = new CvsProductDTO();

		try {
			cvsProductDTO = customerService.getOneCvsProduct(no);
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			log.info("구매자 정보 : " + customerDTO.toString());
			if (cvsProductDTO.getDiscountPrice() > customerDTO.getPoint()) {
				throw new RuntimeException("잔액부족");
			}
			if (cvsProductDTO.getEnrollment() == 0) {
				throw new RuntimeException("등록 취소된 상품");
			}
			log.info("상품 정보 : " + cvsProductDTO.toString());
			customerDTO.setPurchasePrice(cvsProductDTO.getDiscountPrice());
			customerService.updateCustomerPoint(customerDTO); // 잔액차감
			customerDTO.setCvsproductno(cvsProductDTO.getNo());
			customerService.addPurchaseProduct(customerDTO);// 구매목록에 등록
			customerService.updatePurchaseProduct(cvsProductDTO);// 상품 상태 변경 enrollment = 2
			customerService.updateCvstorePoint(cvsProductDTO);// 판매자 수익금 추가

		} catch (Exception e) {
			log.info(e.getMessage());
			return null;
		}
		return customerDTO;
	}

	/*
	 * 작성자 : 방지훈 작성일자 : 21/05/28 17:30
	 */
	@GetMapping("/transactionhistory")
	public String getTransactionHistory(@RequestParam(defaultValue = "0") long purchasecount,
			@RequestParam(defaultValue = "1") long pg, @ModelAttribute CusSearchDTO searchDTO,
			@ModelAttribute CustomerDTO customerDTO, Model model, HttpSession session) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		customerDTO = new CustomerDTO();
		List<PurchaseListDTO> purchaseList;
		long totalpurchasecount = 0;
		long totalDiscountPrice = 0;
		searchDTO.setPagingDTO(new PagingDTO(pg));
		
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(customerDTO.getCustomerno());
			searchDTO.setCustomer_no(customerDTO.getCustomerno());
			totalDiscountPrice = customerService.getTotalDiscountPrice(customerDTO.getCustomerno());
			totalpurchasecount = customerService.getTotalPurchaseCount(customerDTO.getCustomerno());
			purchaseList = customerService.getTotalPurchaseList(searchDTO);
			searchDTO.setPagingDTO(new PagingDTO(searchDTO.getPagingDTO().getPg(), totalpurchasecount));
			log.info(searchDTO.toString());
			model.addAttribute("customerDTO", customerDTO);
			model.addAttribute("purchasecount", purchasecount);
			model.addAttribute("totalpurchasecount", totalpurchasecount);
			model.addAttribute("totalDiscountPrice", totalDiscountPrice);
			model.addAttribute("purchaseList", purchaseList);
			model.addAttribute("searchDTO", searchDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "customer/newtransactionhistory";
	}

	/*
	 * 작성자: 방지훈
	 * 작성일자: 2021/06/01 12:51
	 */
	@RequestMapping(value = "/brand/{customerNo}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getBrandList(@PathVariable long customerNo) {
		Gson gson = new Gson();
		log.info(customerNo + ": customerNo");

		List<ChartDTO> brandList = new ArrayList<>();
		
		
		try {
			brandList = customerService.purchasePerBrand(customerNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return gson.toJson(brandList);
		
	}
	
	/*
	 * 작성자: 방지훈
	 * 작성일자: 2021/06/01 13:25
	 */
	@RequestMapping(value = "/category/{customerNo}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getCategoryList(@PathVariable long customerNo) {
		Gson gson = new Gson();
		log.info(customerNo + ": customerNo");

		List<ChartDTO> categoryList = new ArrayList<>();
		
		try {
			categoryList = customerService.purchasePerCategory(customerNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return gson.toJson(categoryList);
		
	}
	
	
	/*
	 * 작성자 : 방지훈 작성일자 : 21/05/30 15:30
	 */
	@GetMapping("/endpurchaselist")
	public String getEndPurchaseList(@RequestParam(defaultValue = "0") long purchasecount,
			@RequestParam(defaultValue = "1") long pg, @ModelAttribute CusSearchDTO searchDTO,
			@ModelAttribute CustomerDTO customerDTO, Model model, HttpSession session) {
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
		customerDTO = new CustomerDTO();
		List<PurchaseListDTO> purchaseList;
		long endpurchasecount;
		searchDTO.setPagingDTO(new PagingDTO(pg));
		
		try {
			customerDTO = customerService.getCustomerInfo(memberInfo.getNo());
			purchasecount = customerService.getPurchaseCount(customerDTO.getCustomerno());
			searchDTO.setCustomer_no(customerDTO.getCustomerno());
			endpurchasecount = customerService.getEndPurchaseCount(customerDTO.getCustomerno());
			purchaseList = customerService.getEndPurchaseList(searchDTO);
			searchDTO.setPagingDTO(new PagingDTO(searchDTO.getPagingDTO().getPg(), endpurchasecount));
			log.info(searchDTO.toString());
			model.addAttribute("customerDTO", customerDTO);
			model.addAttribute("purchasecount", purchasecount);
			model.addAttribute("endpurchasecount", endpurchasecount);
			model.addAttribute("purchaseList", purchaseList);
			model.addAttribute("searchDTO", searchDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "customer/newendpurchaselist";
	}
	
	/*
	 * ===========================================map===================================================
	 */
	@Autowired
	private MapService mapService;
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 */
	@RequestMapping("/map")
		public  String map(
				@RequestParam HashMap<String, Double> loc,
				HttpSession session
				) {
		//log.info("lon", loc.get("lon"));
		//log.info("lat", loc.get("lat"));
			return "map";
	}
	/*
	 * @작성자 : 이효범 
	 * @작성일자 : 0524
	 */
	@RequestMapping("/sessionLoc")
	@ResponseBody
	public void sessionLoc(
			@RequestParam Double lat,
			@RequestParam Double lon,
			HttpSession session
			) {
		session.setAttribute("lat", lat);
		session.setAttribute("lon", lon);
	}	
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 */
	@RequestMapping(value="/mapajax", produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap mapajax(
			@RequestParam HashMap<String, Double> loc,
			HttpSession session
			) {
//		@RequestParam Double lat,
//		@RequestParam Double lon,
//		@RequestParam long cvStoreCnt
		session.setAttribute("lat", loc.get("lat"));
		session.setAttribute("lon", loc.get("lon"));
		
//		log.info(loc.get("lat") + ": lat");
//		log.info(lat + ": lat");
//		log.info(loc.get("lon") + ": lon");
//		log.info(lon + ": lon");
		HashMap<String, List<CvstoreDTO>> hash = new HashMap<String, List<CvstoreDTO>>();
		//HashMap<String, Double> hash = new HashMap<String, List<CvstoreDTO>>();
		//ModelAndView mav = new ModelAndView();
		try {
			List<CvstoreDTO> list = mapService.getCvStore(loc);
			System.out.println("list : " + list);
			
			hash.put("list", list);
			//mav.addObject("hash", hash);
			//mav.setViewName("map");
//			model.addAttribute("hash", hash);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hash;
	}
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 */
	@GetMapping(value="/maptotal")
	@ResponseBody
	public ModelAndView maptotal() {
		ModelAndView mav = new ModelAndView();
		try {
			List<CvstoreDTO> list = mapService.getTotalCvStore();
			System.out.println(list);
			mav.addObject("CvstoreDTO", list);
			mav.setViewName("map");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0527
	 */
	@RequestMapping(value="/productList" , produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap productList(
			@RequestParam HashMap<String, String> storecode
			) {
		HashMap<String, List<ProductListDTO>> hash = new HashMap<String, List<ProductListDTO>>();
		
		try {
			List<ProductListDTO> list = mapService.getProductList(storecode);
			System.out.println("list : " + list);
			hash.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return hash;
	}
	
	// 작성자 : 이효범
	// 작성일자: 2021/05/31 12:32
		@GetMapping(value = "/productList2" , produces="application/json;charset=UTF-8")
		@ResponseBody
		public HashMap<String, CvstoreDTO> productList2 (
				@RequestParam HashMap<String, String> storecode
			    ) {
			HashMap<String, CvstoreDTO> hash = new HashMap<String, CvstoreDTO>();
			try {
				CvstoreDTO cvstoreDTO = customerService.searchCvstoreListMap(storecode);
				hash.put("cvstoreDTO", cvstoreDTO);
			} catch (Exception e) {
				log.info(e.getMessage());
				log.info("에러");
			}
			return hash;
		}

}
