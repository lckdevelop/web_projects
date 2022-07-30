package net.developia.h.service;

import java.util.List;

import net.developia.h.model.MemberReservationDTO;
import net.developia.h.model.ResvCalendarDTO;
import net.developia.h.model.RoomDTO;

public interface ReservationService {
	List<RoomDTO> getResvAvaiList(ResvCalendarDTO resvCalendarDTO) throws Exception;
	List<MemberReservationDTO> getMemResvList(long memberId) throws Exception;
	RoomDTO getResvDetial(long id) throws Exception;
	void insetReservation(ResvCalendarDTO resvCalendarDTO) throws Exception;
	void updateStatus(long id) throws Exception;
	void deleteResv(long id) throws Exception;
}
