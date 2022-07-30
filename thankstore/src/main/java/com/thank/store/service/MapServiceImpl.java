package com.thank.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.MapDAO;
import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.ProductListDTO;

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
	//나의 위치와 편의점 위치를 이용해서 거리 계산된 편의점 List출력
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

	/*
	 * 작성자 : 이효범
	 * 작성일자 : 0527 00:54
	 */
	@Override
	public List<ProductListDTO> getProductList(HashMap<String, String> storecode) throws Exception {
		List<ProductListDTO> list = new ArrayList();
		list = mapDAO.getProductList(storecode);
		return list;
	}


}
