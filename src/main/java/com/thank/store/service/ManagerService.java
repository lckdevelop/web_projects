package com.thank.store.service;

import java.util.List;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManagerDTO;
import com.thank.store.dto.MemberDTO;

public interface ManagerService {
	
	ManagerDTO getManagerInfo(long no) throws Exception;

	List<CvsProductDTO> getAllProductList(ManSearchDTO searchDTO) throws Exception;
	
	List<CvsProductDTO> getEnrolledProductList(ManSearchDTO searchDTO) throws Exception;

	List<CvsProductDTO> getEnrolAvaiProductList(ManSearchDTO searchDTO) throws Exception;

	ManPagingDTO getPagingInfo(ManSearchDTO searchDTO) throws Exception;

	long getManagerNoFromMember(MemberDTO memberDTO) throws Exception;
	
	long getDiscountPrice(long price, int discountRate) throws Exception;
	
	int getDiscountRate(long countTime) throws Exception;
	
	void updateStorecode(ManagerDTO managerDTO) throws Exception;

}
