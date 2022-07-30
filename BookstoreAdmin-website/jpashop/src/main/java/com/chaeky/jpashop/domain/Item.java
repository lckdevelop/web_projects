package com.chaeky.jpashop.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;

import com.chaeky.jpashop.exception.NotEnoughStockException;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE) // SINGLE_TABLE : 한 테이블에 상속받는 클래스를 다 넣는 것
@DiscriminatorColumn(name="dtype") // type이 무엇일 때 어떻게할지 지정하기(single_table이어서 db가 구분할 수 있게 각 클래스마다 지정해주어야 한다.
@Getter @Setter
public abstract class Item {
	//pk
	@Id	@GeneratedValue
	@Column(name = "item_id")
	private Long id;
	
	private String name;
	
	private int price;
	
	private int stockQuantity;
	
	//category와 다대다관계(연관관계의 거울), category클래스의 items필드에 매핑된다.
	@ManyToMany(mappedBy = "items")
	private List<Category> categories = new ArrayList<>();
	
	//==비즈니스 로직==
	/**
	 * 재고 증가
	 */
	public void addStock(int quantity) {
		this.stockQuantity += quantity;
	}
	
	public void change(String name, int price, int stockQuantity) {
		this.name = name;
		this.price = price;
		this.stockQuantity = stockQuantity;
	}
	
	/**
	 * 재고 감소
	 */
	public void removeStock(int quantity) {
		int restStock = this.stockQuantity - quantity;
		if (restStock < 0) {
			throw new NotEnoughStockException("현재 남은 재고가 없습니다.");
		}
		this.stockQuantity = restStock;
	}
}
