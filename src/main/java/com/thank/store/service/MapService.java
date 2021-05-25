package com.thank.store.service;

import java.util.List;

import com.thank.store.dto.CvstoreDTO;

/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 */
public interface MapService {
	
	List<CvstoreDTO> getCvStore() throws Exception;
}
