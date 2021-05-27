package com.thank.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//작성자 : 이효범
//작성일자 : 05/27 00:50
@Getter
@Setter
@ToString
public class ProductListDTO {

	private String name;
	private String imgurl;
	private long price;
	private String storecode;
}
