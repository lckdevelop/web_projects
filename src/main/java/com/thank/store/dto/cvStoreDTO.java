package com.thank.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



/*
 * 작성자 : 이효범
 * 작성일자 : 0524
 * 작성이유 : cvstore데이터 사용위해
 */
@Getter
@Setter
@ToString
public class cvStoreDTO {

	private String storecode;
	private String name;
	private double latitude;
	private double longitude;
	private String address;
	private String brand;
}
