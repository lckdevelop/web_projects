package h.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import h.dto.MemberReservationDTO;
import h.fx.AbstractController;
import h.fx.ModelAndView;
import h.service.MemberService;
import h.service.MemberServiceImpl;
import h.service.ReservationService;
import h.service.ReservationServiceImpl;

public class MyResvController extends AbstractController {
	private MemberService memberService = MemberServiceImpl.getInstance();
	private ReservationService reservationService = ReservationServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		List<MemberReservationDTO> myResvList = new ArrayList<>();
		
		String loginId = (String) session.getAttribute("member_id");
		long memberId = 0;
		
		try {
			memberId = memberService.getMemberId(loginId);
			
			if (memberId != 0) {
				myResvList = reservationService.getMemResvList(memberId);
				
				mav.setViewName("/WEB-INF/views/myResv.jsp");
				mav.addObject("myResvList", myResvList);
			}
		} catch(Exception e) {
			e.getMessage();
			mav.setViewName("/WEB-INF/views/redirect.jsp");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
		}
		
		return mav;
	}

}
