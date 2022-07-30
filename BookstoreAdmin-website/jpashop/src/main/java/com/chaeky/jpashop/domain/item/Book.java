package com.chaeky.jpashop.domain.item;


import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import com.chaeky.jpashop.domain.Item;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Entity
@DiscriminatorValue("B") //싱글테이블에서 구분하기 위한 값
@Getter @Setter
public class Book extends Item{
	private String author;
	private String isbn;
}

