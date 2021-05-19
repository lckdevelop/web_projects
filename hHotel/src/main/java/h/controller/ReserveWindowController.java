package h.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import h.dto.RoomDTO;
import h.fx.AbstractController;
import h.fx.ModelAndView;
import h.service.ReservationService;
import h.service.ReservationServiceImpl;

public class ReserveWindowController extends AbstractController {
	private ReservationService reservationService = ReservationServiceImpl.getInstance();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		String hidIn[] = null;
		String hidOut[] = null;
		
		try {
			hidIn = request.getParameter("hidIn").substring(0, 10).split("/");
			hidOut = request.getParameter("hidOut").substring(0, 10).split("/");
		} catch(Exception e) {
			e.getMessage();
			mav.setViewName("/WEB-INF/views/redirect.jsp");
			mav.addObject("msg", "예약 날짜가 선택되지 않았습니다.");
			mav.addObject("url", "reserve");
			return mav;
		}

		StringBuffer checkIn = new StringBuffer();
		StringBuffer checkOut =  new StringBuffer();
		
		for (int i = 0; i < 3; i++) {
			checkIn.append(hidIn[i]);
			checkOut.append(hidOut[i]);
		}
		
		try {
			List<RoomDTO> resvAvaiList = reservationService.getResvAvaiList(checkIn.toString(), checkOut.toString());
			
			mav.addObject("resvAvaiList", resvAvaiList);
			mav.addObject("checkIn", checkIn);
			mav.addObject("checkOut", checkOut);
			mav.setViewName("/WEB-INF/views/reserveWindow.jsp");
		} catch(Exception e) {
			e.getMessage();
		}
		
		return mav;
	}

}
