package h.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import h.dto.MemberDTO;
import h.fx.AbstractController;
import h.fx.ModelAndView;
import h.service.MemberService;
import h.service.MemberServiceImpl;

public class JoinActionController extends AbstractController {
	private MemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO mDTO = new MemberDTO();
		
		mDTO.setLoginId(request.getParameter("id"));
		mDTO.setLoginPassword(request.getParameter("password"));
		mDTO.setEmail(request.getParameter("email"));
		mDTO.setCountry(request.getParameter("country"));
		mDTO.setName(request.getParameter("name"));
		mDTO.setBirthdate(request.getParameter("birthdate"));
		mDTO.setTel(request.getParameter("tel"));
		
		ModelAndView mav = new ModelAndView();
		
		try {
			memberService.insertMember(mDTO);
			mav.setViewName("/WEB-INF/views/reserveMove.jsp");
			mav.addObject("msg", "회원가입이 완료되었습니다.");
			mav.addObject("url", "home");
		} catch (Exception e) {
			mav.setViewName("/WEB-INF/views/reserveMove.jsp");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}
}
