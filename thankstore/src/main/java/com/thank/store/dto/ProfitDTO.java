package com.thank.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
	private String subCategory;
}
