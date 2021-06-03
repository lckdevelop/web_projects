<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="searchDTO" value="${searchDTO}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 바입니다.</title>
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" 
	src="${app}/resources/customer/js/accordion.js"></script>	
<script type="text/javascript"
	src="${app}/resources/quixlab/themes/quixlab/plugins/common/common.min.js"></script>
	<script type="text/javascript"
	src="${app}/resources/quixlab/themes/quixlab/plugins/metismenu/css/metisMenu.min.css"></script>	
	<script type="text/javascript"
	src="${app}/resources/quixlab/themes/quixlab/icons/material-design-iconic-font/materialdesignicons.min.css"></script>	
	<script type="text/javascript"
	src="${app}/resources/customer/css/bootstrap.min.css"></script>		
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<%-- <link 
	href="${app}/resources/customer/css/customer.css" rel="stylesheet">
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet"> --%>
<%-- <link 
	href="${app}/resources/customer/css/accordion.css" rel="stylesheet">
<link 
	href="${app}/resources/customer/css/categoryaccordion.css" rel="stylesheet"> --%>

	<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
</head>
<body>
			
            <div class="nk-nav-scroll" style="height: 1297px; width:180px;">
            	<!-- 카테고리 검색창 시작 -->
            	<form action="/store/customer/searchresult">
				<div class="col" style="width:235px; margin: 0 0 0 5px; padding:3px">
					<input type="hidden" name="mainCategory" value=""/>
					<input type="hidden" name="subCategory" value=""/>
					<div class="col" style="padding:0px">
					<input style="margin-top: 5px; padding-right:5px; size:relative;" aria-label="Search Dashboard" type="text" id="searchKeyword" name="searchKeyword" class="form-control" value="${searchDTO.searchKeyword}" placeholder="검색" />
					
					</div>

				</div>
				</form>     
				<!-- 카테고리 검색창 끝 -->
				
				   	
				<!-- 카테고리 대/세분류 선택창 -->	
                <ul class="metismenu" id="menu">
                    <li class="nav-label">카테고리</li>
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">김밥류</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./searchresult?searchKeyword=&mainCategory=김밥류&subCategory=삼각김밥">삼각김밥</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=김밥류&subCategory=줄김밥">줄김밥</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=김밥류&subCategory=주먹밥">주먹밥</a></li>
                        </ul>
                    </li>    
                                 
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">도시락류</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./searchresult?searchKeyword=&mainCategory=도시락류&subCategory=도시락일반">도시락일반</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=도시락류&subCategory=도시락샐러드">도시락샐러드</a></li>
                        </ul>
                    </li>   
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">빵류</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./searchresult?searchKeyword=&mainCategory=빵류&subCategory=일반빵">일반빵</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=빵류&subCategory=핫도그">핫도그</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=빵류&subCategory=샌드위치">샌드위치</a></li>
                            
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">즉석조리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./searchresult?searchKeyword=&mainCategory=즉석조리&subCategory=튀김">튀김</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=즉석조리&subCategory=소시지">소시지</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">완제품</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./searchresult?searchKeyword=&mainCategory=완제품&subCategory=박스류">박스류</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">유제품류</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./searchresult?searchKeyword=&mainCategory=유제품류&subCategory=우유">우유</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=유제품류&subCategory=요거트">요거트</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=유제품류&subCategory=요구르트">요구르트</a></li>
                            <li><a href="./searchresult?searchKeyword=&mainCategory=유제품류&subCategory=치즈">치즈</a></li>
                        </ul>                        
                    </li>                      
                </ul>
                <!-- 카테고리 대/세분류 선택창 끝 -->
            </div>
</body>
</html>