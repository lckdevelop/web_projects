package com.thank.store.dao;

import java.sql.SQLException;
import java.util.List;

import com.thank.store.dto.CusSearchDTO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.PurchaseListDTO;

public interface CustomerDAO {

	CustomerDTO getCustomerInfo(long no) throws SQLException;

	long getPurchaseCount(long no) throws SQLException;

	List<CvstoreDTO> searchCvstoreList(CusSearchDTO searchDTO) throws SQLException;

	List<CvsProductDTO> searchCvsProductList(CusSearchDTO searchDTO) throws SQLException;

	long rechargePoint(CustomerDTO customerDTO) throws SQLException;

	List<String> getSubCategory(CusSearchDTO searchDTO) throws SQLException;

	long getTotalRecord(CusSearchDTO searchDTO) throws SQLException;

	List<PurchaseListDTO> getPurchaseList(CusSearchDTO searchDTO) throws SQLException;

	CvsProductDTO getOneCvsProduct(long no) throws SQLException;

	long updateCustomerPoint(CustomerDTO customerDTO) throws SQLException;

	long addPurchaseProduct(CustomerDTO customerDTO) throws SQLException;

	long updatePurchaseProduct(CvsProductDTO cvsProductDTO) throws SQLException;

	long updateCvstorePoint(CvsProductDTO cvsProductDTO) throws SQLException;

}
