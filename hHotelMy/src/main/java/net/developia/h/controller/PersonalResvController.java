package net.developia.h.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import net.developia.h.model.MemberReservationDTO;
import net.developia.h.service.MemberService;
import net.developia.h.service.ReservationService;

@Controller
@Slf4j
public class PersonalResvController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/myResv")
	public String myReservation(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		List<MemberReservationDTO> myResvList = new ArrayList<>();
		
		String loginId = (String) session.getAttribute("member_id");
		long memberId = 0;
		
		try {
			memberId = memberService.getMemberId(loginId);
			
			if (memberId != 0) {
				myResvList = reservationService.getMemResvList(memberId);
				
				model.addAttribute("myResvList", myResvList);
				
				return "body/myResv";
			}
		} catch(Exception e) {
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "javascript:history.back();");
		}
		return "body/redirect1";
	}
	
	@PostMapping("/myResv")
	public String canCelMyReservation(@RequestParam long resvId, Model model) {
		try {
			model.addAttribute("resvId", resvId);
			model.addAttribute("msg", "정말 예약 취소하시겠습니까?");
			model.addAttribute("url1", "javascript:history.back();");
			model.addAttribute("url2", "cancelMyResv");
		} catch (Exception e) {
			e.getMessage();
		}
		
		return "body/resvCancConf";
	}
	
	@GetMapping("/cancelMyResv")
	public String canCelResvAction(@RequestParam long resvId, Model model) {
		try {
			reservationService.deleteResv(resvId);
			
			model.addAttribute("msg", "예약이 취소되었습니다. 감사합니다.");
			model.addAttribute("url", "myResv");
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
		}
		
		return "body/redirect1";
	}
}
