package com.thank.store.dao;

import java.sql.SQLException;
import java.util.List;

import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.PurchaseListDTO;

public interface CustomerDAO {

	CustomerDTO getCustomerInfo(long no) throws SQLException;

	long getPurchaseCount(long no) throws SQLException;

	List<CvstoreDTO> searchCvstoreList(String searchKeyword) throws SQLException;

	List<CvsProductDTO> searchCvsProductList(long no) throws SQLException;

	long rechargePoint(CustomerDTO customerDTO) throws SQLException;

}
