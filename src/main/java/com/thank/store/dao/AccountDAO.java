package com.thank.store.dao;

import com.thank.store.dto.MemberDTO;

public interface AccountDAO {

	MemberDTO getAccount(MemberDTO accountDTO) throws Exception;
	//
}
