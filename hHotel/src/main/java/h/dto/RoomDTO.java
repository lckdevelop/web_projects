package h.dto;

import lombok.Data;

@Data
public class RoomDTO {
	private long id;
	private String kinds;
	private long roomNo;
	private long pcapacity;
	private long areasize;
	private long floor;
	private String prospect;
	private int wifi;
	private int status;
}
