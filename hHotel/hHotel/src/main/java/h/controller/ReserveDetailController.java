package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import h.dto.RoomDTO;
import h.fx.AbstractController;
import h.fx.ModelAndView;
import h.service.ReservationService;
import h.service.ReservationServiceImpl;

public class ReserveDetailController extends AbstractController {
	private ReservationService reservationService = ReservationServiceImpl.getInstance(); 
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		RoomDTO rmDTO = new RoomDTO();
		HttpSession session = request.getSession();
		String memberId = null;
		
		try {
			memberId = (String) session.getAttribute("member_id");
			System.out.println(memberId);
			
			if (memberId != null) {
				long id = Long.parseLong(request.getParameter("id"));
				String checkIn = request.getParameter("checkIn");
				String checkOut = request.getParameter("checkOut");
				System.out.println("checkIn" + checkIn);
				System.out.println("checkOut" + checkOut);
				
				try {
					rmDTO = reservationService.getResvDetial(id);
					
					mav.addObject("rmDTO", rmDTO);
					mav.addObject("checkIn", checkIn);
					mav.addObject("checkOut", checkOut);
					
					mav.setViewName("/WEB-INF/views/reserveDetail.jsp");
				} catch (Exception e) {
					e.getMessage();
				}
				
			} else {
				mav.setViewName("/WEB-INF/views/redirect.jsp");
				mav.addObject("msg", "로그인되지 않았습니다. 먼저 로그인 화면으로 이동합니다.");
				mav.addObject("url", "login");
			}
			
		} catch(Exception e) {
			System.out.println("로그인 되지 않았습니다.");
			e.getMessage();
		}
		
		return mav;
	}
}
