package com.thank.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.AccountDAO;
import com.thank.store.dto.AccountDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AccountService {
	@Autowired
	private AccountDAO accountDAO;
	
	public AccountDTO getAccount(AccountDTO accountDTO) throws Exception{
		try {
			AccountDTO accountInfo = accountDAO.getAccount(accountDTO);
			System.out.println();
			if(accountInfo==null) {
				throw new RuntimeException("아이디 혹은 비밀번호 틀림.");
			}
			return accountInfo;
		}catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}