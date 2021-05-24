package com.thank.store.dao;

import java.sql.SQLException;
import java.util.List;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManagerDTO;

public interface ManagerDAO {

	ManagerDTO getManagerInfo(long no) throws SQLException;

	List<CvsProductDTO> getAllProductList(long cvsno) throws SQLException;

	List<CvsProductDTO> getAllProductList(ManSearchDTO searchDTO) throws SQLException;
	
	long getTotalRecord(ManSearchDTO searchDTO) throws SQLException;

}
