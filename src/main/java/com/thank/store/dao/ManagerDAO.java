package com.thank.store.dao;

import java.util.List;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManagerDTO;

public interface ManagerDAO {

	ManagerDTO getManagerInfo(long no) throws Exception;

	List<CvsProductDTO> getAllProductList(long cvsno) throws Exception;

}
