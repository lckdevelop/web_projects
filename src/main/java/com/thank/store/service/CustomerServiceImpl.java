package com.thank.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.CustomerDAO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.PurchaseListDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerDAO customerDAO;

	@Override
	public CustomerDTO getCustomerInfo(long no) throws Exception {
		return customerDAO.getCustomerInfo(no);
	}

	@Override
	public long getPurchaseCount(long no) throws Exception {
		return customerDAO.getPurchaseCount(no);
	}
}
