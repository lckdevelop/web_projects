package com.thank.store.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CustomerDTO extends AccountDTO{
	private long customerno;
	private long point;
	//private List<PurchaseListDTO> purchaselist;
}
