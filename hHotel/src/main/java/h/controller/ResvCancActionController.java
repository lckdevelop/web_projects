package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import h.fx.AbstractController;
import h.fx.ModelAndView;
import h.service.ReservationService;
import h.service.ReservationServiceImpl;

public class ResvCancActionController extends AbstractController {
	private ReservationService reservationService = ReservationServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		long resvId = Long.parseLong(request.getParameter("resvId"));
		
		try {
			reservationService.deleteResv(resvId);
			
			mav.setViewName("/WEB-INF/views/redirect.jsp");
			mav.addObject("msg", "예약이 취소되었습니다. 감사합니다.");
			mav.addObject("url", "home");
		} catch (Exception e) {
			e.getMessage();
		}
		
		return mav;
	}
}
