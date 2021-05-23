package com.thank.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CvsProductDTO {
	private long no;
	private String productcode;
	private String name;
	private String maincategory;
	private String subcategory;
	private long price;
	private int productperiod; // 바꿔야 함
}
