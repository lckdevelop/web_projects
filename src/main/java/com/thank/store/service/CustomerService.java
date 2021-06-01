package com.thank.store.service;

import java.util.HashMap;
import java.util.List;

import com.thank.store.dto.ChartDTO;
import com.thank.store.dto.CusSearchDTO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.PagingDTO;
import com.thank.store.dto.PurchaseListDTO;

public interface CustomerService {

	CustomerDTO getCustomerInfo(long no) throws Exception;

	long getPurchaseCount(long no) throws Exception;

	List<CvstoreDTO> searchCvstoreList(CusSearchDTO searchDTO) throws Exception;
	
	//효범 searchCvstorList
	CvstoreDTO searchCvstoreListMap(HashMap<String, String> storecode) throws Exception;

	long rechargePoint(CustomerDTO customerDTO) throws Exception;

	List<String> getSubCategory(CusSearchDTO searchDTO) throws Exception;

	int getDiscountRate(long countTime) throws Exception;

	long getTotalRecord(CusSearchDTO searchDTO) throws Exception;

	List<PurchaseListDTO> getPurchaseList(CusSearchDTO searchDTO) throws Exception;

	CvsProductDTO getOneCvsProduct(long no) throws Exception;

	long updateCustomerPoint(CustomerDTO customerDTO) throws Exception;

	long addPurchaseProduct(CustomerDTO customerDTO) throws Exception;

	long updatePurchaseProduct(CvsProductDTO cvsProductDTO) throws Exception;

	long updateCvstorePoint(CvsProductDTO cvsProductDTO) throws Exception;

	long getEndPurchaseCount(long no) throws Exception;

	List<PurchaseListDTO> getEndPurchaseList(CusSearchDTO searchDTO) throws Exception;

	long getTotalPurchaseCount(long no) throws Exception;

	List<PurchaseListDTO> getTotalPurchaseList(CusSearchDTO searchDTO) throws Exception;

	String customerIdCheck(String id);

	long getTotalDiscountPrice(long no) throws Exception;

	List<ChartDTO> purchasePerBrand(long customerNo) throws Exception;

	List<ChartDTO> purchasePerCategory(long customerNo) throws Exception;

}
