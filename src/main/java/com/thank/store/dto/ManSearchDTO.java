package com.thank.store.dto;

import lombok.Data;

@Data
public class ManSearchDTO {
	private long cvstore_no;
	private String searchCondition;
	private String searchKeyword;
	private ManPagingDTO pagingDTO;
}
