package net.developia.h.model;

import lombok.Data;

@Data
public class ResvCalendarDTO {
	private long roomId;
	private String checkIn;
	private String checkOut;
	private long memberId;
}
