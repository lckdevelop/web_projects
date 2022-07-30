package com.thank.store.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.ManagerDAO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.ManSellListDTO;
import com.thank.store.dto.ManagerDTO;
import com.thank.store.dto.MemberDTO;
import com.thank.store.dto.ProfitDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDAO managerDAO;
	
	@Override
	public ManagerDTO getManagerInfo(long no) throws Exception {
		try {
			return managerDAO.getManagerInfo(no);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<CvsProductDTO> getAllProductList(ManSearchDTO searchDTO) throws Exception {
		List<CvsProductDTO> list = new ArrayList<>();
		try {
			list = managerDAO.getAllProductList(searchDTO);
			
			for (CvsProductDTO cvsProductDTO : list) {
				long countTime = (cvsProductDTO.getCountTime());
				long leftDay = countTime / 24;
				long leftTime = 0;

				if (countTime % 24 == 0) {
					leftTime = 0;
				} else {
					leftTime = countTime % 24;
				}
				cvsProductDTO.setLeftDay(leftDay);
				cvsProductDTO.setLeftTime(leftTime);
				cvsProductDTO.setCountTime(countTime);
				
				if (countTime <= 24) {
					int discountRate = getDiscountRate(countTime);
					cvsProductDTO.setDiscountRate(discountRate);
					cvsProductDTO.setDiscountPrice(getDiscountPrice(cvsProductDTO.getPrice(), discountRate));
				}
			}
			
			return list;
		} catch (Exception e) {
			log.info(e.getMessage());
			
			throw e;
		}
	}
	
	@Override
	public List<CvsProductDTO> getEnrolledProductList(ManSearchDTO searchDTO) throws Exception {
		List<CvsProductDTO> list = new ArrayList<>();
		try {
			list = managerDAO.getEnrolledProductList(searchDTO);
			
			for (CvsProductDTO cvsProductDTO : list) {
				long countTime = (cvsProductDTO.getCountTime());
				int discountRate = getDiscountRate(countTime);
				cvsProductDTO.setDiscountRate(discountRate);
				cvsProductDTO.setDiscountPrice(getDiscountPrice(cvsProductDTO.getPrice(), discountRate));
			}
			
			return list;
			
		} catch (Exception e) {
			log.info(e.getMessage());
			
			throw e;
		}
	}
	
	@Override
	public List<CvsProductDTO> getEnrolAvaiProductList(ManSearchDTO searchDTO) throws Exception {
		List<CvsProductDTO> list = new ArrayList<>();
		try {
			list = managerDAO.getEnrolAvaiProductList(searchDTO);
			
			for (CvsProductDTO cvsProductDTO : list) {
				long countTime = (cvsProductDTO.getCountTime());
				int discountRate = getDiscountRate(countTime);
				cvsProductDTO.setDiscountRate(discountRate);
				cvsProductDTO.setDiscountPrice(getDiscountPrice(cvsProductDTO.getPrice(), discountRate));
			}
			
			return list;
			
		} catch (Exception e) {
			log.info(e.getMessage());
			
			throw e;
		}
	}
	
	@Override
	public ManPagingDTO getPagingInfo(ManSearchDTO searchDTO) throws Exception {
		long totalRecord = managerDAO.getTotalRecord(searchDTO);
		ManPagingDTO pagingDTO = new ManPagingDTO(searchDTO.getPagingDTO().getPg(), totalRecord);
		
		return pagingDTO;
	}
	
	@Override
	public ManPagingDTO getEnrolledPagingInfo(ManSearchDTO searchDTO) throws Exception {
		long totalRecord = managerDAO.getTotalEnrolledRecord(searchDTO);
		ManPagingDTO pagingDTO = new ManPagingDTO(searchDTO.getPagingDTO().getPg(), totalRecord);
		
		return pagingDTO;
	}

	@Override
	public ManPagingDTO getAvailPagingInfo(ManSearchDTO searchDTO) throws Exception {
		long totalRecord = managerDAO.getTotalAvailRecord(searchDTO);
		ManPagingDTO pagingDTO = new ManPagingDTO(searchDTO.getPagingDTO().getPg(), totalRecord);
		
		return pagingDTO;
	}
	
	@Override
	public int enrollAction(CvsProductDTO cvsProductDTO) throws Exception {
		return managerDAO.enrollAction(cvsProductDTO);
	}
	
	@Override
	public int cancelAction(CvsProductDTO cvsProductDTO) throws Exception {
		return managerDAO.cancelAction(cvsProductDTO);
	}
	
	
	
	public long getDiscountPrice(long price, int discountRate) throws Exception {
		long discountPrice = price * (100 - discountRate) / 100;
		
		return discountPrice;
	}

	@Override
	public int getDiscountRate(long countTime) throws Exception {
		int discountRate = 0;
		
		if(countTime <= 4) {
			discountRate = 60;
		} else if(countTime <= 8) {
			discountRate = 50;
		} else if(countTime <= 12) {
			discountRate = 40;
		} else if(countTime <= 16) {
			discountRate = 30;
		} else if(countTime <= 20){
			discountRate = 20;
		} else {
			discountRate = 10;
		}
		
		return discountRate;
	}

	@Override
	public void updateStorecode(ManagerDTO managerDTO) throws Exception {
		try {
			managerDAO.updateStorecode(managerDTO);
		}catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateCVstoreFromManager(ManagerDTO managerDTO) throws Exception {
		try {
			managerDAO.updateCVstoreFromManager(managerDTO);
		}catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}	
	}

	@Override
	public int enrollmentCheck(long no) throws Exception {
		return managerDAO.enrollmentCheck(no);
	}

	@Override
	public List<ProfitDTO> profitPerMonth(ProfitDTO profitDTO) throws Exception {
		return managerDAO.profitPerMonth(profitDTO);
		
	}

	@Override
	public List<ProfitDTO> profitPerMainCategory(ProfitDTO profitDTO) throws Exception {
		return managerDAO.profitPerMainCategory(profitDTO);
	}
	
	@Override
	public List<ProfitDTO> profitPerSubCategory(ProfitDTO profitDTO) throws Exception {
		return managerDAO.profitPerSubCategory(profitDTO);
	}
	
	@Override
	public List<ManSellListDTO> sellProfitList(ProfitDTO profitDTO) throws SQLException {
		return managerDAO.sellProfitList(profitDTO);
	}
	
	@Override
	public String managerIdCheck(String id) throws SQLException {
		return managerDAO.managerIdCheck(id);
	}

	@Override
	public String managerStoreCodeCheck(String storecode) throws SQLException {
		return managerDAO.managerStoreCodeCheck(storecode);
	}

	@Override
	public String storeCodeRegisteredCheck(String storecode) throws SQLException{
		return managerDAO.storeCodeRegisteredCheck(storecode);
	}
	
	/*
	 * 작성자: 김수빈
	 * 작성일자: 2021/05/25 10:54
	 * memberDTO 이용해서 manager의 no 리턴하기
	 */
	@Override
	public long getManagerNoFromMember(MemberDTO memberDTO) throws Exception {
		try {
			return managerDAO.getManagerNoFromMember(memberDTO);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

}

