package com.thank.store.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작성자 : 방지훈
//작성일자 : 05/24 16:26
@Getter
@Setter
@ToString
public class PurchaseListDTO {
	private long no;
	private long customerno;
	private String productcode;
	private String name;
	private String brand;
	private String cvstorename;
	private long purchaseprice;
	private long price;
	private long discountprice; //할인받은가격
	private long cvstoreproductno;
	private String maincategory;
	private String subcategory;
	private Date expirationdate;
	private Date warehousingdate;
	private Date purchasedate;
	private long countTime;
	
}
