package net.developia.h.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import net.developia.h.model.ResvCalendarDTO;
import net.developia.h.model.RoomDTO;
import net.developia.h.service.MemberService;
import net.developia.h.service.ReservationService;

@Controller
@Slf4j
public class RoomResvController {
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/reserve")
	public String reservePage() {
		
		return "body/reserve";
	}
	
	@RequestMapping("/reserveWindow") 
	public String resvAvaiList(@RequestParam String hidIn, @RequestParam String hidOut, Model model) {
		String hidInArray[] = null;
		String hidOutArray[] = null;
		
		try {
			hidInArray = hidIn.substring(0, 10).split("/");
			hidOutArray = hidOut.substring(0, 10).split("/");
			hidIn = "";
			hidOut = "";
		} catch(Exception e) {
			model.addAttribute("msg", "예약 날짜가 선택되지 않았습니다.");
			model.addAttribute("url", "reserve");
			return "body/redirect1";
		}
		
		for (int i = 0; i < 3; i++) {
			hidIn += hidInArray[i];
			hidOut += hidOutArray[i];
		}
		
		List<RoomDTO> resvAvaiList = new ArrayList<>();
		ResvCalendarDTO resvCalendarDTO = new ResvCalendarDTO();
		resvCalendarDTO.setCheckIn(hidIn);
		resvCalendarDTO.setCheckOut(hidOut);
		try {
			resvAvaiList = reservationService.getResvAvaiList(resvCalendarDTO);
		} catch (Exception e) {
			model.addAttribute("msg", "오류가 발생했습니다.");
			model.addAttribute("url", "javascript:history.back();");
			return "body/redirect1";
		}
		model.addAttribute("resvAvaiList", resvAvaiList);
		model.addAttribute("hidIn", hidIn);
		model.addAttribute("hidOut", hidOut);
		
		return "body/reserveWindow";
	}
	
	@GetMapping("/reserveDetail") 
	public String reserveDetail(HttpServletRequest request, @ModelAttribute RoomDTO roomDTO, 
								@ModelAttribute ResvCalendarDTO resvCalendarDTO,
								Model model) {
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("member_id");
		log.info("memberId: " + memberId);
		
		if (memberId != null) {
			long id = roomDTO.getId();
			log.info("Id: " + id);
			log.info("checkin: " + resvCalendarDTO.getCheckIn());
			log.info("checkOUT: " + resvCalendarDTO.getCheckOut());
			
			RoomDTO detailRoom = new RoomDTO();
			try {
				detailRoom = reservationService.getResvDetial(id);
				
				model.addAttribute("detailRoom", detailRoom);
				model.addAttribute("resvCalendarDTO", resvCalendarDTO);
				
			} catch (Exception e) {
				e.getMessage();
			}
		} else {
			model.addAttribute("msg", "로그인되지 않았습니다. 먼저 로그인 화면으로 이동합니다.");
			model.addAttribute("url", "login");
			
			return "body/redirect1";
		}
		
		return "body/reserveDetail";
	}
	
	@PostMapping("/reserveDetail")
	public String reserveAction(HttpServletRequest request, @ModelAttribute RoomDTO detailRoom,
								@ModelAttribute ResvCalendarDTO resvCalendarDTO, Model model) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		long v_memberId = 0;
		resvCalendarDTO.setRoomId(detailRoom.getId());
		
		try {
			v_memberId = memberService.getMemberId(member_id);
			resvCalendarDTO.setMemberId(v_memberId);
			
			if (v_memberId != 0) {
				reservationService.insetReservation(resvCalendarDTO);
				System.out.println("예약 완료");
				
				model.addAttribute("msg", "객실 예약이 완료되었습니다. 감사합니다.");
				model.addAttribute("url", "home");
			}
		} catch(Exception e) {
			e.getMessage();
			System.out.println("sql문에서 에러");
			
			model.addAttribute("msg", "오류가 발생하였습니다.");
			model.addAttribute("url", "javascript:history.back();");
		}
		
		return "body/redirect1";
	}
}
