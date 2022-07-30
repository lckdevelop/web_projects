package net.developia.h.model;

import java.util.List;

public interface ReservationDAO {
	List<RoomDTO> getResvAvaiList(ResvCalendarDTO resvCalendarDTO) throws Exception;
	List<MemberReservationDTO> getMemResvList(long memberId) throws Exception;
	RoomDTO getResvDetial(long id) throws Exception;
	void insetReservation(ResvCalendarDTO resvCalendarDTO) throws Exception;
	void updateStatus(long id) throws Exception;
	void deleteResv(long id) throws Exception;
}
