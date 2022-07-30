package com.chaeky.jpashop.controller;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BookForm {
	//item의 공통적 필드
	private Long id;

	private String name;
	private int price;
	private int stockQuantity;
	// book의 독자적 필드
	private String author;
	private String isbn;
}