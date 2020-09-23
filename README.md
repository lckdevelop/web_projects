### 예약 가능한 리조트 웹/웹 앱 사이트 구축

***

#### 리조트 시설 소개, 오시는 길, 객실 예약, 공지사항 및 이용후기 게시판, 관리자 로그인 구현

1. 오시는 길은 카카오톡 지도 오픈 API를 사용
2. 관리자 로그인을 구현하여 관리자와 고객이 보는 화면을 다르게 구성(예약 달력, 공지사항 게시판(추가, 삭제, 등록)) 
3. 해당날짜와 방이 이미 예약이 되어 있으면 에약 수정 불가 구현
3. 웹 에디터 summernote사용
4. 웹앱 사이트 구축

***

* ##### Main화면


![image](https://user-images.githubusercontent.com/59947533/93965197-781b4500-fd9c-11ea-8d62-bb745e9821ab.png)



* ##### 관리자 로그인 화면

관리자 기능(세션 체크)
1. 예약 달력에서 고객의 이름을 FullName으로 볼 수 있다.
2. 고객의 이름을 클릭하면 예약 수정, 삭제가 가능하다.
3. 관리자는 고객들과 달리 달력에서 전체 날짜가보여 예약날짜에 제약이 없다.
4. 공지사항은 관리자만 쓸 수 있다.
5. 게시글 관련 수정, 삭제 기능은 관리자만 가능하다.
    (고객과 방문자는 버튼이 보이지 않는다.)


![image](https://user-images.githubusercontent.com/59947533/93968920-b0735100-fda5-11ea-96c0-381ba40e436e.png)
![image](https://user-images.githubusercontent.com/59947533/93968884-96d20980-fda5-11ea-8aa6-92149413b2e2.png)


* ##### 방 소개

![ezgif com-gif-maker](https://user-images.githubusercontent.com/59947533/93965795-f9270c00-fd9d-11ea-9219-42a5c3efe529.gif)


* ##### 카카오톡 지도 open api

![image](https://user-images.githubusercontent.com/59947533/93965914-39868a00-fd9e-11ea-9954-848b31416414.png)



* ##### 리조트 예약 기능 


1. 고객 예약페이지는 관리자와 달리 오늘로부터 30일 후 까지만 달력에 객실이 출력된다.(관리자 로그인을 하면 전체 날짜가 보인다.)

2. 해당 날짜와 방에 예약이 되어있으면 고객 이름이 표시되며, 관리자는 FullName으로 볼 수 있으나 고객화면은 *처리를 하였다.
   
![1](https://user-images.githubusercontent.com/59947533/93967102-6c7e4d00-fda1-11ea-8e03-f4a79cb9839f.JPG)     ![image](https://user-images.githubusercontent.com/59947533/93967205-ac453480-fda1-11ea-88ed-b99c602946dc.png)


* ##### 고객 리뷰 게시판


사용한 댓글 로직
1. 원문의 댓글인 경우 먼저 쓸수록 위쪽에 위치
2. 댓글의 댓글들인 경우 나중에 쓸수록 위쪽에 위치

추가 기능
1. 시스템 시간으로 당일 작성된 글은 [NEW]가 표시 된다.
2. 파일이 첨부된 게시글은 파일 이미지가 나타난다.
3. 한 페이지에 보여질 블록의 수를 5개로 지정해서, 
   이전페이지가 없을 때는 이전이 보이지 않고 다음패이지가 없을때는 다음이 보이지않도록 유동적으로 설정하였다.

![image](https://user-images.githubusercontent.com/59947533/93967575-676dcd80-fda2-11ea-8de7-8da9a6d6b428.png)



* ##### 웹앱 이미지 첨부


![image](https://user-images.githubusercontent.com/59947533/93967696-c4698380-fda2-11ea-9902-448c73b33075.png)

