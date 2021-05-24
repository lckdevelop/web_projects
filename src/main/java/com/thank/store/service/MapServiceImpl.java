package com.thank.store.service;

import java.util.ArrayList;
import java.util.List;

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
	public List<cvStoreDTO> getCvStore() throws Exception {
		List<cvStoreDTO> list = new ArrayList();
		list = mapDAO.getCvStore();
		return list;
	}

}
