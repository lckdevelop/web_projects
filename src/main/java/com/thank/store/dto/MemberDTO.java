package com.thank.store.dto;

import org.apache.commons.codec.digest.DigestUtils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	private long no;
	private String id;
	private String password;
	private String name;
	private String accountno;
	private int accountType; // **0 = member **  ** 1= manager **
	
	//이거 하면 안되는건가?
	public void setPassword(String password) {
		this.password = DigestUtils.sha512Hex(password);
	}
}
