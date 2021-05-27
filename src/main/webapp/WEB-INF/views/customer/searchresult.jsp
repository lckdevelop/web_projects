<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<c:set var="cvstoreList" value="${cvstoreList}" />
<c:set var="searchDTO" value="${searchDTO}" />
<c:set var="subCategoryList" value="${subCategoryList}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>ThankStore 검색결과</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/customer/css/customer.css" rel="stylesheet">
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet">
	
<!-- accordion css -->
<link 
	href="${app}/resources/customer/css/accordion.css" rel="stylesheet">
	
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript" 
	src="${app}/resources/customer/js/accordion.js"></script>	

	
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
	
	function buyBtn(cvsproduct){
		alert(cvsproduct);
		var accountno = '${dto.accountno}';
   	 	var agree = confirm('구입하시겠습니까?');
   	 	if(agree == false){
   		 return;
   		}
	   
	}
});

</script>
</head>
<body>
<!-- 전체 컨테이너 입니다.  -->
<div id='container'>
	<!-- 카테고리 바입니다. -->
    <div id='box-left'>
		<jsp:include page="/WEB-INF/views/customer/fragment/categorybar.jsp" flush="true" />
    </div>
    <!-- 프로필 바입니다. -->
    <div id='box-center'>
		<jsp:include page="/WEB-INF/views/customer/fragment/profilebar.jsp" flush="true" />
    </div>
    <!-- 검색결과 입니다. -->
    <div id='box-right'>
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
  		
	    	<div id="list-box">
	    		<div class="tab">
	  			 <input class="accordion" type="radio" id="${cvstore.storecode}" name="cvstoreradio" value="${cvstore.name}"
	  			 <c:if test="${status.first == true}"> checked </c:if>
	  			 >
			        <label class="tab-label" for="${cvstore.storecode}">${cvstore.name}</label>
			        <div class="tab-content panel">
			        	<c:forEach var="cvsproduct" items="${cvstore.cvsProductList}">
			        		<div>
			        			<h6>상품명 : ${cvsproduct.name}<br/></h6>
			        			<h6>제조날짜 : <f:formatDate value="${cvsproduct.warehousingdate}" pattern="yyyy/MM/dd" /><br/></h6>
		    				<h6>유통만료기한 : <f:formatDate value="${cvsproduct.expirationdate}" pattern="yyyy/MM/dd" /><br/></h6>
		    				<h6 style="color:blue">남은시간 : ${cvsproduct.countTime}시간<br/></h6>
		    				<h6>원가 : ${cvsproduct.price}원<br/></h6>
		    				<h6 style="color:red">할인가 : ${cvsproduct.discountPrice}원<br/></h6>
		    				<h6 style="color:red">할인률 : ${cvsproduct.discountRate}%<br/></h6>
		    				<input type="button" value="결제" onclick="buyBtn('${cvsproduct.name}')"/>
		    				<hr>
			        		</div>
			        	</c:forEach>
			        </div>
	    		</div>
	   		</div>
    	</c:forEach>
    	</form>
    	
    	<form>
    	<div class="row">
    		<div class='col-md-5'></div>
   			<div class='col-md-5'>
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
</div>
</body>
</html>