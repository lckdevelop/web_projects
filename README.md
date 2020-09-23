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
