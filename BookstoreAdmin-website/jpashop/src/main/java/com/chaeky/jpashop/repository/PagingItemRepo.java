package com.chaeky.jpashop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chaeky.jpashop.domain.Item;

public interface PagingItemRepo extends JpaRepository<Item, Long> {
	
}


