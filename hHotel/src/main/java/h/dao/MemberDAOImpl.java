package h.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import h.dto.MemberDTO;
import oracle.jdbc.internal.OracleTypes;

public class MemberDAOImpl implements MemberDAO {
	private DataSource dataSource;
	private static final MemberDAOImpl memberDAO = new MemberDAOImpl();
	
	private MemberDAOImpl() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/hHotel");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	@Override
	public void insertMember(MemberDTO mDTO) throws Exception {
		String sql = "{ call insert_member(?, ?, ?, ?, ?, ?, ?) }";

		try (Connection con = dataSource.getConnection();
			 CallableStatement cstmt = con.prepareCall(sql)){
			cstmt.setString(1, mDTO.getLoginId());
			cstmt.setString(2, mDTO.getLoginPassword());
			cstmt.setString(3, mDTO.getEmail());
			cstmt.setString(4, mDTO.getCountry());
			cstmt.setString(5, mDTO.getName());
			cstmt.setString(6, mDTO.getBirthdate());
			cstmt.setString(7, mDTO.getTel());
			
			cstmt.executeUpdate();
		}
	}

	@Override
	public boolean loginCheck(MemberDTO mDTO) throws Exception {
		String sql = "{ ? = call select_member_check(?, ?) }";

		try (Connection con = dataSource.getConnection(); CallableStatement cstmt = con.prepareCall(sql)) {
			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.setString(2, mDTO.getLoginId());
			cstmt.setString(3, mDTO.getLoginPassword());

			cstmt.executeQuery();

			if (cstmt.getInt(1) != -1)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.getMessage();
		}
		return false;
	}
	
	@Override
	public long getMemberId(String member_id) throws Exception {
		String sql = "{ ? = call select_member_session(?) }";
		long id = 0;
		
		try (Connection con = dataSource.getConnection();
			 CallableStatement cstmt = con.prepareCall(sql)){
			cstmt.registerOutParameter(1, Types.BIGINT);
			cstmt.setString(2, member_id);
			
			cstmt.executeQuery();
			if (cstmt.getLong(1) != -1) {
				id = cstmt.getLong(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

}
