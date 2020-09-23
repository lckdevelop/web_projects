### 예약 가능한 리조트 웹/웹 앱 사이트 구축

#### 리조트 시설 소개, 오시는 길, 객실 예약, 공지사항 및 이용후기 게시판, 관리자 로그인 구현

1. 오시는 길은 카카오톡 지도 오픈 API를 사용
2. 관리자 로그인을 구현하여 관리자와 고객이 보는 화면을 다르게 구성(예약 달력, 공지사항 게시판(추가, 삭제, 등록)) 
3. 해당날짜와 방이 이미 예약이 되어 있으면 에약 수정 불가 구현
3. 웹 에디터 summernote사용
4. 웹앱 사이트 구축

##### Main화면


![image](https://user-images.githubusercontent.com/59947533/93965197-781b4500-fd9c-11ea-8d62-bb745e9821ab.png)


##### 방 소개

![ezgif com-gif-maker](https://user-images.githubusercontent.com/59947533/93965795-f9270c00-fd9d-11ea-9219-42a5c3efe529.gif)


##### 카카오톡 지도 open api

![image](https://user-images.githubusercontent.com/59947533/93965914-39868a00-fd9e-11ea-9954-848b31416414.png)


##### 리조트 예약 기능 

1. 고객은 관리자와 달리 오늘로부터 30일 후 까지만 달력에 객실이 출력된다.

2. 해당 날짜와 방에 예약이 되어있으면 고객 이름이 표시되며,
   관리자는 FullName으로 볼 수 있으나 그 외는 처리를 하였다

![image](https://user-images.githubusercontent.com/59947533/93966605-10ff8f80-fda0-11ea-96f0-b1894e6eccb7.png)

![image](https://user-images.githubusercontent.com/59947533/93966564-fa593880-fd9f-11ea-882f-5ffdd013ff84.png)
