package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import h.fx.AbstractController;
import h.fx.ModelAndView;

public class HomeController extends AbstractController {
	ModelAndView mav = new ModelAndView();

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		mav.setViewName("/WEB-INF/views/home.jsp");
		
		return mav;
	}
}
