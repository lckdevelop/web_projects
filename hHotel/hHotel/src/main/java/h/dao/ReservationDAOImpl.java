package h.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import h.dto.MemberReservationDTO;
import h.dto.RoomDTO;
import oracle.jdbc.internal.OracleTypes;

public class ReservationDAOImpl implements ReservationDAO {
	private DataSource dataSource;
	private static final ReservationDAOImpl rDAO = new ReservationDAOImpl();
	
	private ReservationDAOImpl() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/hHotel");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ReservationDAO getInstance() {
		return rDAO;
	}
	
	@Override
	public List<RoomDTO> getResvAvaiList(String strDaate, String endDate) {
		String sql = "{call select_resv_avai(?, ?, ?)}";
		List<RoomDTO> AvailList = new ArrayList<>();
		
		try (Connection con = dataSource.getConnection();
			 CallableStatement cstmt = con.prepareCall(sql)){
			cstmt.setString(1, strDaate);
			cstmt.setString(2, endDate);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			
			cstmt.executeQuery();
			try (ResultSet rs = (ResultSet) cstmt.getObject(3)) {
				while (rs.next()) {
					RoomDTO rDTO = new RoomDTO();
					rDTO.setId(rs.getLong("id"));
					rDTO.setKinds(rs.getString("kinds"));
					rDTO.setRoomNo(rs.getLong("roomno"));
					rDTO.setPcapacity(rs.getLong("pcapacity"));
					rDTO.setAreasize(rs.getLong("areasize"));
					rDTO.setFloor(rs.getLong("floor"));
					rDTO.setProspect(rs.getString("prospect"));
					rDTO.setWifi(rs.getInt("wifi"));

					AvailList.add(rDTO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AvailList;
	}

	@Override
	public RoomDTO getResvDetial(long id) throws Exception {
		String sql = "{call select_resv_detail(?, ?)}";
		RoomDTO rmDTO = new RoomDTO();
		
		try (Connection con = dataSource.getConnection();
			 CallableStatement cstmt = con.prepareCall(sql)){
			cstmt.setLong(1, id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			cstmt.executeQuery();
			try (ResultSet rs = (ResultSet) cstmt.getObject(2)) {
				if (rs.next()) {
					rmDTO.setId(rs.getLong("id"));
					rmDTO.setKinds(rs.getString("kinds"));
					rmDTO.setRoomNo(rs.getLong("roomno"));
					rmDTO.setPcapacity(rs.getLong("pcapacity"));
					rmDTO.setAreasize(rs.getLong("areasize"));
					rmDTO.setFloor(rs.getLong("floor"));
					rmDTO.setProspect(rs.getString("prospect"));
					rmDTO.setWifi(rs.getInt("wifi"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rmDTO;
	}

	@Override
	public void insetReservation(long id, String strdate, String enddate, long memberId) throws Exception {
		String sql = "{ call insert_resv(?, ?, ?, ?) }";

		try (Connection con = dataSource.getConnection();
			 CallableStatement cstmt = con.prepareCall(sql)){
			cstmt.setLong(1, id);
			cstmt.setString(2, strdate);
			cstmt.setString(3, enddate);
			cstmt.setLong(4, memberId);
			
			cstmt.executeUpdate();
		}
		
	}

	@Override
	public void updateStatus(long id) throws Exception {
		String sql = "{ call update_room_status(?) }";

		try (Connection con = dataSource.getConnection();
			 CallableStatement cstmt = con.prepareCall(sql)){
			cstmt.setLong(1, id);
			
			cstmt.executeUpdate();
		}
		
	}

	@Override
	public List<MemberReservationDTO> getMemResvList(long memberId) throws Exception {
		String sql = "{call select_resv_by_memid(?, ?)}";
		List<MemberReservationDTO> myResvList = new ArrayList<>();
		
		try (Connection con = dataSource.getConnection();
			 CallableStatement cstmt = con.prepareCall(sql)){
			cstmt.setLong(1, memberId);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			cstmt.executeQuery();
			try (ResultSet rs = (ResultSet) cstmt.getObject(2)) {
				while (rs.next()) {
					MemberReservationDTO mrDTO = new MemberReservationDTO();
					
					mrDTO.setId(rs.getLong("id"));
					mrDTO.setRoomid(rs.getLong("roomid"));
					mrDTO.setStrdate(rs.getString("strdate"));
					mrDTO.setEnddate(rs.getString("enddate"));
					mrDTO.setKinds(rs.getString("kinds"));
					mrDTO.setRoomNo(rs.getLong("roomno"));
					mrDTO.setPcapacity(rs.getLong("pcapacity"));
					mrDTO.setAreasize(rs.getLong("areasize"));
					mrDTO.setFloor(rs.getLong("floor"));
					mrDTO.setProspect(rs.getString("prospect"));
					mrDTO.setWifi(rs.getInt("wifi"));
					
					myResvList.add(mrDTO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myResvList;
	}

	@Override
	public void deleteResv(long id) throws Exception {
		String sql = "{ call delete_resv(?) }";

		try (Connection con = dataSource.getConnection();
			 CallableStatement cstmt = con.prepareCall(sql)){
			cstmt.setLong(1, id);
			
			cstmt.executeUpdate();
		}
		
	}
}
