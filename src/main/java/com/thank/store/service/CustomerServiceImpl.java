package com.thank.store.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.CustomerDAO;
import com.thank.store.dao.MapDAO;
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
	
	@Autowired
	private MapDAO mapDAO;

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
			log.info("불러온 상품 개수 : "+cvsProductList.size());
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
	
	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/27 19:21
	*/
	@Override
	public CvsProductDTO getOneCvsProduct(long no) throws Exception {
		CvsProductDTO cvsProductDTO =  customerDAO.getOneCvsProduct(no);
		long countTime = (cvsProductDTO.getCountTime());
		int discountRate = getDiscountRate(countTime);
		cvsProductDTO.setDiscountRate(discountRate);
		cvsProductDTO.setDiscountPrice(getDiscountPrice(cvsProductDTO.getPrice(), discountRate));
		return cvsProductDTO;
	}
	
	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/28 00:00
	*/
	@Override
	public long updateCustomerPoint(CustomerDTO customerDTO) throws Exception {
		return customerDAO.updateCustomerPoint(customerDTO);
	}
	
	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/28 00:10
	*/
	@Override
	public long addPurchaseProduct(CustomerDTO customerDTO) throws Exception {
		return customerDAO.addPurchaseProduct(customerDTO);
	}
	
	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/28 00:16
	*/
	@Override
	public long updatePurchaseProduct(CvsProductDTO cvsProductDTO) throws Exception {
		return customerDAO.updatePurchaseProduct(cvsProductDTO);
	}
	
	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/28 00:21
	*/
	@Override
	public long updateCvstorePoint(CvsProductDTO cvsProductDTO) throws Exception {
		return customerDAO.updateCvstorePoint(cvsProductDTO);
	}
	
	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/30 15:41
	*/
	@Override
	public long getEndPurchaseCount(long no) throws Exception {
		return customerDAO.getEndPurchaseCount(no);
	}
	
	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/30 15:44
	*/
	@Override
	public List<PurchaseListDTO> getEndPurchaseList(CusSearchDTO searchDTO) throws Exception {
		return customerDAO.getEndPurchaseList(searchDTO);
	}

	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/30 17:51
	*/
	@Override
	public long getTotalPurchaseCount(long no) throws Exception {
		return customerDAO.getTotalPurchaseCount(no);
	}

	/*
	 * 작성자 : 방지훈
	 * 작성일자 : 05/30 17:52
	*/
	@Override
	public List<PurchaseListDTO> getTotalPurchaseList(CusSearchDTO searchDTO) throws Exception {
		return customerDAO.getTotalPurchaseList(searchDTO);
	}

	@Override
	public String customerIdCheck(String id) {
		return customerDAO.customerIdCheck(id);
	}

	/*
	 * 작성자 : 이효범
	 * 작성일자 : 05/31 14:04
	*/
	@Override
	public CvstoreDTO searchCvstoreListMap(HashMap<String, String> storecode) throws Exception {
		CvstoreDTO cvstore = mapDAO.searchCvstoreListMap(storecode);
		List<CvsProductDTO> cvsProductList =mapDAO.searchCvsProductListMap(cvstore);
		log.info("불러온 상품 개수 : "+cvsProductList.size());
		for (CvsProductDTO cvsProductDTO : cvsProductList) {
			long countTime = (cvsProductDTO.getCountTime());
			int discountRate = getDiscountRate(countTime);
			cvsProductDTO.setDiscountRate(discountRate);
			cvsProductDTO.setDiscountPrice(getDiscountPrice(cvsProductDTO.getPrice(), discountRate));
		}
		cvstore.setCvsProductList(cvsProductList);
		
		return cvstore;	
	}
}
