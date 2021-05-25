package com.thank.store.service;

import java.util.List;

import com.thank.store.dto.CusSearchDTO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvstoreDTO;

public interface CustomerService {

	CustomerDTO getCustomerInfo(long no) throws Exception;

	long getPurchaseCount(long no) throws Exception;

	List<CvstoreDTO> searchCvstoreList(CusSearchDTO searchDTO) throws Exception;

	long rechargePoint(CustomerDTO customerDTO) throws Exception;

}
