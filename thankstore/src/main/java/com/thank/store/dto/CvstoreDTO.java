package com.thank.store.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작성자 : 방지훈
//작성일자 : 05/25 10:14
// 
@Getter
@Setter
@ToString
public class CvstoreDTO {
	private long no;
	private String name;
	private String storecode;
	private double latitude;
	private double longitude;
	private String address;
	private String brand;
	private long member_no;
	private long manager_no;
	private String InfoContent;
	private String latlng;
	private double distance;
	private long endNo;
	private List<CvsProductDTO> cvsProductList;
}