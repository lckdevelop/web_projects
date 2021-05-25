package com.thank.store.dao;


import java.sql.SQLException;
import java.util.List;

import com.thank.store.dto.CvstoreDTO;
/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 */
public interface MapDAO {
	
	List<CvstoreDTO> getCvStore() throws SQLException;
}
