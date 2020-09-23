package com.chaeky.jpashop.repository;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.chaeky.jpashop.domain.Item;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ItemRepository {
	
	private final EntityManager em;
	
	// persist는 새로등록 merge는 update라고 일단 개념을 이해하자
	public void save(Item item) {
		if (item.getId() == null) {
			em.persist(item); // 신규등록
		} else {
			em.merge(item); // db에 언젠가 한번 등록된적이 있다.(update같은 개념)
		}
	}
	
	public Item findOne(Long id) {
		return em.find(Item.class, id);
	}
	
	public List<Item> findAll() {
		return em.createQuery("select i from Item i", Item.class).getResultList();
	}

}
