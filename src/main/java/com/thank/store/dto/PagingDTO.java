package com.thank.store.dto;

import lombok.Data;

@Data
public class PagingDTO {
	private long pg;
	private int pageSize = 3;	
	private long startNum;
	private long endNum;
	private int pageBlock = 3;
	private long startPage;
	private long endPage;
	private long recordCount;
	private long totalPage;
	
	public PagingDTO() {
		
	}
	
	public PagingDTO(long pg) {
		this.pg = pg;
		this.startNum = (pg - 1) * pageSize + 1;
		this.endNum = pageSize * pg;
	}
	
	public PagingDTO(ManSearchDTO searchDTO, long pg) {
		this.pg = pg;
		this.startNum = (pg - 1) * pageSize + 1;
		this.endNum = pageSize * pg;
	}

	public PagingDTO(CusSearchDTO searchDTO, long pg) {
		this.pg = pg;
		this.startNum = (pg - 1) * pageSize + 1;
		this.endNum = pageSize * pg;
	}
	
	public PagingDTO(long pg, long recordCount) {
		this.pg = pg;
		this.startNum = (pg - 1) * pageSize + 1;//방지훈 추가
		this.endNum = pageSize * pg;//방지훈 추가
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
