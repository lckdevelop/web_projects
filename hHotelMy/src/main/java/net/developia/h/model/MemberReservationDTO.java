package net.developia.h.model;

import lombok.Data;

@Data
public class MemberReservationDTO {
	private long id;
	private long roomid;
	private String strdate;
	private String enddate;
	private String kinds;
	private long roomNo;
	private long pcapacity;
	private long areasize;
	private long floor;
	private String prospect;
	private int wifi;
}
