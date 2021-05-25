package com.thank.store.service;

import java.util.List;

import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.PurchaseListDTO;

public interface CustomerService {

	CustomerDTO getCustomerInfo(long no) throws Exception;

	long getPurchaseCount(long no) throws Exception;

	List<CvstoreDTO> searchCvstoreList(String searchKeyword) throws Exception;

	long rechargePoint(CustomerDTO customerDTO) throws Exception;

}
