package com.thank.store.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.ManagerDAO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManagerDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDAO mangerDAO;
	
	@Override
	public ManagerDTO getManagerInfo(long no) throws Exception {
		try {
			return mangerDAO.getManagerInfo(no);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

//	@Override
//	public List<CvsProductDTO> getAllProductList(long cvsno) throws Exception {
//		try {
//			return mangerDAO.getAllProductList(cvsno);
//		} catch (Exception e) {
//			log.info(e.getMessage());
//			throw e;
//		}
//	}

	@Override
	public List<CvsProductDTO> getAllProductList(ManSearchDTO searchDTO) throws Exception {
		List<CvsProductDTO> list = new ArrayList<>();
		try {
			list = mangerDAO.getAllProductList(searchDTO);
			
			for (CvsProductDTO cvsProductDTO : list) {
				long tmpTime = cvsProductDTO.getExpirationdate().getTime() - cvsProductDTO.getWarehousingdate().getTime();
				log.info(tmpTime / (24*60*60*1000) + "차이나는 일수" );
				log.info(tmpTime / (60*60*1000) + "차이나는 시간" );
				long leftDay = tmpTime / (24*60*60*1000);
				long leftTime = (tmpTime / (60*60*1000)) - (leftDay * 24);
				
				cvsProductDTO.setLeftDay(leftDay);
				cvsProductDTO.setLeftTime(leftTime);
			}
			
			return list;
		} catch (Exception e) {
			log.info(e.getMessage());
			
			throw e;
		}
	}

	@Override
	public ManPagingDTO getPagingInfo(ManSearchDTO searchDTO) throws Exception {
		long totalRecord = mangerDAO.getTotalRecord(searchDTO);
		ManPagingDTO pagingDTO = new ManPagingDTO(searchDTO.getPagingDTO().getPg(), totalRecord);
		
		return pagingDTO;
	}
	
}

