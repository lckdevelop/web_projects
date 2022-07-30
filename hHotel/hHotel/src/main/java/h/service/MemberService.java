package h.service;

import h.dto.MemberDTO;

public interface MemberService {
	void insertMember(MemberDTO mDTO) throws Exception;
	boolean loginCheck(MemberDTO mDTO) throws Exception;
	long getMemberId(String member_id) throws Exception;
}
