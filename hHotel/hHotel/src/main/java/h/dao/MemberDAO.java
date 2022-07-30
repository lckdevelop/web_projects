package h.dao;

import java.util.List;

import h.dto.MemberDTO;
import h.dto.ReservationDTO;

public interface MemberDAO {
	void insertMember(MemberDTO mDTO) throws Exception;
	boolean loginCheck(MemberDTO mDTO) throws Exception;
	long getMemberId(String member_id) throws Exception;
}
