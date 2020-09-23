package com.chaeky.jpashop.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter @Setter
public class Admin {
	@Id @GeneratedValue
	@Column(name = "admin_id")
	private Long id;
	
	private String name;
	private String Longinid;
	private String loginpswd;
}
