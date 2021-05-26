package com.thank.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.MapDAO;
import com.thank.store.dto.CvstoreDTO;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapDAO mapDAO;
	
	/*
	 * 작성자 : 이효범
	 * 작성일자 : 0524
	 */
	@Override
	public List<CvstoreDTO> getCvStore(HashMap<String, Double> loc) throws Exception {
		List<CvstoreDTO> list = new ArrayList();
		list = mapDAO.getCvStore(loc);
		return list;
	}

	/*
	 * 작성자 : 이효범
	 * 작성일자 : 0524
	 */
	@Override
	public List<CvstoreDTO> getTotalCvStore() throws Exception {
		List<CvstoreDTO> list = new ArrayList();
		list = mapDAO.getTotalCvStore();
		return list;
	}


}
