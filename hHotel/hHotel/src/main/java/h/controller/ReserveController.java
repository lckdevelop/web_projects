package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import h.fx.AbstractController;
import h.fx.ModelAndView;

public class ReserveController extends AbstractController {
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		try {
			mav.setViewName("/WEB-INF/views/reserve.jsp");
		} catch (Exception e) {
			e.getMessage();
		}
		
		return mav;
	}
}
