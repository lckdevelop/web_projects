package com.thank.store.dao;

import com.thank.store.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO getMember(MemberDTO memberDTO) throws Exception;
	
}
