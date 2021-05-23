package com.thank.store.dao;

import com.thank.store.dto.AccountDTO;

public interface AccountDAO {

	AccountDTO getAccount(AccountDTO accountDTO) throws Exception;
	
}
