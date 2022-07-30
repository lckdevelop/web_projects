package net.developia.h.service;

import net.developia.h.model.MemberDTO;

public interface MemberService {
	void insertMember(MemberDTO memberDTO) throws Exception;
	long loginCheck(MemberDTO memberDTO) throws Exception;
	long getMemberId(String member_id) throws Exception;
	boolean idDuplicateCheck(String id) throws Exception;
	boolean emDuplicateCheck(String email) throws Exception;
}
