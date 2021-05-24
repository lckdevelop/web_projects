package com.thank.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.MapDAO;
import com.thank.store.dto.cvStoreDTO;

import lombok.extern.slf4j.Slf4j;

/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 */
@Service
@Slf4j
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapDAO mapDAO;
	
	@Override
	public cvStoreDTO getCvStore() throws Exception {
		return null;
	}

}
