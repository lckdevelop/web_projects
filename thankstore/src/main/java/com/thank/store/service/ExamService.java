package com.thank.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.ExamDAO;
import com.thank.store.dto.ExamDTO;

@Service
public class ExamService {
	@Autowired
	private ExamDAO examDAO;
	
	public ExamDTO getExam() throws Exception {
		return examDAO.getExam();
	}

}
