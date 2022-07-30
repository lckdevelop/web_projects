package h.service;

import java.util.List;

import h.dao.ReservationDAO;
import h.dao.ReservationDAOImpl;
import h.dto.MemberReservationDTO;
import h.dto.ReservationDTO;
import h.dto.RoomDTO;

public class ReservationServiceImpl implements ReservationService {
	private static final ReservationService reservationService = new ReservationServiceImpl();
	private ReservationDAO reservationDAO = ReservationDAOImpl.getInstance();
	
	private ReservationServiceImpl() {
		
	}
	
	public static ReservationService getInstance() {
		return reservationService;
	}
	
	@Override
	public List<RoomDTO> getResvAvaiList(String strDaate, String endDate) throws Exception {
		return reservationDAO.getResvAvaiList(strDaate, endDate);
	}

	@Override
	public RoomDTO getResvDetial(long id) throws Exception {
		return reservationDAO.getResvDetial(id);
	}

	@Override
	public void insetReservation(long id, String strdate, String enddate, long memberId) throws Exception {
		reservationDAO.insetReservation(id, strdate, enddate, memberId);
		
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
