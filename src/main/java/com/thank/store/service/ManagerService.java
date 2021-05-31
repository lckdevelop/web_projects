package com.thank.store.service;

import java.sql.SQLException;
import java.util.List;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManagerDTO;
import com.thank.store.dto.MemberDTO;
import com.thank.store.dto.ProfitDTO;

public interface ManagerService {
	
	ManagerDTO getManagerInfo(long no) throws Exception;

	List<CvsProductDTO> getAllProductList(ManSearchDTO searchDTO) throws Exception;
	
	List<CvsProductDTO> getEnrolledProductList(ManSearchDTO searchDTO) throws Exception;

	List<CvsProductDTO> getEnrolAvaiProductList(ManSearchDTO searchDTO) throws Exception;
	
	int enrollAction(CvsProductDTO cvsProductDTO) throws Exception;
	
	int cancelAction(CvsProductDTO cvsProductDTO) throws Exception;

	ManPagingDTO getPagingInfo(ManSearchDTO searchDTO) throws Exception;
	
	ManPagingDTO getAvailPagingInfo(ManSearchDTO searchDTO) throws Exception;
	
	ManPagingDTO getEnrolledPagingInfo(ManSearchDTO searchDTO) throws Exception;
	
	long getManagerNoFromMember(MemberDTO memberDTO) throws Exception;
	
	long getDiscountPrice(long price, int discountRate) throws Exception;
	
	int getDiscountRate(long countTime) throws Exception;
	
	void updateStorecode(ManagerDTO managerDTO) throws Exception;
	
	void updateCVstoreFromManager(ManagerDTO managerDTO) throws Exception;

	int enrollmentCheck(long no) throws Exception;
	
	List<ProfitDTO> profitPerMonth(ProfitDTO profitDTO) throws Exception;

	List<ProfitDTO> profitPerCategory(ProfitDTO profitDTO) throws Exception;

	String managerIdCheck(String id) throws Exception;

	String managerStoreCodeCheck(String storecode) throws Exception;
}
