package com.thank.store.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.thank.store.dto.CvstoreDTO;
import com.thank.store.service.MapService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 * @작성이유 : map띄울때 편의점정보 가져오기
	 */
	@GetMapping("/maptest")
	public ModelAndView map() {
		
		CvstoreDTO cvStoreDTO = new CvstoreDTO();
		ModelAndView mav = new ModelAndView();
		
		try {
			
			List<CvstoreDTO> list = mapService.getCvStore();
			mav.addObject("cvStoreDTO", list);
			mav.setViewName("map");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 * @작성이유 : map.jsp의 편의점상품보기 ajax
	 */
	@RequestMapping("/map3")
	public String ajaxProductList() {
		return "map";
	}
	
	/*
	 * @작성자 : 이효범
	 * @작성일자 : 0524
	 * @작성이유 : map.jsp의 편의점상품보기 ajax
	 */
	@RequestMapping("/map2")
	public  String ajaxProductList2() {
		return "map";
	}
}
