package com.thank.store.dao;

import java.sql.SQLException;

import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.PurchaseListDTO;

public interface CustomerDAO {

	CustomerDTO getCustomerInfo(long no) throws SQLException;

	long getPurchaseCount(long no) throws SQLException;

}
