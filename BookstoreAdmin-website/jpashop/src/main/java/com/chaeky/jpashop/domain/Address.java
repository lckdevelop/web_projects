package com.chaeky.jpashop.domain;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.Embeddable;

@Embeddable
// 주소라는 하나의 객체를 만들고 하나의 객체를 레퍼런스함으로써 조금더 객체지향적으로 엔티티를 매핑하는 방법
// db에 테이블을 생성하지 않는다.
@Getter 
public class Address {
	private String city;
	private String street;
	private String zipcode;

	protected Address() {
	}

	public Address(String city, String street, String zipcode) {
		this.city = city;
		this.street = street;
		this.zipcode = zipcode;
	}
}
