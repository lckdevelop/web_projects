package com.thank.store.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CvsProductDTO {
	private long no;
	private long managerno; 
	private long cvstoreno; 
	private String productcode;
	private String name;
	private String maincategory;
	private String subcategory;
	private long price;
	private long enrollment;
	private Date expirationdate;
	private Date warehousingdate;
	private long leftDay;
	private long leftTime;
	private long countTime;
	private long discountPrice;
	private int discountRate;
	private long enrolledprice;
	private long enrolledlefttime;
	private String from;
}
