package com.thank.store.service;

import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.PurchaseListDTO;

public interface CustomerService {

	CustomerDTO getCustomerInfo(long no) throws Exception;

	long getPurchaseCount(long no) throws Exception;

}
