package com.thank.store.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.thank.store.dao.MapDAO;
import com.thank.store.dto.cvStoreDTO;

/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 */
public interface MapService {
	
	cvStoreDTO getCvStore() throws Exception;
}
