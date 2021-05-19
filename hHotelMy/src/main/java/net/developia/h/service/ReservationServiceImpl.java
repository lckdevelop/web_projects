package net.developia.h.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.developia.h.model.MemberReservationDTO;
import net.developia.h.model.ReservationDAO;
import net.developia.h.model.ResvCalendarDTO;
import net.developia.h.model.RoomDTO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDAO reservationDAO;
	
	@Override
	public List<RoomDTO> getResvAvaiList(ResvCalendarDTO resvCalendarDTO) throws Exception {
		return reservationDAO.getResvAvaiList(resvCalendarDTO);
	}

	@Override
	public RoomDTO getResvDetial(long id) throws Exception {
		return reservationDAO.getResvDetial(id);
	}

	@Override
	public void insetReservation(ResvCalendarDTO resvCalendarDTO) throws Exception {
		reservationDAO.insetReservation(resvCalendarDTO);
		
	}

	@Override
	public void updateStatus(long id) throws Exception {
		reservationDAO.updateStatus(id);
	}

	@Override
	public List<MemberReservationDTO> getMemResvList(long memberId) throws Exception {
		return reservationDAO.getMemResvList(memberId);
	}

	@Override
	public void deleteResv(long id) throws Exception {
		reservationDAO.deleteResv(id);
	}
}
