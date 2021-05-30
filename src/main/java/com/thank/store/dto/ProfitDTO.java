package com.thank.store.dto;

import lombok.Data;

@Data
public class ProfitDTO {
	private long cvstoreno;
	private String searchYear;
	private long cvsProductNo;
	private String productcode;
	private String name;
	private long enrolledprice;
	private String sellday;
	private String month;
	private long profitpermonth;
	private long cntPerCategory;
	private String mainCategory;
}
