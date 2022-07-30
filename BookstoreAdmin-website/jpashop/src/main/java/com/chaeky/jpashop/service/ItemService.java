package com.chaeky.jpashop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaeky.jpashop.domain.Item;
import com.chaeky.jpashop.domain.item.Book;
import com.chaeky.jpashop.repository.PagingItemRepo;
import com.chaeky.jpashop.repository.ItemRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ItemService {
	private final ItemRepository itemRepository;
	private final PagingItemRepo pagingItemRepo;
	
	@Transactional
	public void saveItem(Item item) {
		itemRepository.save(item);
	}
	
	// 변경감지방법 사용
	@Transactional
	public Item updateItem(Long itemId, String name, int price, int stockQuantity) {
		Item findItem = itemRepository.findOne(itemId);
		// 도메인의 비즈니스로직(무분별한 setter를 피하기위해)
		findItem.change(name, price, stockQuantity);
		
		return findItem;
	}
	
	public List<Item> findItems() {
		return itemRepository.findAll();
	}

	public Page<Item> findAll(Pageable pageable) {
		// page는 index 처럼 0부터 시작
		int page = (pageable.getPageNumber() == 0) ? 0 : (pageable.getPageNumber() - 1);
		// 페이지는 10개씩 보인다, id에 의해 내림차순정렬해서 보인다.
		pageable = PageRequest.of(page, 10, Sort.by("id").descending()); 
		
		// 페이징처리를위한 인터페이스 itemRepo 호출
		return pagingItemRepo.findAll(pageable);
	}
	
	public Item findOne(Long itemId) {
		return itemRepository.findOne(itemId);
	}
}
