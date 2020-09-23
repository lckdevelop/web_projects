package com.chaeky.jpashop;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.chaeky.jpashop.domain.Address;
import com.chaeky.jpashop.domain.Member;
import com.chaeky.jpashop.domain.Order;
import com.chaeky.jpashop.domain.OrderStatus;
import com.chaeky.jpashop.domain.item.Book;
import com.chaeky.jpashop.exception.NotEnoughStockException;
import com.chaeky.jpashop.repository.OrderRepository;
import com.chaeky.jpashop.service.OrderService;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class OrderServiceTest {
	@Autowired EntityManager em;
	@Autowired OrderService orderService;
	@Autowired OrderRepository orderRepository;
	
	@Test
	public void 상품주문() throws Exception {
		//given
		Member member = createMember(); //extract method 적용
		
		Book book = createBook(); //extract method 적용
		
		int orderCount = 2;

		//when
		Long orderId = orderService.order(member.getId(), book.getId(), orderCount);
		
		//then
		Order getOrder = orderRepository.findOne(orderId);
		
		assertEquals("상품 주문시 상태는 ORDER", OrderStatus.ORDER, getOrder.getStatus());
		assertEquals("주문이 취소된 상품은 그만큼 재고가 증가해야 한다.", 8, book.getStockQuantity());
	}

	private Book createBook() {
		Book book = new Book();
		book.setName("시골 JPA");
		book.setPrice(10000);
		book.setStockQuantity(10);
		em.persist(book);
		return book;
	}

	private Member createMember() {
		Member member = new Member();
		member.setName("회원1");
		member.setAddress(new Address("서울", "경기", "123-123"));
		em.persist(member);
		return member;
	}
	
	@Test(expected = NotEnoughStockException.class)
	public void 상품주문_재고수량() throws Exception {
		//given
		Member member = createMember(); //extract method 적용
		
		Book book = createBook(); //extract method 적용
		//when
		
		//then
	}
}

