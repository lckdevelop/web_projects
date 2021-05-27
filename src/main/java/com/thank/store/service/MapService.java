package com.thank.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.ProductListDTO;

/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 */
public interface MapService {
	
	List<CvstoreDTO> getCvStore(HashMap<String, Double> loc) throws Exception;
	
	List<CvstoreDTO> getTotalCvStore() throws Exception;
	
	List<ProductListDTO> getProductList(HashMap<String, String> storecode) throws Exception;
}
