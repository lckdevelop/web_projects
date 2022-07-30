package com.thank.store.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.ProductListDTO;
import com.thank.store.service.CustomerService;
import com.thank.store.service.MapService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MapController {
	@Autowired
	private MapService mapService;
	@Autowired
	private CustomerService customerService ;
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 */
	@RequestMapping("/map")
		public  String map() {
			return "map";
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
		session.setAttribute("loc", loc);
		
		log.info(loc.get("lat") + ": lat");
//		log.info(lat + ": lat");
		log.info(loc.get("lon") + ": lon");
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
