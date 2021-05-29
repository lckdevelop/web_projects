<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="nk-sidebar" style="height:1297px; width:243px; margin-left:243px; margin-right:0px">
 			<div class="card-body">
            	<div class="media align-items-center mb-4">                                   
                	<div class="media-body">
                    	<h3 class="mb-0">${sessionScope.memberInfo.name}</h3>
                        	<p class="text-muted mb-0">Customer</p>
                    </div>
                </div>
                                
                <div class="row mb-5">
                    <div class="col">
                        <div class="card card-profile text-center">
                            <span class="mb-1 text-warning"><i class="icon-people" ></i></span>
                        </div>
                    </div>
                </div>     
                     

				<div class="media-body">
                             <p class="text-muted mb-0">보유한 폐기머니</p>
                             <p class="text-muted mb-0">${dto.point} 10000 원</p>
				</div>
                    
				<div class="row mb-5">
                         <div class="col-12 text-center" style="margin: 10px 0 10px 0;">
                             <button class="btn mb-1 btn-warning btn-block">지도보기</button>
                         </div>
                         
                         <div class="col-12 text-center" style="margin: 10px 0 10px 0;">
                             <button class="btn mb-1 btn-warning btn-block">나의 구매목록</button>
                         </div>
                         
                         <div class="col-12 text-center" style="margin: 10px 0 10px 0;">
                             <button class="btn mb-1 btn-warning btn-block">충전하기</button>
                         </div>
                         
                         <div class="footer" style="width:300px; height:200px; padding-left:0px; text-align:right;" >
			                <p><a href="https://themeforest.net/user/quixlab">로그아웃</a></p>
			          	 </div>
				</div>                         
			</div>
		</div>
</body>
</html>