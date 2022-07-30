package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import h.dto.MemberDTO;
import h.fx.AbstractController;
import h.fx.ModelAndView;

public class LoginController extends AbstractController {
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		MemberDTO mDTO = new MemberDTO();
		
		mDTO.setLoginId(request.getParameter("id"));
		mDTO.setLoginPassword(request.getParameter("password"));
		
		
		mav.setViewName("/WEB-INF/views/login.jsp");
		mav.addObject("mDTO", mDTO);
		
		return mav;
	}
}

