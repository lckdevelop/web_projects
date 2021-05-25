<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<c:set var="cvstoreList" value="${cvstoreList}" />
<c:set var="searchDTO" value="${searchDTO}" />
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
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>

	

<script>

  
/* 중분류 <option> 태그 */
$(mainCategory).on("change",function(){
	
	let selectVal = $(this).find("option:selected").val();	
	
	cateSelect2.children().remove();
	
	cateSelect2.append("<option value='none'>선택</option>");
	
	for(let i = 0; i < cate2Array.length; i++){
		if(selectVal1 === cate2Array[i].cateParent){
			cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
		}
	}// for
	
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
				<option value="즉석요리"
					<c:if test="${searchDTO.mainCategory == '즉석요리'}">  selected </c:if>
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
	       		<select name="subCategory">
	       		<c:if test="${searchDTO.mainCategory == '' || searchDTO.mainCategory == null }">
	       			<option value=""
					<c:if test="${searchDTO.subCategory == '' || searchDTO.subCategory == null}"> selected </c:if>
					>전체</option>
					<option value="삼각김밥"
						<c:if test="${searchDTO.subCategory == '삼각김밥'}"> selected </c:if>
					>삼각김밥</option>
					<option value="줄김밥"
						<c:if test="${searchDTO.subCategory == '줄김밥'}"> selected </c:if>
					>줄김밥</option>
					<option value="주먹밥"
						<c:if test="${searchDTO.subCategory == '주먹밥'}"> selected </c:if>
					>주먹밥</option>
					<option value="도시락일반"
						<c:if test="${searchDTO.subCategory == '도시락일반'}"> selected </c:if>
					>도시락일반</option>
					<option value="도시락샐러드"
						<c:if test="${searchDTO.subCategory == '도시락샐러드'}"> selected </c:if>
					>도시락샐러드</option>
					<option value="일반빵"
						<c:if test="${searchDTO.subCategory == '일반빵'}"> selected </c:if>
					>일반빵</option>
					<option value="핫도그"
						<c:if test="${searchDTO.subCategory == '핫도그'}"> selected </c:if>
					>핫도그</option>
					<option value="샌드위치"
						<c:if test="${searchDTO.subCategory == '샌드위치'}"> selected </c:if>
					>샌드위치</option>
					<option value="튀김"
						<c:if test="${searchDTO.subCategory == '튀김'}"> selected </c:if>
					>튀김</option>
					<option value="박스류"
						<c:if test="${searchDTO.subCategory == '박스류'}"> selected </c:if>
					>박스류</option>
					<option value="우유"
						<c:if test="${searchDTO.subCategory == '우유'}"> selected </c:if>
					>우유</option>
					<option value="요거트"
						<c:if test="${searchDTO.subCategory == '요거트'}"> selected </c:if>
					>요거트</option>
					<option value="요구르트"
						<c:if test="${searchDTO.subCategory == '요구르트'}"> selected </c:if>
					>요구르트</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '김밥류'}">
	       			<option value="삼각김밥"
						<c:if test="${searchDTO.subCategory == '삼각김밥'}"> selected </c:if>
					>삼각김밥</option>
					<option value="줄김밥"
						<c:if test="${searchDTO.subCategory == '줄김밥'}"> selected </c:if>
					>줄김밥</option>
					<option value="주먹밥"
						<c:if test="${searchDTO.subCategory == '주먹밥'}"> selected </c:if>
					>주먹밥</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '도시락류'}">
	       			<option value="도시락일반"
						<c:if test="${searchDTO.subCategory == '도시락일반'}"> selected </c:if>
					>도시락일반</option>
					<option value="도시락샐러드"
						<c:if test="${searchDTO.subCategory == '도시락샐러드'}"> selected </c:if>
					>도시락샐러드</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '빵류'}">
	       			<option value="일반빵"
						<c:if test="${searchDTO.subCategory == '일반빵'}"> selected </c:if>
					>일반빵</option>
					<option value="핫도그"
						<c:if test="${searchDTO.subCategory == '핫도그'}"> selected </c:if>
					>핫도그</option>
					<option value="샌드위치"
						<c:if test="${searchDTO.subCategory == '샌드위치'}"> selected </c:if>
					>샌드위치</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '즉석요리'}">
	       			<option value="튀김"
						<c:if test="${searchDTO.subCategory == '튀김'}"> selected </c:if>
					>튀김</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '완제품'}">
	       			<option value="박스류"
						<c:if test="${searchDTO.subCategory == '박스류'}"> selected </c:if>
					>박스류</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '유제품류'}">
	       			<option value="우유"
						<c:if test="${searchDTO.subCategory == '우유'}"> selected </c:if>
					>우유</option>
					<option value="요거트"
						<c:if test="${searchDTO.subCategory == '요거트'}"> selected </c:if>
					>요거트</option>
					<option value="요구르트"
						<c:if test="${searchDTO.subCategory == '요구르트'}"> selected </c:if>
					>요구르트</option>
	       		</c:if>
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
  		<%-- <c:forEach var="product" items="${list}" varStatus="status">
	    	<div id="list-box">
	    		<div class="row">
	    			<div class='col-sm-4'>
	  					<img src='${app}/resources/customer/img/favicon.png' alt='havetochange' />
	  				</div>
	  				<div class='col-sm-6'>
		    				<h6>상품명 : ${product.name}<br/></h6>
		    				<h6>상품코드 : ${product.productcode}<br/></h6>
		    				<c:choose>
		    					<c:when test='${product.enrollment == 0}'>
		    						<h6 style="color:blue">등록여부 : x<br/></h6>
		    					</c:when>
	    						<c:otherwise>
	    							<h6 style="color:blue">등록여부 : o<br/></h6>
	    						</c:otherwise>
		    				</c:choose>
		    				<h6>제조날짜 : <f:formatDate value="${product.warehousingdate}" pattern="yyyy/MM/dd" /><br/></h6>
		    				<h6>유통만료기한 : <f:formatDate value="${product.expirationdate}" pattern="yyyy/MM/dd" /><br/></h6>
		    				<h6 style="color:blue">남은일수/남은시간 : ${product.leftDay}일 / ${product.countTime}시간<br/></h6>
		    				<h6>원가 : ${product.price}원<br/></h6>
		    				<c:if test='${product.leftTime <= 24}'>
			    				<h6 style="color:red">할인가 : ${product.discountPrice}원<br/></h6>
			    				<h6 style="color:red">할인률 : ${product.discountRate}%<br/></h6>
		    				</c:if>
		    		</div>
		    		<div class='col-sm-2'>
		    			<c:if test='${(product.countTime <= 24) && (product.enrollment == 0)}'>
		    				<a href="home?pg=${page}&productNo=${product.no}" ><input type="submit" value="등록" class="btn_enroll"/></a>
		    			</c:if>
		    			<c:if test='${product.enrollment == 1}'>
		    				<a href="home?pg=${page}&productNo=${product.no}" ><input type="submit" value="취소" class="btn_cancel"/></a>
		    			</c:if>
		    		</div>
	    		</div>
	   		</div>
    		<hr>
    	</c:forEach> --%>
    	<%-- <div class="row">
    		<div class='col-md-5'></div>
   			<div class='col-md-5'>
				<c:if test="${pagingDTO.startPage == 1}">
				<a class="btn btn-default">Previous</a>
				</c:if>
				<c:if test="${pagingDTO.startPage != 1}">
				<a href="home?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${pagingDTO.startPage-1}" class="btn btn-default">Previous</a>
				</c:if>
				
				<c:forEach var="i" begin="${pagingDTO.startPage}" end="${pagingDTO.endPage}">
				<c:if test="${pagingDTO.pg == i}">
				<a href="#" class="btn btn-warning">${i}</a>
				</c:if>
				<c:if test="${pagingDTO.pg != i}">
				<a href="home?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${i}" class="btn btn-warning">${i}</a>
				</c:if>
				</c:forEach>
				
				
				<c:if test="${pagingDTO.endPage == pagingDTO.totalPage}">
				<a class="btn btn-default">Next</a>
				</c:if>
				<c:if test="${pagingDTO.endPage != pagingDTO.totalPage}">
				<a href="home?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${pagingDTO.endPage+1}" class="btn btn-default">Next</a>
				</c:if>
			</div>
		</div> --%>
   		
    </div>
</div>
</body>
</html>