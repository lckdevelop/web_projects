package com.chaeky.jpashop.domain.item;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import com.chaeky.jpashop.domain.Item;

import lombok.Getter;
import lombok.Setter;

@Entity
@DiscriminatorValue("M")
@Getter @Setter
public class Movie extends Item{
	private String director;
	private String actor;
}
