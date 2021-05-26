package com.thank.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thank.store.dto.CvstoreDTO;

/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 */
public interface MapService {
	
	List<CvstoreDTO> getCvStore(HashMap<String, Double> loc) throws Exception;
	
	List<CvstoreDTO> getTotalCvStore() throws Exception;
}
