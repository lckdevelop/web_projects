package com.thank.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.CustomerDAO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.CvstoreDTO;
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
	
	
	//작성자 : 방지훈
	//작성일자 : 05/24 16:26
	@Override
	public List<CvstoreDTO> searchCvstoreList(String searchKeyword) throws Exception {
		List<CvstoreDTO> cvstoreList = customerDAO.searchCvstoreList(searchKeyword);
		for(CvstoreDTO cvstore:cvstoreList) {
			cvstore.setCvsProductList(customerDAO.searchCvsProductList(cvstore.getNo()));
		}
		return cvstoreList;
	}

	//작성자 : 방지훈
	//작성일자 : 05/24 18:36
	@Override
	public long rechargePoint(CustomerDTO customerDTO) throws Exception {
		return customerDAO.rechargePoint(customerDTO);
		
	}
}
