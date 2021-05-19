package h.service;

import h.dao.MemberDAO;
import h.dao.MemberDAOImpl;
import h.dto.MemberDTO;

public class MemberServiceImpl implements MemberService {
	private static final MemberService memberService = new MemberServiceImpl();
	private MemberDAO memberDAO = MemberDAOImpl.getInstance();
	
	private MemberServiceImpl() {
		
	}
	
	public static MemberService getInstance() {
		return memberService;
	}
	
	@Override
	public void insertMember(MemberDTO mDTO) throws Exception {
		memberDAO.insertMember(mDTO);
	}

	@Override
	public boolean loginCheck(MemberDTO mDTO) throws Exception {
		return memberDAO.loginCheck(mDTO);
	}

	@Override
	public long getMemberId(String member_id) throws Exception {
		return memberDAO.getMemberId(member_id);
	}
	
}
