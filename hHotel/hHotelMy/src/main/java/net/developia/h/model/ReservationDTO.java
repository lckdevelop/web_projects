package net.developia.h.model;

import lombok.Data;

@Data
public class ReservationDTO {
	private long id;
	private long roomid;
	private String strdate;
	private String enddate;
}
