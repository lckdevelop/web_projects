package com.thank.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.ManagerDAO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManagerDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDAO mangerDAO;
	
	@Override
	public ManagerDTO getManagerInfo(long no) throws Exception {
		try {
			return mangerDAO.getManagerInfo(no);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<CvsProductDTO> getAllProductList(long cvsno) throws Exception {
		try {
			return mangerDAO.getAllProductList(cvsno);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
	
}
