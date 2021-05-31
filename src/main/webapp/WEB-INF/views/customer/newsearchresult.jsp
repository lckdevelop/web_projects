<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<c:set var="cvstoreList" value="${cvstoreList}" />
<c:set var="searchDTO" value="${searchDTO}" />
<c:set var="subCategoryList" value="${subCategoryList}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>ThankStore 검색결과</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
    
    <link 
	href="${app}/resources/customer/css/accordion.css" rel="stylesheet">
	
	<link 
	href="${app}/resources/customer/css/categoryaccordion.css" rel="stylesheet">
<script type="text/javascript" 
	src="${app}/resources/customer/js/accordion.js"></script>	
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>

<script>

var subCategoryList = new Array();
$( function() {
	$("#mainCategory").change(function(){
	    var mainCategory =  $(this).val();
	    var searchKeyword = '${searchDTO.searchKeyword}';
	    $.ajax({
   		 url: "changeCategory",
   		 method: "POST",
   		 data: {"mainCategory": mainCategory,"searchKeyword":searchKeyword},
   		 async: false,
   		 datatype: "json",
   		 success:function(data){
    		$("#subCategory").children().remove();
			$("#subCategory").append("<option value='' selected>전체</option>");
 			for(let i = 0; i < data.length; i++){
 				$("#subCategory").append("<option value="+data[i]+">"+data[i]+"</option>");
 			}
   		 },
   		 error:function(){
   		    alert("실패");
   		 }
   	 	});
	});
	
	
});

function buyBtn(no){
	var accountno = '${dto.accountno}';
	$.ajax({
   		 url: "onecvsproduct",
   		 method: "POST",
   		 data: {"no":no},
   		 datatype: "json",
   		 success:function(cvsProductDTO){
   			const swalWithBootstrapButtons = Swal.mixin({
				  customClass: {
				    confirmButton: 'btn btn-success',
				    cancelButton: 'btn btn-danger'
				  },
				  buttonsStyling: false
				})

				swalWithBootstrapButtons.fire({
				  title: "결제확인",
				  text: cvsProductDTO.name+'을(를) '+ cvsProductDTO.discountPrice+'원에 구입하시겠습니까?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonText: '결제요청',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.isConfirmed) {
					  
					  $.ajax({
			   				url: "purchaseproduct",
			   				method: "POST",
			   				data: {"no":no},
							datatype: "json",
							success:function(data){
								if(data == null || data==""){
									Swal.fire(
				    						  '잔액부족',
				  	    				      '포인트가 부족합니다. 충전 후에 재시도 부탁드립니다.',
				  	    				      'error'
				    						);
								}
								else{
									Swal.fire({
										  icon: 'success',
										  title: '성공적으로 물품을 구입했습니다.',
										  showConfirmButton: false,
										  timer: 100000
										});
					    			
					    			location.reload();									
								}
								
				    			 
				    		 },
				    		 error:function(){
				    			 Swal.fire(
			    						  '문제발생',
			  	    				      '오류가 발생했습니다. 다시 시도해주세요.',
			  	    				      'error'
			    						);
				    		 }
				    	 });
				  } else if (
    				    /* Read more about handling dismissals below */
    				    result.dismiss === Swal.DismissReason.cancel
    				  ) {
    				    swalWithBootstrapButtons.fire(
    				      '결제취소',
    				      '결제를 취소했습니다. 처음부터 다시 시도하세요.',
    				      'error'
    				    );
    				  }
    				});
   			
   			/* $.ajax({
   				url: "purchaseproduct",
   				method: "POST",
   				data: {"no":no},
				datatype: "json",
				success:function(data){
					if(data == null || data == ""){
						alert("잔액부족");
					}
					else{
						alert("구매성공");
						location.reload();
					}
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			       }
   			});*/
   		 },
   		 error:function(){
   		    alert("실패");
   		 } 
   	});

	
}

</script>
</head>

<body style="padding:0px">

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="/store/customer/home">
                    <b class="logo-abbr"><img src="${app}/resources/quixlab/themes/quixlab/images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="${app}/resources/quixlab/themes/quixlab/images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="${app}/resources/quixlab/themes/quixlab/images/logo-text.png" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
          <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <!-- 화면에 어디에 뜨는지 이해불가 -->
                        <div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
                        </div>
                        <!-- 이해불가 -->
                    </div>
                </div>
                
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar" style="height: 1297px;  width: 243px; padding-bottom:0px">         
			<jsp:include page="/WEB-INF/views/customer/fragment/newcategorybar.jsp" flush="true" />			
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
        <!--**********************************
            profile start
        ***********************************-->
		<div class="nk-sidebar" style="height:1297px; width:243px; margin-left:243px; margin-right:0px">
 			<jsp:include page="/WEB-INF/views/customer/fragment/newprofilebar.jsp" flush="true" />
		</div>
 		 <!--**********************************
            profile end
        ***********************************-->
        <!--**********************************
            Content body start
        ***********************************-->		
        <div class="content-body" style=" margin-left: 486px; ">            
            <form>
 		<div id="product-search-box">
   			<div class="row">
	   			<c:if test="${searchDTO.mainCategory != '' && searchDTO.mainCategory != null}">
	   			<div class="col-md-11">
	    			<h3>${searchDTO.mainCategory} 카테고리 조회</h3>
	       		</div>
	   			</c:if>
	   			<c:if test="${searchDTO.searchKeyword != '' && searchDTO.searchKeyword != null}">
	   			<div class="col-md-11">
	    			<h3>[${searchDTO.searchKeyword}] 검색결과</h3>
	       		</div>
	   			</c:if>
	   			
	       		
	       		<!-- 대분류 -->
	       		<div class="col-md-2">
	       		<span>대분류</span>
	       		<select name="mainCategory" id="mainCategory">
	       		<option value=""
					<c:if test="${searchDTO.mainCategory == '' || searchDTO.mainCategory == null}"> selected </c:if>
				>전체</option>
				<option value="김밥류"
					<c:if test="${searchDTO.mainCategory == '김밥류'}">  selected</c:if>
				>김밥류</option>
				<option value="도시락류"
					<c:if test="${searchDTO.mainCategory == '도시락류'}">  selected </c:if>
				>도시락류</option>
				<option value="빵류"
					<c:if test="${searchDTO.mainCategory == '빵류'}">  selected </c:if>
				>빵류</option>
				<option value="즉석조리"
					<c:if test="${searchDTO.mainCategory == '즉석조리'}">  selected </c:if>
				>즉석요리</option>
				<option value="완제품"
					<c:if test="${searchDTO.mainCategory == '완제품'}">  selected </c:if>
				>완제품</option>
				<option value="유제품류"
					<c:if test="${searchDTO.mainCategory == '유제품류'}">  selected </c:if>
				>유제품</option>
				</select>
	       		</div>
	       		
	       		<!-- 세분류 -->
	       		<div class="col-md-2">
	       		<span>세분류</span>
	       		<select name="subCategory" id="subCategory">
	       		<option value=""
					<c:if test="${searchDTO.subCategory == '' || searchDTO.subCategory == null}"> selected </c:if>
					>전체</option>
	       		<c:forEach var="subCategory" items="${subCategoryList}">
	       			<option value="${subCategory}"
	       			<c:if test="${searchDTO.subCategory == subCategory}"> selected </c:if>
					>${subCategory}</option>
	       		</c:forEach>
				</select>
	       		</div>
	       		
	       		<div class="col-md-3">
	    			<input type="text" name="searchKeyword" class="form-control" value="${searchDTO.searchKeyword}" placeholder="Search" />
	    		</div>
	    		<div class="col-md-1">
	       			<input type="submit" class="btn btn-default" value="submit"></input>
	     		</div>
     		</div>
   		</div>
 	</form>
    	
		<hr style="border: solid 3px #1b4af5;">
    	<form>
  		<c:forEach var="cvstore" items="${cvstoreList}" varStatus="status">
	    	<div id="list-box" style="margin:10px;">
	    		<div class="tab">
	  			 <input class="accordion" type="radio" id="${cvstore.storecode}" name="cvstoreradio" value="${cvstore.name}"
	  			 <c:if test="${status.first == true}"> checked </c:if>
	  			 >
			        <label class="tab-label" for="${cvstore.storecode}">${cvstore.name}</label>
			        <div class="tab-content panel" style="overflow:auto;">
			        	<c:forEach var="cvsproduct" items="${cvstore.cvsProductList}">
			        		<div id="${cvsproduct.no}">
			        			<div class='col-sm-4'>
	  								<img src='${app}/resources/product/images/${cvsproduct.name}.jpg' />
	  							</div>
			        			<h6>상품명 : ${cvsproduct.name}<br/></h6>
			        			<h6>제조날짜 : <f:formatDate value="${cvsproduct.warehousingdate}" pattern="yyyy/MM/dd" /><br/></h6>
		    				<h6>유통만료기한 : <f:formatDate value="${cvsproduct.expirationdate}" pattern="yyyy/MM/dd" /><br/></h6>
		    				<h6 style="color:blue">남은시간 : ${cvsproduct.countTime}시간<br/></h6>
		    				<h6>원가 : ${cvsproduct.price}원<br/></h6>
		    				<h6 style="color:red">할인가 : ${cvsproduct.discountPrice}원<br/></h6>
		    				<h6 style="color:red">할인률 : ${cvsproduct.discountRate}%<br/></h6>
		    				<input type="button" value="결제" onclick="buyBtn('${cvsproduct.no}')"/>
		    				<hr>
			        		</div>
			        	</c:forEach>
			        </div>
	    		</div>
	   		</div>
    	</c:forEach>
    	</form>
    	
    	<form>
    	<div class="row" style="margin-top:5px; text-align:center;">
    		<!-- <div class='col-md-5'></div> -->
   			<div class='col'>
				<c:if test="${searchDTO.pagingDTO.startPage == 1}">
				<a class="btn btn-default">Previous</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.startPage != 1}">
				<a href="/store/customer/searchresult?mainCategory=${searchDTO.mainCategory}&subCategory=${searchDTO.subCategory}&searchKeyword=${searchDTO.searchKeyword}&pg=${searchDTO.pagingDTO.startPage-1}" class="btn btn-default">Previous</a>
				</c:if>
				
				<c:forEach var="i" begin="${searchDTO.pagingDTO.startPage}" end="${searchDTO.pagingDTO.endPage}">
				<c:if test="${searchDTO.pagingDTO.pg == i}">
				<a href="#" class="btn btn-warning">${i}</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.pg != i}">
				<a href="/store/customer/searchresult?mainCategory=${searchDTO.mainCategory}&subCategory=${searchDTO.subCategory}&searchKeyword=${searchDTO.searchKeyword}&pg=${i}" class="btn btn-warning">${i}</a>
				</c:if>
				</c:forEach>
				
				
				<c:if test="${searchDTO.pagingDTO.endPage == searchDTO.pagingDTO.totalPage}">
				<a class="btn btn-default">Next</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.endPage != searchDTO.pagingDTO.totalPage}">
				<a href="/store/customer/searchresult?mainCategory=${searchDTO.mainCategory}&subCategory=${searchDTO.subCategory}&searchKeyword=${searchDTO.searchKeyword}&pg=${searchDTO.pagingDTO.endPage+1}" class="btn btn-default">Next</a>
				</c:if>
			</div>
		</div>
		</form>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->

    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${app}/resources/quixlab/themes/quixlab/plugins/common/common.min.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/custom.min.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/settings.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/gleek.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/styleSwitcher.js"></script>

</body>

</html>