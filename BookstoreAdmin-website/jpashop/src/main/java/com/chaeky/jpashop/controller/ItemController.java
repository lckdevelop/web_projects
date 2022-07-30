package com.chaeky.jpashop.controller;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chaeky.jpashop.domain.Item;
import com.chaeky.jpashop.domain.item.Book;
import com.chaeky.jpashop.service.ItemService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ItemController {
	private final ItemService itemService;

	@GetMapping(value = "/items/new")
	public String createForm(Model model) {
		model.addAttribute("form", new BookForm());
		return "items/createItemForm";
	}

	@PostMapping(value = "/items/new")
	public String create(BookForm form) {
		Book book = new Book();
		
		book.setName(form.getName());
		book.setPrice(form.getPrice());
		book.setStockQuantity(form.getStockQuantity());
		book.setAuthor(form.getAuthor());
		book.setIsbn(form.getIsbn());
		
		itemService.saveItem(book);
		
		return "redirect:/";
	}
	
	// 상품 목록
	@GetMapping(value = "/items")
	public String list(@PageableDefault Pageable pageable, Model model) {
		
		Page<Item> items = itemService.findAll(pageable);
		
	    model.addAttribute("items", items );
	    
		return "items/itemList";
	}
	
	// 상품 수정 폼
	@GetMapping(value = "/items/{itemId}/edit")
	public String updateItemForm(@PathVariable("itemId") Long itemId, Model model) {
		Book item = (Book) itemService.findOne(itemId); //cast는 좋지않다. 나중에 Item으로 받아서 처리하자
		BookForm form = new BookForm();
		
		form.setId(item.getId());
		form.setName(item.getName());
		form.setPrice(item.getPrice());
		form.setStockQuantity(item.getStockQuantity());
		form.setAuthor(item.getAuthor());
		form.setIsbn(item.getIsbn());
		
		model.addAttribute("form", form);
		
		return "items/updateItemForm";
	}

	// 상품 수정 (변경감지방법)
	@PostMapping(value = "/items/{itemId}/edit")
	public String updateItem(@PathVariable Long itemId, @ModelAttribute("form") BookForm form) {
		
		itemService.updateItem(itemId, form.getName(), form.getPrice(), form.getStockQuantity());
		
		return "redirect:/items";
	}
}