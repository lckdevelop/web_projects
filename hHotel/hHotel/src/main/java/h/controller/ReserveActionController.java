package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import h.dto.RoomDTO;
import h.fx.AbstractController;
import h.fx.ModelAndView;
import h.service.MemberService;
import h.service.MemberServiceImpl;
import h.service.ReservationService;
import h.service.ReservationServiceImpl;

public class ReserveActionController extends AbstractController {
	private ReservationService reservationService = ReservationServiceImpl.getInstance();
	private MemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		RoomDTO rmDTO = new RoomDTO();
		HttpSession session = request.getSession(false);
		
		long id = Long.parseLong(request.getParameter("id")); // 객실 id
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String member_id = (String) session.getAttribute("member_id");
		long v_memberId = 0;
		
		try {
			v_memberId = memberService.getMemberId(member_id);
			
			if (v_memberId != 0) {
				reservationService.insetReservation(id, checkIn, checkOut, v_memberId);
				reservationService.updateStatus(id);
				System.out.println("예약 완료");
				
				mav.setViewName("/WEB-INF/views/reserveMove.jsp");
				mav.addObject("msg", "객실 예약이 완료되었습니다. 감사합니다.");
				mav.addObject("url", "home");
			}
		} catch(Exception e) {
			e.getMessage();
			System.out.println("sql문에서 에러");
			
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
		}
		
		return mav;
	}

}
