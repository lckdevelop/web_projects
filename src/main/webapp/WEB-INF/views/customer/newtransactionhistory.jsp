<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<c:set var="totalpurchaselist" value="${purchaseList}" />
			
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>ThankStore 거래내역</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
<!-- gson chart -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    let customerno = '${dto.customerno}';
    
     	// 브랜드별 현황 차트
        let doughnutChart = document.getElementById("brandPurchase").getContext("2d");
        let chartLabels = [];
        let chartData = [];
        
        $.getJSON("${app}/customer/brand/"+customerno, function(data){
            $.each(data, function(key, value) {
            	chartLabels.push(value.brand);
            	chartData.push(value.cntPerBrand);
            });
            

            let brandChart = new Chart(doughnutChart, {
            	type : 'doughnut',
            	data : {
            		labels : chartLabels,
            		datasets: [{
            		    data: chartData,
            		    backgroundColor: [
            		      'rgb(255, 99, 132)',
            		      'rgb(54, 162, 235)',
            		      'rgb(255, 205, 86)'
            		    ],
            		    hoverOffset: 4
            		  }]
            	},
            	options: {
            		title: {
            			display : true,
            			text : "브랜드별 구매현황",
            			fontSize : 25,
            			fontColor : '#ff8a3d', 
            		}
            	}
            });
            
        });
        
        
     // 카테고리별 현황 차트
        let doughnutChart2 = document.getElementById("categoryPurchase").getContext("2d");
        let chartLabels2 = [];
        let chartData2 = [];
        
        $.getJSON("${app}/customer/category/"+customerno, function(data){
            $.each(data, function(key, value) {
            	chartLabels2.push(value.mainCategory);
            	chartData2.push(value.cntPerCategory);
            });
            

            let categoryChart = new Chart(doughnutChart2, {
            	type : 'doughnut',
            	data : {
            		labels : chartLabels2,
            		datasets: [{
            		    data: chartData2,
            		    backgroundColor: [
            		      'rgb(255, 99, 132)',
            		      'rgb(54, 162, 235)',
            		      'rgb(255, 205, 86)'
            		    ],
            		    hoverOffset: 4
            		  }]
            	},
            	options: {
            		title: {
            			display : true,
            			text : "카테고리별 구매현황",
            			fontSize : 25,
            			fontColor : '#ff8a3d', 
            		}
            	}
            });
            
        });
	});
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
       
    	 <!-- row -->
            <div class="container-fluid">
            	<!-- 수익 그래프 -->
            	<div id="product-search-box">
		   			<div class="row">
			   			<div class="col-md-5">
			    			<h3>${dto.name}&nbsp;상품구매 통계</h3>
			       		</div>
		     		</div>
   				</div>
		   		<hr style="border: solid 3px #1b4af5;">
		   		<div style="text-align:center;">
			   		<h1>[ 총 절약한 금액 ]</h1>
			   		<h1>${totalDiscountPrice}원</h1>
		   		</div>
		   		<hr style="border: solid 3px #1b4af5;">
			 	<div class="container">
			 		<div class="row">
			 			<div class="col-md-6">
							<canvas id="brandPurchase" height="450" width="600"></canvas>
						</div>
						<div class="col-md-6">
							<canvas id="categoryPurchase" height="450" width="600"></canvas>
						</div>
					</div>
				</div>
            </div>
    	
    	<hr style="border: solid 3px #1b4af5;">
	 <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">${dto.name} 회원님의 구매 상세내역</h4>
                                <div class="table-responsive">
                                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                                    	
                                    	<div class="row">
                                    	<div class="col-sm-12">
                                    	<table class="table table-striped table-bordered zero-configuration dataTable" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                        	<thead>
	                                            <tr role="row">
	                                            	<th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 168.2px;">
	                                            		거래번호
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 270.6px;">
	                                            		상품명
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 123.4px;">
	                                            		일시
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 57px;">
	                                            		원가
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 113px;">
	                                            		구매가
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 95.6px;">
	                                            		절약한 금액
	                                            	</th>
	                                            </tr>
                                        	</thead>
                                        	<tbody>
                                        		<c:forEach var="purchaseDTO" items="${totalpurchaselist}" varStatus="status" >
                                        		 	<tr role="row" 
                                        		 		<c:if test="${status.count mod 2 eq 0 }">class="even" </c:if>
                                        		 		<c:if test="${status.count mod 2 ne 0 }">class="odd" </c:if>
                                        		 	>
		                                                <td>${purchaseDTO.no}</td>
		                                                <td class="sorting_1">${purchaseDTO.name}</td>
		                                                <td><f:formatDate value="${purchaseDTO.purchasedate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                                                <td>${purchaseDTO.price}</td>
		                                                <td>${purchaseDTO.purchaseprice}</td>
		                                                <td>${purchaseDTO.discountprice}</td>
		                                            </tr>
                                        		</c:forEach>
		                                    </tbody>
                                  		  </table>
                                    	</div>
                                    </div>
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    	
		<form>
    	<div class="row" style="text-align:center;">
    		<!-- <div class='col-md-5'></div> -->
   			<div class='col' style="margin-top:5px;">
				<c:if test="${searchDTO.pagingDTO.startPage == 1}">
				<a class="btn btn-default">Previous</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.startPage != 1}">
				<a href="/store/customer/transactionhistory?pg=${searchDTO.pagingDTO.startPage-1}" class="btn btn-default">Previous</a>
				</c:if>
				
				<c:forEach var="i" begin="${searchDTO.pagingDTO.startPage}" end="${searchDTO.pagingDTO.endPage}">
				<c:if test="${searchDTO.pagingDTO.pg == i}">
				<a href="#" class="btn btn-warning">${i}</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.pg != i}">
				<a href="/store/customer/transactionhistory?pg=${i}" class="btn btn-warning">${i}</a>
				</c:if>
				</c:forEach>
				
				
				<c:if test="${searchDTO.pagingDTO.endPage == searchDTO.pagingDTO.totalPage}">
				<a class="btn btn-default">Next</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.endPage != searchDTO.pagingDTO.totalPage}">
				<a href="/store/customer/transactionhistory?pg=${searchDTO.pagingDTO.endPage+1}" class="btn btn-default">Next</a>
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