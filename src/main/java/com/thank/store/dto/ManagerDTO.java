package com.thank.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ManagerDTO {
	private long managerno;
	private long cvsno;
	private String name;
	private String spot;
	private String brand;
	private String storecode;
	private long profit;
}
