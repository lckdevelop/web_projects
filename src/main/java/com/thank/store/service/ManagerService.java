package com.thank.store.service;

import java.util.List;

import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManagerDTO;
import com.thank.store.dto.MemberDTO;

public interface ManagerService {
	ManagerDTO getManagerInfo(long no) throws Exception;

	//List<CvsProductDTO> getAllProductList(long cvsno) throws Exception;
	
	List<CvsProductDTO> getAllProductList(ManSearchDTO searchDTO) throws Exception;

	ManPagingDTO getPagingInfo(ManSearchDTO searchDTO) throws Exception;

	int getManagerNoFromMember(MemberDTO memberDTO) throws Exception;
}
