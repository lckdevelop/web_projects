package com.thank.store.dto;

import lombok.Data;

@Data
public class ChartDTO {
	private long customerno;
	private long cvsproductno;
	private String productcode;
	private String name;
	private long enrolledprice;
	private long cntPerCategory;
	private String mainCategory;
	private long cntPerBrand;
	private String brand;
}
