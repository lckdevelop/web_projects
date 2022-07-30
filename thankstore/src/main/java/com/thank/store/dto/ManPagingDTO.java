package com.thank.store.dto;

import lombok.Data;

@Data
public class ManPagingDTO {
	private long pg;
	private int pageSize = 5;	
	private long startNum;
	private long endNum;
	private int pageBlock = 5;
	private long startPage;
	private long endPage;
	private long recordCount;
	private long totalPage;
	
	public ManPagingDTO() {
		
	}
	
	public ManPagingDTO(long pg) {
		this.pg = pg;
		this.startNum = (pg - 1) * pageSize + 1;
		this.endNum = pageSize * pg;
	}
	
	public ManPagingDTO(ManSearchDTO searchDTO, long pg) {
		this.pg = pg;
		this.startNum = (pg - 1) * pageSize + 1;
		this.endNum = pageSize * pg;
	}

	public ManPagingDTO(long pg, long recordCount) {
		this.pg = pg;
		this.startPage = (pg - 1)/pageBlock*pageBlock + 1;
		this.endPage = (pg - 1)/pageBlock*pageBlock + pageBlock;
		this.totalPage = recordCount / pageSize;
		this.recordCount = recordCount;
		
		if (recordCount % pageSize > 0){
			totalPage++;
		}
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
