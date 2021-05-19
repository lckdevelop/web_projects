package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import h.fx.AbstractController;
import h.fx.ModelAndView;

public class ExamController  extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/views/main.jsp");
		return mav;
	}

}
