package net.developia.h.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.developia.h.model.MemberDAO;
import net.developia.h.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberDTO mDTO) throws Exception {
		memberDAO.insertMember(mDTO);
	}

	@Override
	public long loginCheck(MemberDTO mDTO) throws Exception {
		return memberDAO.loginCheck(mDTO);
	}

	@Override
	public long getMemberId(String member_id) throws Exception {
		return memberDAO.getMemberId(member_id);
	}

	@Override
	public boolean idDuplicateCheck(String id) throws Exception {
		return memberDAO.idDuplicateCheck(id);
	}

	@Override
	public boolean emDuplicateCheck(String email) throws Exception {
		return memberDAO.emDuplicateCheck(email);
	}
	
}
