<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 바입니다.</title>
 	
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/favicon.PNG">
 <!-- Custom Stylesheet -->
 <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
 
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	.btn{
		margin:0 10px 0 10px;
	}
</style>

<script type="text/javascript">
	$( function() {
	    $('#rechargeBtn').click(function(){
	    	var accountno = '${dto.accountno}';
	    	var chkStyle = /\d/;
	    	Swal.fire({
	    		  title: '충전할 금액을 입력하세요',
	    		  input: 'text',
	    		  inputAttributes: {
	    		    autocapitalize: 'off'
	    		  },
	    		  showCancelButton: true,
	    		  confirmButtonText: '충전하기',
	    		  cancelButtonText: '취소하기',
	    		  showLoaderOnConfirm: true,
	    		  preConfirm: (point) => {
	    			  if(point < 0 || point == null || chkStyle.test(point) == false){
	    				  Swal.fire(
	    						  '잘못된 입력',
	  	    				      '잘못된 값을 입력하셨습니다. 다시 시도해주세요.',
	  	    				      'error'
	    						);
	    				  return;
	    			  }
	    			  const swalWithBootstrapButtons = Swal.mixin({
	    				  customClass: {
	    				    confirmButton: 'btn btn-success',
	    				    cancelButton: 'btn btn-danger'
	    				  },
	    				  buttonsStyling: false
	    				})

	    				swalWithBootstrapButtons.fire({
	    				  title: "포인트 충전확인",
	    				  text: point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원을 등록된 '+accountno+' 계좌에서 충전 하시겠습니까?',
	    				  icon: 'warning',
	    				  showCancelButton: true,
	    				  confirmButtonText: '충전확인',
	    				  cancelButtonText: '요청취소'
	    				}).then((result) => {
	    				  if (result.isConfirmed) {
	    					  
	    					  $.ajax({
	    				    		 url: "recharge",
	    				    		 method: "POST",
	    				    		 data: {"point": point},
	    				    		 datatype: "json",
	    				    		 success:function(data){
	    				    			 swalWithBootstrapButtons.fire(
	    				    				      '충전성공',
	    				    				      '성공적으로 포인트를 충전했습니다',
	    				    				      'success'
	    				    				      
	    				    			);
	    				    			 
	    				    			$("#point").text(data.point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	    				    	     	
	    				    		 },
	    				    		 error:function(){
	    				    		    alert("충전실패");
	    				    		 }
	    				    	 });
	    				  } else if (
	  	    				    /* Read more about handling dismissals below */
	  	    				    result.dismiss === Swal.DismissReason.cancel
	  	    				  ) {
	  	    				    swalWithBootstrapButtons.fire(
	  	    				      '충전취소',
	  	    				      '포인트 충전을 취소했습니다. 처음부터 다시 시도하세요.',
	  	    				      'error'
	  	    				    );
	  	    				  }
	  	    				});
	    		  },
	    		  allowOutsideClick: () => !Swal.isLoading()
	    		}).then((result) => {
	    		  if (result.isConfirmed) {
	    		  }
	    		});
	    	
	    	/*  var point=prompt('충전할 금액을 입력하세요');
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
	    	 }); */
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
                     
				
				<div class="row my-5">
					<div class="profile_info" >
						<p class="text-muted mb-0">${dto.name}고객님 안녕하세요.<br/><br/></p>
						<p class="text-muted mb-0 profit_link">
						<a href="transactionhistory" class="profit_link">
                             보유한 폐기머니 : <span id="point"><f:formatNumber value="${dto.point}" pattern="#,###" /></span> 원
						</a></p>
					</div>
				</div>
                    
				<div class="row mb-5">
                         <div class="col-12 text-center" style="margin: 10px 0 10px 0;">
                             <button class="btn mb-1 btn-warning btn-block" onclick="location.href='/store/customer/home'">지도보기</button>
                         </div>
                         
                         <div class="col-12 text-center" style="margin: 10px 0 10px 0;">
                             <button class="btn mb-1 btn-warning btn-block" onclick="location.href='/store/customer/purchaselist'">나의 구매목록 (<span id = 'purchaseCnt'>${purchasecount}</span>)</button>
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