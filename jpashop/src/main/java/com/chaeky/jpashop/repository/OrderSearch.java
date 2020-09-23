package com.chaeky.jpashop.repository;

import com.chaeky.jpashop.domain.OrderStatus;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OrderSearch {
	private String memberName; 
	private OrderStatus orderStatus; // 주문 상태(ORDER, CANCEL)
}
