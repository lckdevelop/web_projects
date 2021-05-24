package com.thank.store.dao;


import java.sql.SQLException;

import com.thank.store.dto.cvStoreDTO;
/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 */
public interface MapDAO {
	
	cvStoreDTO getCvStore() throws SQLException;
}
