<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<c:set var="purchaseList" value="${purchaseList}" />
<c:set var="searchDTO" value="${searchDTO}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>ThankStore 고객 구매목록</title>
    <!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/favicon.PNG">
    <!-- Custom Stylesheet -->
    <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
    
    <link 
	href="${app}/resources/customer/css/customer.css" rel="stylesheet">
	
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
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
   <div id="main-wrapper">

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
            Header start
        ***********************************-->
       <div class="header">    
            <div class="header-content clearfix">
               <jsp:include page="/WEB-INF/views/customer/fragment/searchbar.jsp" flush="true" />
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar" style="height: 100%;  width: 243px; padding-bottom:0px">         
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
			<div id="product-search-box">
   				<div class="row">
	   				<div class="col-md-11">
	    				<h3>${dto.name} 회원님의 구매목록</h3>
	       			</div>
	   			</div>
	   		</div>
	   			<hr style="border: solid 3px #1b4af5;">
	   			<form>
       <div class="container-fluid">
                <div class="row">
                <c:forEach var="purchaseDTO" items="${purchaseList}" varStatus="status">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>판매처 : ${purchaseDTO.brand} ${purchaseDTO.cvstorename}</h4>
                                </div>
                                <div id="list-box">
	  										<div class="img_resize col-lg-10">
	  											<img src='${app}/resources/product/images/${purchaseDTO.name}.jpg' class="product_img"/>
	  										</div>
						  				<div class="col-lg-2"></div>
						  				<div class='col-lg-10'>
							    				<label class="name1" style="font-size:20px;">상품명 : ${purchaseDTO.name}<br/></label>
							    				<h5>상품코드 : ${purchaseDTO.productcode}<br/></h5>
							    				<h5>남은시간 : ${purchaseDTO.countTime} 시간 <c:if test="${purchaseDTO.countTime eq 1 }">이하</c:if><br/></h5>
							    				<h5 style="color:red">구매금액 : <f:formatNumber value="${purchaseDTO.purchaseprice}" pattern="#,###" />원<br/></h5>
							    		</div>
							    		<div class="col-lg-2"></div>
							    		<div class='col-lg-12' style="text-align:right;">
							   					<img src="https://chart.googleapis.com/chart?chs=180x180&cht=qr&chl=${dto.name}+${purchaseDTO.brand}+${purchaseDTO.cvstorename}+${purchaseDTO.name}+${purchaseDTO.productcode}&choe=UTF-8"/>
							   			</div>
				   				</div>
	   						</div>
                        </div>
                    </div>
                    </c:forEach>
                        <!-- /# card -->
                    </div>
                </div>
            	<input class="btn btn-warning" type="button" value="기간만료 상품보기" onclick="location.href='endpurchaselist'"/>
	   	   	</form>
	   
	   		
	   		
	
		
		<form>
    	<div class="row" style="text-align:center;">
    		<!-- <div class='col-md-5'></div> -->
   			<div class='col' style="margin-top:5px;">
				<c:if test="${searchDTO.pagingDTO.startPage == 1}">
				<a class="btn btn-default">Previous</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.startPage != 1}">
				<a href="/store/customer/purchaselist?pg=${searchDTO.pagingDTO.startPage-1}" class="btn btn-default">Previous</a>
				</c:if>
				
				<c:forEach var="i" begin="${searchDTO.pagingDTO.startPage}" end="${searchDTO.pagingDTO.endPage}">
				<c:if test="${searchDTO.pagingDTO.pg == i}">
				<a href="#" class="btn btn-warning">${i}</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.pg != i}">
				<a href="/store/customer/purchaselist?pg=${i}" class="btn btn-warning">${i}</a>
				</c:if>
				</c:forEach>
				
				
				<c:if test="${searchDTO.pagingDTO.endPage == searchDTO.pagingDTO.totalPage}">
				<a class="btn btn-default">Next</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.endPage != searchDTO.pagingDTO.totalPage}">
				<a href="/store/customer/purchaselist?pg=${searchDTO.pagingDTO.endPage+1}" class="btn btn-default">Next</a>
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