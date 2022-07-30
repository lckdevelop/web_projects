package com.chaeky.jpashop.domain;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orders") //table명을 지정해주지않으면 클래스명이 table명이된다.
@Getter @Setter
public class Order {
	@Id @GeneratedValue
	@Column(name = "order_id")
	private Long id;
	
	// 연관관계의 주인(어떤 값을 변경하면 외래키가 같이 변하게끔)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id") //외래키 지정 
	private Member member; // 주문 회원
	
	// OrderItem과 일대다관계  mappedBy:연관관계의 거울(OrderItem의 order필드랑 연관관계)
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL) 
	private List<OrderItem> orderItems = new ArrayList<>(); 
	
	//Delivery오 일대일 관계 여기서 연관관계의 주인이다(일대일에서는 접근이 많은쪽에 될 수있으면 외래키를 둔다)
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "delivery_id")
	private Delivery delivery; // 배송정보
	
	// 자바8에 있는 타입
	private LocalDateTime orderDate; // 주문시간
	
	@Enumerated(EnumType.STRING)
	private OrderStatus status; // 주문상태 [ORDER, CANCEL]
	
	// ==연관관계 메서드== //
	// 양방향 연관관계일때 지정해주면 하나의 코드로 해결할 수 있다.
	public void setMember(Member member) {
		this.member = member;
		member.getOrders().add(this);
	}

	public void addOrderItem(OrderItem orderItem) {
		orderItems.add(orderItem);
		orderItem.setOrder(this);
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
		delivery.setOrder(this);
	}
	
	// == 생성 메서드 == //
	// 매개변수에 있는 OrderItem... orderItems 문법은 여러개를 받겠다는 뜻이다.
	public static Order createOrder(Member member, Delivery delivery, OrderItem... orderItems) {
		Order order = new Order();
		order.setMember(member);
		order.setDelivery(delivery);

		for (OrderItem orderItem : orderItems) {
			order.addOrderItem(orderItem);
		}
		order.setStatus(OrderStatus.ORDER);
		order.setOrderDate(LocalDateTime.now());

		return order;
	}

	// ==비즈니스 로직==//
	/**
	 * 주문 취소
	 */
	public void cancel() {
		if (delivery.getStatus() == DeliveryStatus.COMP) {
			throw new IllegalStateException("이미 출고완료된 상품은 취소가 불가능합니다.");
		}

		this.setStatus(OrderStatus.CANCEL);

		for (OrderItem orderItem : orderItems) {
			orderItem.cancel();
		}
	}

	// ==조회 로직==/
	/**
	 * 전체 주문 가격 조회
	 */
	public int getTotalPrice() {
		int totalPrice = 0;
		for (OrderItem orderItem : orderItems) {
			totalPrice += orderItem.getTotalPrice();
		}
		return totalPrice;
	}
}

