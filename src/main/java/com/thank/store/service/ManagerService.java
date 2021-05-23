package com.thank.store.service;

import java.util.List;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManagerDTO;

public interface ManagerService {
	ManagerDTO getManagerInfo(long no) throws Exception;

	List<CvsProductDTO> getAllProductList(long cvsno) throws Exception;
}
