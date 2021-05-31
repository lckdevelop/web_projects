<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 바입니다.</title>
 	
<!-- Favicon icon -->
 <link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
 <!-- Custom Stylesheet -->
 <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">



<script type="text/javascript">
	$( function() {
	    $('#rechargeBtn').click(function(){
	    	
	    	
	    	 var point=prompt('충전할 금액을 입력하세요');
	    	 if(point==null || point <= 0){
	    		 return;
	    	 }
	    	 var accountno = '${dto.accountno}';
	    	 var agree = confirm(point+'원을 등록된 '+accountno+' 계좌에서 충전 하시겠습니까?');
	    	 if(agree == false){
	    		 return;
	    	 }
	    	 $.ajax({
	    		 url: "recharge",
	    		 method: "POST",
	    		 data: {"point": point},
	    		 datatype: "json",
	    		 success:function(data){
	    	     	alert("충전에 성공했습니다.");
	    	     	$("#point").text(data.point);
	    		 },
	    		 error:function(){
	    		    alert("충전실패");
	    		 }
	    	 });
	    });
	  });
</script>
</head>
<body>
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
                             <a href="transactionhistory">
                             <p class="text-muted mb-0">보유한 폐기머니</p>
                             <p class="text-muted mb-0">${dto.point} 원</p>
                             </a>
				</div>
                    
				<div class="row mb-5">
                         <div class="col-12 text-center" style="margin: 10px 0 10px 0;">
                             <button class="btn mb-1 btn-warning btn-block">지도보기</button>
                         </div>
                         
                         <div class="col-12 text-center" style="margin: 10px 0 10px 0;">
                             <button class="btn mb-1 btn-warning btn-block" onclick="location.href='/store/customer/purchaselist'">나의 구매목록 (${purchasecount})</button>
                         </div>
                         
                         <div class="col-12 text-center" style="margin: 10px 0 10px 0;">
                             <button class="btn mb-1 btn-warning btn-block" id="rechargeBtn">충전하기</button>
                         </div>
                         
                         <div class="footer" style="width:300px; height:200px; padding-left:0px; text-align:right;" >
			                <p><a href="/store/customer/logout">로그아웃</a></p>
			          	 </div>
				</div>                         
			</div>
</body>
</html>