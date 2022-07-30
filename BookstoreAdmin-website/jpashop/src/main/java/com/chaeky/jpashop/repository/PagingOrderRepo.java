package com.chaeky.jpashop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chaeky.jpashop.domain.Order;

public interface PagingOrderRepo extends JpaRepository<Order, Long>{

}
