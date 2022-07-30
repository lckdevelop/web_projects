package com.chaeky.jpashop.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Getter;
import lombok.Setter;



@Entity
@Getter @Setter
public class Member {
	@Id @GeneratedValue // id값은 자동으로 값을 넣어준다.
	@Column(name = "member_id") // id명 지정 table명의 언더바 id 이런걸 선호한다.
	private Long id;
	
	private String name;
	
	@Embedded 
	// address같은 경우는 별도의 table을 만들고 싶지는 않고 Address라는 타입을 지정해 주고 싶기 때문에
	// 클래스로만 만들고 테이블은 생성하기 싫을 때 Embeddable을 사용한다.
	private Address address;
	
	// mappedBy:연관관계의 거울
	@OneToMany(mappedBy = "member") // order 테이블에 있는 member필드에의해서 매핑된것이다.(읽기 전용이 되는것이다.)
	private List<Order> orders = new ArrayList<>();
}

