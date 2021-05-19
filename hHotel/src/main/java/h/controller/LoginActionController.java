package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import h.dto.MemberDTO;
import h.fx.AbstractController;
import h.fx.ModelAndView;
import h.service.MemberService;
import h.service.MemberServiceImpl;

public class LoginActionController extends AbstractController {
	private MemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		MemberDTO mDTO = new MemberDTO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		mDTO.setLoginId(id);
		mDTO.setLoginPassword(pw);
		
		HttpSession session = request.getSession();
		
		try {
			if (memberService.loginCheck(mDTO)) {
				session.setAttribute("loginOk", true);
				session.setAttribute("member_id", id);
				session.setAttribute("member_pw", pw);
				mav.addObject("member_id", session.getAttribute("member_id"));
				mav.addObject("member_pw", session.getAttribute("member_pw"));
				
				mav.setViewName("/WEB-INF/views/home.jsp");
			} else {
				mav.setViewName("/WEB-INF/views/result.jsp");
				mav.addObject("msg", "로그인에 실패하였습니다.");
				mav.addObject("url", "javascript:history.back();");
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return mav;
	}
}

