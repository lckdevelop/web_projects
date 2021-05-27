package com.thank.store.dto;

import lombok.Data;

@Data
public class CusSearchDTO {
	private long cvstore_no;
	private long customer_no;
	private String mainCategory;
	private String subCategory;
	private String searchKeyword;
	private PagingDTO pagingDTO;
}
