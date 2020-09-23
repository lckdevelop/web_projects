### SPRINGBOOT JPA를 이용한 서점 관리자 사이트

***

1. 회원 관리: 회원을 추가 및 관리가 가능하다.
2. 상품 관리 : 상품 등록이 가능하며 경우에 따라 재고가 변동한다.
3. 주문 관리: 상품을 주문, 취소가 가능하며 주문상태도 검색 가능하다.

***

> MAIN PAGE

![image](https://user-images.githubusercontent.com/59947533/94013921-c99bf200-fde5-11ea-9727-d938770a617f.png)  


> 회원 등록 및 목록

* ##### 회원 이름은 필수로 적도록 유효성 검사를 하였다.

```
<div class="form-group">
  <label th:for="name">이름</label> <input type="text"
     th:field="*{name}" class="form-control" placeholder="이름을 입력하세요"
     th:class="${#fields.hasErrors('name')}? 'form-control fieldError' : 'form-control'">
     <!-- result(=#fields)가 넘어왔을 때 실행할 부분 바로윗줄 -->
     <!-- 오류가 있으면 아래칸에 에러메세지를 출력한다. -->
  <p th:if="${#fields.hasErrors('name')}" th:errors="*{name}" style="font-size: 1em;"></p>
</div>
``` 

```
package com.chaeky.jpashop.controller;

import lombok.Getter;
import lombok.Setter;
import javax.validation.constraints.NotEmpty;

@Getter @Setter
public class MemberForm {
   @NotEmpty(message = "회원 이름은 필수 입니다")
   private String name; // 이름 유효성 검사
   
   private String city;
   private String street;
   private String zipcode;
}
```

![image](https://user-images.githubusercontent.com/59947533/94014297-4af38480-fde6-11ea-93c5-1aa24a246b28.png)  

> 상품 주문

* #### 재고가 변동되는 경우
1. 주문할 때
2. 주문 취소할 때
3. 수정할 때

![image](https://user-images.githubusercontent.com/59947533/94014800-fdc3e280-fde6-11ea-8fec-385ba0e1cdf4.png)  

> 상품 등록 및 수정

![image](https://user-images.githubusercontent.com/59947533/94014965-395eac80-fde7-11ea-96e3-ede950567c65.png)  

> 주문 내역 & 취소 & 검색

![image](https://user-images.githubusercontent.com/59947533/94015073-58f5d500-fde7-11ea-9613-840951d3327f.png)  


> JpaRepository 인터페이스를 이용한 페이지네이션

1. Entity클래스와 id타입을 매개변수로 갖는 JpaRepository를 상속받기

```
package com.chaeky.jpashop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chaeky.jpashop.domain.Item;

public interface PagingItemRepo extends JpaRepository<Item, Long> {
   
}
```

2. Pageable객체를 통해 페이징과 정렬을 위한 파라미터를 전달

```
public class ItemService {
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
```

3. view에서 Pageable 입력 매개변수를 받아온다. 실행하면 Page타입으로 반환한다.

```
// 상품 목록
   @GetMapping(value = "/items")
   public String list(@PageableDefault Pageable pageable, Model model) {
      
      Page<Item> items = itemService.findAll(pageable);
      
       model.addAttribute("items", items );
       
      return "items/itemList";
   }
```
