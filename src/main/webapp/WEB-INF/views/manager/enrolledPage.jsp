<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${managerDTO}" />
<c:set var="list" value="${enrolledList}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>지점 관리 화면</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
<link
href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
rel="stylesheet">
<link 
	href="${app}/resources/manager/css/manager.css" rel="stylesheet">
<link
	href="${app}/resources/manager/css/bootstrap.min.css"
	rel="stylesheet">
<!-- alert창  -->
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/manager/js/jquery-3.6.0.min.js"></script>
	
<script type="text/javascript">
function btn_cancel(productNo, productName, enrolledPrice, discountPrice, countTime){
	Swal.fire({
		  title: "등록 시점 할인가 : " + enrolledPrice + "<br/>현재 시점 할인가 : " + discountPrice + "원 <br/>남은 시간 : " + countTime + "시간",
		  text: productName + "을 등록 취소하시겠습니까?",
		  imageUrl: '${app}/resources/product/images/'+productName+'.jpg',
		  imageWidth: 200,
		  imageHeight: 200,
		  showCancelButton: true,
		  confirmButtonColor: 'rgba(237, 123, 123)',
		  cancelButtonColor: 'rgba(79, 126, 255, 0.7)',
		  confirmButtonText: '등록취소',
		  cancelButtonText: '돌아가기',
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      '취소 완료!',
		       productName,
		      'error'
		    )
		    location.href="cancelAction?pg=${pagingDTO.pg}&no="+productNo+ "&discountPrice=" + discountPrice + "&countTime=" +countTime + "&from=enrolled";
		  }
		})
}
</script>
</head>
<body>

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
    <div id="main-wrapper" >

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header" style="background-color:white">
			<img src="${app}/resources/logo_copy.png" style='height: 100%; width: 100%; object-fit: contain'alt="">
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start (검색창)
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                
               <jsp:include page="/WEB-INF/views/manager/fragment/searchbar.jsp" flush="true" />
               
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start (프로필바)
        ***********************************-->

		<div class="nk-sidebar" style="height:1297px; width:243px; margin-left:243px; margin-right:0px">
		
 			<jsp:include page="/WEB-INF/views/manager/fragment/profilebar.jsp" flush="true" />
 			
		</div>
		      
        <!--**********************************
            Sidebar end
        ***********************************-->
        <!--**********************************
            Content body start
        ***********************************-->		
        <div class="content-body" style="margin-left: 543px;">            
            <!-- row -->
            <div class="container-fluid">
            
            
	            <!-- 검색 창 -->
		        <form>
		 		<div id="product-search-box">
		   			<div class="row">
			   			<div class="col-md-5">
			    			<h3>등록된 임박 상품</h3>
			       		</div>
			       		<div class="col-md-3">
			    			<div class="input-group icons">
		                        <div class="input-group-prepend">
		                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
		                        </div>
		                        <input type="search" name="searchKeyword" class="form-control" placeholder="검색" value="${searchDTO.searchKeyword}" aria-label="Search Dashboard">
                    		</div>
			    		</div>
			    		<div class="col-md-1">
			       		<select name="searchCondition" class="selectpicker" data-style="btn-danger" data-width="100px">
						<option value="name"
							<c:if test="${searchDTO.searchCondition == 'name'}"> selected </c:if>
						>상품명</option>
						<option value="maincategory"
							<c:if test="${searchDTO.searchCondition == 'maincategory'}"> selected </c:if>
						>대분류</option>
						<option value="subcategory"
							<c:if test="${searchDTO.searchCondition == 'subcategory'}"> selected </c:if>
						>세분류</option>
						</select>
			       		</div>
			    		<div class="col-md-3">
			       			<input type="submit" class="btn btn-warning" value="찾기"></input>
			     		</div>
		     		</div>
		   		</div>
		 		</form>
				<!--리스트  -->
		   		<hr style="border: solid 3px #1b4af5;">
		  		<c:forEach var="product" items="${list}" varStatus="status">
			    	<div id="list-box">
			    		<div class="row">
			    			<div class='col-sm-4'>
			  					<img src='${app}/resources/product/images/${product.name}.jpg' />
			  				</div>
			  				<div class='col-sm-6'>
				    				<h6>상품명 : ${product.name}<br/></h6>
				    				<h6>상품코드 : ${product.productcode}<br/></h6>
				    				<h6 style="color:blue">등록여부 : o<br/></h6>
				    				<h6>제조날짜 : <f:formatDate value="${product.warehousingdate}" pattern="yyyy-MM-dd HH:00:00" /><br/></h6>
				    				<h6>유통만료기한 : <f:formatDate value="${product.expirationdate}" pattern="yyyy-MM-dd HH:00:00" /><br/></h6>
				    				<h6 style="color:blue">등록 시점 남은시간 : ${product.enrolledlefttime}시간<br/></h6>
				    				<h6 style="color:red">현재 남은시간 : ${product.countTime}시간<br/></h6>
				    				<h6>원가 : ${product.price}원<br/></h6>
				    				<h6 style="color:blue">등록가 : ${product.enrolledprice}원<br/></h6>
				    				<h6 style="color:red">현재 할인가 : ${product.discountPrice}원<br/></h6>
				    				<h6 style="color:red">현재 할인률 : ${product.discountRate}%<br/></h6>
				    		</div>
				    		<div class='col-sm-2'>
			    				<input type="button" value="취소" class="btn_cancel" onclick="btn_cancel('${product.no}', '${product.name}','${product.enrolledprice}', '${product.discountPrice}', '${product.countTime}')"/>
				    		</div>
			    		</div>
			   		</div>
		    		<hr>
		    	</c:forEach>
		    	<!-- 페이징 -->
		    	<div class="row">
		    		<div class='col-md-5'></div>
		   			<div class='col-md-5'>
						<c:if test="${pagingDTO.startPage == 1}">
						<a class="btn btn-default">Previous</a>
						</c:if>
						<c:if test="${pagingDTO.startPage != 1}">
						<a href="enrolled?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${pagingDTO.startPage-1}" class="btn btn-default">Previous</a>
						</c:if>
						
						<c:forEach var="i" begin="${pagingDTO.startPage}" end="${pagingDTO.endPage}">
						<c:if test="${pagingDTO.pg == i}">
						<a href="#" class="btn btn-warning">${i}</a>
						</c:if>
						<c:if test="${pagingDTO.pg != i}">
						<a href="enrolled?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${i}" class="btn btn-warning">${i}</a>
						</c:if>
						</c:forEach>
						
						
						<c:if test="${pagingDTO.endPage == pagingDTO.totalPage}">
						<a class="btn btn-default">Next</a>
						</c:if>
						<c:if test="${pagingDTO.endPage != pagingDTO.totalPage}">
						<a href="enrolled?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${pagingDTO.endPage+1}" class="btn btn-default">Next</a>
						</c:if>
					</div>
				</div>
				
            </div>
            <!-- #/ container -->
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