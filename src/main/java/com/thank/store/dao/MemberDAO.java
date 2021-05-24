package com.thank.store.dao;

import com.thank.store.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO getMember(MemberDTO memberDTO) throws Exception;
	
	int checkMemberExist(MemberDTO memberDTO) throws Exception;
	
	void addManager(MemberDTO memberDTO) throws Exception;

	void addCustomer(MemberDTO memberDTO);
}
