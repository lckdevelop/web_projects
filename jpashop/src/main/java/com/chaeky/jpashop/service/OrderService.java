package com.chaeky.jpashop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaeky.jpashop.domain.Delivery;
import com.chaeky.jpashop.domain.Item;
import com.chaeky.jpashop.domain.Member;
import com.chaeky.jpashop.domain.Order;
import com.chaeky.jpashop.domain.OrderItem;
import com.chaeky.jpashop.repository.ItemRepository;
import com.chaeky.jpashop.repository.MemberRepository;
import com.chaeky.jpashop.repository.OrderRepository;
import com.chaeky.jpashop.repository.OrderSearch;
import com.chaeky.jpashop.repository.PagingOrderRepo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class OrderService {
	private final OrderRepository orderRepository;
	private final MemberRepository memberRepository;
	private final ItemRepository itemRepository;
	private final PagingOrderRepo pagingOrderRepo;
	
	/**
	 * 주문
	 */
	@Transactional
	// 각각 입력한 값의 id값만을 가져온다.
	public Long order(Long memberId, Long itemId, int count) {
		//entity조회
		Member member = memberRepository.findOne(memberId);
		Item item = itemRepository.findOne(itemId);
		
		//배송정보 조회(회원의 주소값으로 배송할 것 이다.)
		Delivery delivery = new Delivery();
		delivery.setAddress(member.getAddress());
		
		//주문상품 생성
		OrderItem orderItem = OrderItem.createOrderItem(item, item.getPrice(), count);
		
		//주문 생성
		Order order = Order.createOrder(member, delivery, orderItem);

		//주문 저장
		// cascade로 인해 orderItem이랑 deliever가 자동으로 persist가 되었다.
		orderRepository.save(order);
		
		return order.getId();
	}
	/**
	 * 취소
	 */
	@Transactional
	// 취소할 때 id값만 넘어온다.
	public void cancelOrder(Long orderId) {
		//주문 entity 조회
		Order order = orderRepository.findOne(orderId);
		//주문 취소
		order.cancel();
	}
	//검색
	public List<Order> findOrders(OrderSearch orderSearch) {
		return orderRepository.findAllByString(orderSearch);
	}
	
	//페이징처리 주문 전체 조회
	public Page<Order> findAll(Pageable pageable) {
		int page = (pageable.getPageNumber() == 0) ? 0 : (pageable.getPageNumber() - 1); // page는 index 처럼 0부터 시작
		pageable = PageRequest.of(page, 10, Sort.by("id").descending()); // 페이지는 10개씩 보인다, id에 의해 정렬해서 보인다.

		// 페이징처릴를위한 인터페이스 itemRepo
		return pagingOrderRepo.findAll(pageable);
	}
}
