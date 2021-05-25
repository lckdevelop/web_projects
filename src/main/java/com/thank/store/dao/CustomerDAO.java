package com.thank.store.dao;

import java.sql.SQLException;
import java.util.List;

import com.thank.store.dto.CusSearchDTO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.CvstoreDTO;

public interface CustomerDAO {

	CustomerDTO getCustomerInfo(long no) throws SQLException;

	long getPurchaseCount(long no) throws SQLException;

	List<CvstoreDTO> searchCvstoreList(CusSearchDTO searchDTO) throws SQLException;

	List<CvsProductDTO> searchCvsProductList(long no) throws SQLException;

	long rechargePoint(CustomerDTO customerDTO) throws SQLException;

}
