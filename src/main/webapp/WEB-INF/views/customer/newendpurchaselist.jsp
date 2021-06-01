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
    <title>ThankStore 고객 기간만료 물품</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
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
        <div class="nk-sidebar" style="height: 880px;  width: 243px; padding-bottom:0px">         
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
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>구매상품</h4>
                                </div>
                                <div id="list-box">
						    			<div class='col-sm-3'>
						  					<img src='${app}/resources/product/images/${purchaseDTO.name}.jpg' />
						  				</div>
						  				<div class='col-sm-3'>
							   					<img src="https://chart.googleapis.com/chart?chs=80x80&cht=qr&chl=${dto.name}+${purchaseDTO.productcode}+${purchaseDTO.no}&choe=UTF-8"/>
							   			</div>
						  				<div class='col-sm-6'>
							    				<label class="name1">상품명 : ${purchaseDTO.name}<br/></label>
							    				<h6>상품코드 : ${purchaseDTO.productcode}<br/></h6>
							    				<h6>만료일 : <f:formatDate value="${purchaseDTO.expirationdate}" pattern="yyyy-MM-dd HH:00:00" /><br/></h6>
							    				<h6 style="color:red">구매금액 : ${purchaseDTO.purchaseprice}원<br/></h6>
							    				
							    		</div>
				   				</div>
	   						</div>
                        </div>
                    </div>
                    </c:forEach>
                        <!-- /# card -->
                    </div>
                </div>
            	<input class="btn btn-primary" type="button" value="수령가능 상품보기" onclick="location.href='purchaselist'"/>
	   	   	</form>
	   	
		
		<form>
    	<div class="row" style="text-align:center;">
    		<!-- <div class='col-md-5'></div> -->
   			<div class='col' style="margin-top:5px;">
				<c:if test="${searchDTO.pagingDTO.startPage == 1}">
				<a class="btn btn-default">Previous</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.startPage != 1}">
				<a href="/store/customer/endpurchaselist?pg=${searchDTO.pagingDTO.startPage-1}" class="btn btn-default">Previous</a>
				</c:if>
				
				<c:forEach var="i" begin="${searchDTO.pagingDTO.startPage}" end="${searchDTO.pagingDTO.endPage}">
				<c:if test="${searchDTO.pagingDTO.pg == i}">
				<a href="#" class="btn btn-warning">${i}</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.pg != i}">
				<a href="/store/customer/endpurchaselist?pg=${i}" class="btn btn-warning">${i}</a>
				</c:if>
				</c:forEach>
				
				
				<c:if test="${searchDTO.pagingDTO.endPage == searchDTO.pagingDTO.totalPage}">
				<a class="btn btn-default">Next</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.endPage != searchDTO.pagingDTO.totalPage}">
				<a href="/store/customer/endpurchaselist?pg=${searchDTO.pagingDTO.endPage+1}" class="btn btn-default">Next</a>
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