package com.thank.store.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


//작성자 : 방지훈
//작성일자 : 05/24 16:26
@Getter
@Setter
@ToString
public class CustomerDTO extends MemberDTO{
	private long customerno;
	private long point;
	private long purchasePrice;
	private long cvsproductno;
	//private List<PurchaseListDTO> purchaselist;
}
