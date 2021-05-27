package com.thank.store.dao;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thank.store.dto.CvstoreDTO;
/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 */
import com.thank.store.dto.ProductListDTO;
public interface MapDAO {
	
	List<CvstoreDTO> getCvStore(HashMap<String, Double> loc) throws SQLException;
	
	List<CvstoreDTO> getTotalCvStore() throws SQLException;
	
	List<ProductListDTO> getProductList(HashMap<String, String> storecode) throws SQLException;
}
