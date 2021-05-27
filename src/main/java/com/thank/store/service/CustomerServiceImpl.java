package com.thank.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.CustomerDAO;
import com.thank.store.dto.CusSearchDTO;
import com.thank.store.dto.CustomerDTO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.CvstoreDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;
import com.thank.store.dto.PagingDTO;
import com.thank.store.dto.PurchaseListDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerDAO customerDAO;

	@Override
	public CustomerDTO getCustomerInfo(long no) throws Exception {
		return customerDAO.getCustomerInfo(no);
	}

	@Override
	public long getPurchaseCount(long no) throws Exception {
		return customerDAO.getPurchaseCount(no);
	}
	
	
	//작성자 : 방지훈
	//작성일자 : 05/26 23:00
	@Override
	public List<CvstoreDTO> searchCvstoreList(CusSearchDTO searchDTO) throws Exception {
		List<CvstoreDTO> cvstoreList = customerDAO.searchCvstoreList(searchDTO);
		for(CvstoreDTO cvstore:cvstoreList) {
			searchDTO.setCvstore_no(cvstore.getNo());
			List<CvsProductDTO> cvsProductList =customerDAO.searchCvsProductList(searchDTO);
			for (CvsProductDTO cvsProductDTO : cvsProductList) {
				long countTime = (cvsProductDTO.getCountTime());
				int discountRate = getDiscountRate(countTime);
				cvsProductDTO.setDiscountRate(discountRate);
				cvsProductDTO.setDiscountPrice(getDiscountPrice(cvsProductDTO.getPrice(), discountRate));
			}
			cvstore.setCvsProductList(cvsProductList);
		}
		return cvstoreList;
	}

	//작성자 : 방지훈
	//작성일자 : 05/24 18:36
	@Override
	public long rechargePoint(CustomerDTO customerDTO) throws Exception {
		return customerDAO.rechargePoint(customerDTO);
		
	}
	
	//작성자 : 방지훈
	//작성일자 : 05/25 23:20
	@Override
	public List<String> getSubCategory(CusSearchDTO searchDTO) throws Exception {
		return customerDAO.getSubCategory(searchDTO);
	}
	
	
	public long getDiscountPrice(long price, int discountRate) throws Exception {
		long discountPrice = price * (100 - discountRate) / 100;
		
		return discountPrice;
	}

	//작성자 : 방지훈
	//작성일자 : 05/26 23:20
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
	
	//작성자 : 방지훈
	//작성일자 : 05/26 23:20
	@Override
	public long getTotalRecord(CusSearchDTO searchDTO) throws Exception {
		return customerDAO.getTotalRecord(searchDTO);
	}

	//작성자 : 방지훈
	//작성일자 : 05/27 10:20
	@Override
	public List<PurchaseListDTO> getPurchaseList(CusSearchDTO searchDTO) throws Exception {
		return customerDAO.getPurchaseList(searchDTO);
	}
}
