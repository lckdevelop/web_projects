package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import h.fx.AbstractController;
import h.fx.ModelAndView;

public class ReserveCancelController extends AbstractController {
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		long resvId = Long.parseLong(request.getParameter("resvId"));
		
		try {
			mav.setViewName("/WEB-INF/views/resvCancConf.jsp");
			mav.addObject("resvId", resvId);
			mav.addObject("msg", "정말 예약 취소하시겠습니까?");
			mav.addObject("url1", "javascript:history.back();");
			mav.addObject("url2", "resvCancAction");
		} catch (Exception e) {
			e.getMessage();
		}
		
		return mav;
	}
}
