package com.thank.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ManSellListDTO {
	private String productcode;
	private String name;
	private String maincategory;
	private String subcategory;
	private long price;
	private long enrolledprice;
	private long enrolledlefttime;
	private String sellday;
}
