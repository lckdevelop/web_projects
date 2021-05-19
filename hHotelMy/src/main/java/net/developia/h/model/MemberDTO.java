package net.developia.h.model;

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
}
