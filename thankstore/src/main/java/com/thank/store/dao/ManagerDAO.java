package com.thank.store.dao;

import java.sql.SQLException;
import java.util.List;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManSellListDTO;
import com.thank.store.dto.ManagerDTO;
import com.thank.store.dto.MemberDTO;
import com.thank.store.dto.ProfitDTO;

public interface ManagerDAO {

	ManagerDTO getManagerInfo(long no) throws SQLException;

	List<CvsProductDTO> getAllProductList(ManSearchDTO searchDTO) throws SQLException;
	
	List<CvsProductDTO> getEnrolledProductList(ManSearchDTO searchDTO) throws SQLException;
	
	List<CvsProductDTO> getEnrolAvaiProductList(ManSearchDTO searchDTO) throws SQLException;
	
	int enrollAction(CvsProductDTO cvsProductDTO) throws SQLException;

	long getManagerNoFromMember(MemberDTO memberDTO) throws SQLException;

	long getTotalRecord(ManSearchDTO searchDTO) throws SQLException;
	
	long getTotalAvailRecord(ManSearchDTO searchDTO) throws SQLException;

	long getTotalEnrolledRecord(ManSearchDTO searchDTO) throws SQLException;

	void updateStorecode(ManagerDTO managerDTO) throws SQLException;

	int cancelAction(CvsProductDTO cvsProductDTO) throws SQLException;
	
	void updateCVstoreFromManager(ManagerDTO managerDTO) throws SQLException;

	int enrollmentCheck(long no) throws SQLException;
	
	List<ProfitDTO> profitPerMonth(ProfitDTO profitDTO) throws SQLException;

	List<ProfitDTO> profitPerMainCategory(ProfitDTO profitDTO) throws SQLException;

	List<ProfitDTO> profitPerSubCategory(ProfitDTO profitDTO) throws SQLException;
	
	List<ManSellListDTO> sellProfitList(ProfitDTO profitDTO) throws SQLException;

	String managerIdCheck(String id) throws SQLException;
	
	String managerStoreCodeCheck(String id) throws SQLException;

	String storeCodeRegisteredCheck(String storecode) throws SQLException;
}
