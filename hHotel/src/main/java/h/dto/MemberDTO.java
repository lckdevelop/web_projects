package h.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private long no;
	private String loginId;
	private String loginPassword;
	private String name;
	private String birthdate;
	private String country;
	private String tel;
	private String email;
	private char admin;
	
	/*
	 * public void setPassword(String loginPassword) { // 비밀번호 암호화
	 * this.loginPassword = DigestUtils.sha3_512Hex(loginPassword); }
	 */
}
