package h.dao;

import java.util.List;

import h.dto.MemberReservationDTO;
import h.dto.RoomDTO;

public interface ReservationDAO {
	List<RoomDTO> getResvAvaiList(String strDaate, String endDate) throws Exception;
	List<MemberReservationDTO> getMemResvList(long memberId) throws Exception;
	RoomDTO getResvDetial(long id) throws Exception;
	void insetReservation(long id, String strdate, String enddate, long memberId) throws Exception;
	void updateStatus(long id) throws Exception;
	void deleteResv(long id) throws Exception;
}
