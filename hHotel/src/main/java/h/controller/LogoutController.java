package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import h.fx.AbstractController;
import h.fx.ModelAndView;

public class LogoutController extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		session.invalidate();
		mav.setViewName("/WEB-INF/views/home.jsp");
		
		return mav;
	}
}
