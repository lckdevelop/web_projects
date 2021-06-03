<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${managerDTO}" />
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
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/manager/js/jquery-3.6.0.min.js"></script>
<!-- gson chart -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>	
<script type="text/javascript">

/* $( function() {
  $( "#speed" ).selectmenu();

  $( "#files" ).selectmenu();

} ); */

$(function() {
	let cvsno = '${dto.cvsno}';
	let searchYear = $("#searchYear").val();
	
	// 월별 수익 차트 
	let lineChart = document.getElementById("monthProfit").getContext("2d");
    let chartLabels = [];
    let chartData=[];
    
    $.getJSON("${app}/manager/profit/"+cvsno+"/"+searchYear, function(data){
        $.each(data, function(key, value) {
        	chartLabels.push(value.month);
            chartData.push(value.profitpermonth);
        });
        
        let categoryChart = new Chart(lineChart, {
        	type : 'line',
        	data : {
        		labels : chartLabels,
        		datasets : [ {
                    label : "월별 총 수익",
                    backgroundColor:"#ff8a3d",
                    borderColor: "#ff643d",
                    pointBorderColor: "#ffb88a",
                    pointBackgroundColor: "#ffa163",
                    pointHoverBackgroundColor: "#dc3546",
                    pointHoverBorderColor: "#ff643d",
                    fontSize : 30,
                    fill: false,
                    borderWidth: 4,
                    data : chartData
                } ]
        	},
        	options: {
        		title: {
        			display : true,
        			text : searchYear + "년 월별 수익",
        			fontSize : 25,
        			fontColor : '#dc3546', 
        		}
        	}
        });
        
    });
    
 	// 카테고리별 현황 차트
 	let doughnutChart = document.getElementById("categoryProfit").getContext("2d");
    let chartLabels2 = [];
    let chartData2 = [];
    
    $.getJSON("${app}/manager/category/"+cvsno+"/"+searchYear, function(data){
        $.each(data, function(key, value) {
        	chartLabels2.push(value.mainCategory);
        	chartData2.push(value.cntPerCategory);
        });
        

        let categoryChart = new Chart(doughnutChart, {
        	type : 'doughnut',
        	data : {
        		labels : chartLabels2,
        		datasets: [{
        		    data: chartData2,
        		    backgroundColor: [
        		      'rgb(255, 99, 132)',
        		      'rgb(54, 162, 235)',
        		      'rgb(255, 205, 86)',
        		      'rgb(254, 145, 99)',
        		      'rgb(145, 99, 254)'
        		    ],
        		    hoverOffset: 4
        		  }]
        	},
        	options: {
        		title: {
        			display : true,
        			text : searchYear + "년 메인 카테고리별 현황",
        			fontSize : 25,
        			fontColor : '#dc3546', 
        		}
        	}
        });
        
    });
    
    // 리스트
    $.ajax({
	        type:"get",
	        datatype:"json",
	        url:"${app}/manager/list/"+cvsno+"/"+searchYear,
	        success:function (data){
	        	$("#sellYear").text(searchYear +"년 판매 내역");
		        var bList ="";
		        
		        for(var i in data){
			        bList += '<tr>';
			        bList += '<td>'+ data[i].productcode+'</td>';
			        bList += '<td>'+ data[i].name+'</td>';
			        bList += '<td>'+ data[i].maincategory+'</td>';
			        bList += '<td>'+ data[i].subcategory+'</td>';
			        bList += '<td>'+ data[i].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원</td>';
			        bList += '<td>'+ data[i].enrolledprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원</td>';
			        bList += '<td>'+ data[i].enrolledlefttime+'시간</td>';
			        bList += '<td>'+ data[i].sellday+'</td>';
				    bList += '</tr>';
		        }
		        
		        $("#list_body").html(bList);

		     },
        error:function(data,textStatus){
         alert("에러가 발생했습니다.");
        },
        complete:function(data,textStatus){
        }
     });
    
    // 세부카테고리 클릭 시
    $('#btn_searchSub').click(function(){
    	searchYear = $("#searchYear").val();
    	searchSubCat = $("#searchSubCat").val();
    	
    	let doughnutChart2 = document.getElementById("subCatProfit").getContext("2d");
    	let subLabels = [];
        let subData = [];
        
        $.getJSON("${app}/manager/subCategory/"+cvsno+"/"+searchYear+"/"+searchSubCat, function(data){
            $.each(data, function(key, value) {
            	subLabels.push(value.subCategory);
            	subData.push(value.cntPerCategory);
            });
            

            let categoryChart = new Chart(doughnutChart2, {
            	type : 'doughnut',
            	data : {
            		labels : subLabels,
            		datasets: [{
            		    data: subData,
            		    backgroundColor: [
            		      'rgb(145, 99, 254)',
            		      'rgb(254, 145, 99)',
            		      'rgb(255, 205, 86)',
            		      'rgb(54, 162, 235)',
            		      'rgb(255, 99, 132)'
            		    ],
            		    hoverOffset: 4
            		  }]
            	},
            	options: {
            		title: {
            			display : true,
            			text : searchSubCat + " 세분류 현황",
            			fontSize : 25,
            			fontColor : '#dc3546', 
            		}
            	}
            });
            
        });
    	
    });
    
    $('#btn_searchYear').click(function(){
    	searchYear = $("#searchYear").val();
    	// 월별 수익 차트 
    	let lineChart = document.getElementById("monthProfit").getContext("2d");
        let chartLabels = [];
        let chartData = [];
        
        $.getJSON("${app}/manager/profit/"+cvsno+"/"+searchYear, function(data){
            $.each(data, function(key, value) {
            	chartLabels.push(value.month);
                chartData.push(value.profitpermonth);
            });
            
            let categoryChart = new Chart(lineChart, {
            	type : 'line',
            	data : {
            		labels : chartLabels,
            		datasets : [ {
                        label : "월별 총 수익",
                        backgroundColor:"#ff8a3d",
                        borderColor: "#ff643d",
                        pointBorderColor: "#ffb88a",
                        pointBackgroundColor: "#ffa163",
                        pointHoverBackgroundColor: "#dc3546",
                        pointHoverBorderColor: "#ff643d",
                        fontSize : 30,
                        fill: false,
                        borderWidth: 4,
                        data : chartData
                    } ]
            	},
            	options: {
            		title: {
            			display : true,
            			text : searchYear + "년 월별 수익",
            			fontSize : 25,
            			fontColor : '#dc3546', 
            		}
            	}
            });
            
        });
        
     	// 카테고리별 현황 차트
     	let doughnutChart = document.getElementById("categoryProfit").getContext("2d");
        let chartLabels2 = [];
        let chartData2 = [];
        
        $.getJSON("${app}/manager/category/"+cvsno+"/"+searchYear, function(data){
            $.each(data, function(key, value) {
            	chartLabels2.push(value.mainCategory);
            	chartData2.push(value.cntPerCategory);
            });
            

            let categoryChart = new Chart(doughnutChart, {
            	type : 'doughnut',
            	data : {
            		labels : chartLabels2,
            		datasets: [{
            		    data: chartData2,
            		    backgroundColor: [
            		      'rgb(255, 99, 132)',
            		      'rgb(54, 162, 235)',
            		      'rgb(255, 205, 86)',
            		      'rgb(254, 145, 99)',
            		      'rgb(145, 99, 254)'
            		    ],
            		    hoverOffset: 4
            		  }]
            	},
            	options: {
            		title: {
            			display : true,
            			text : searchYear + "년 메인 카테고리별 현황",
            			fontSize : 25,
            			fontColor : '#dc3546', 
            		}
            	}
            });
            
        });
        
        $.ajax({
	        type:"get",
	        datatype:"json",
	        url:"${app}/manager/list/"+cvsno+"/"+searchYear,
	        success:function (data){
	        	$("#sellYear").text(searchYear +"년 판매 내역");
		        var bList ="";
		        
		        for(var i in data){
			        bList += '<tr>';
			        bList += '<td>'+ data[i].productcode+'</td>';
			        bList += '<td>'+ data[i].name+'</td>';
			        bList += '<td>'+ data[i].maincategory+'</td>';
			        bList += '<td>'+ data[i].subcategory+'</td>';
			        bList += '<td>'+ data[i].price+'</td>';
			        bList += '<td>'+ data[i].enrolledprice+'원</td>';
			        bList += '<td>'+ data[i].enrolledlefttime+'시간</td>';
			        bList += '<td>'+ data[i].sellday+'</td>';
				    bList += '</tr>';
		        }
		        
		        $("#list_body").html(bList);

		     },
	        error:function(data,textStatus){
	         alert("에러가 발생했습니다.");
	        },
	        complete:function(data,textStatus){
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
    <div id="main-wrapper" >

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header" style="background-color:white">
			<button onclick="location.href='${app}'" class="go_root_btn">
				<img src="${app}/resources/logo_copy.png" style='height: 100%; width: 100%; object-fit: contain'alt="">
			</button>
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
            	<!-- 수익 그래프 -->
            	<div id="product-search-box">
		   			<div class="row">
			   			<div class="col-md-5">
			    			<span class="list_info" style="color:#ff8a3d;">${dto.brand}&nbsp;${dto.spot}&nbsp;수익 현황</span>
			       		</div>
		     		</div>
   				</div>
   				<div id ="list_container_box">
				<hr class="list_hr">		   			
					<!-- 조회 버튼 -->
		   			<div class="profit_search">
			   			<div class="row">
				    		<div class="col-md-10">
				   			</div>
				       		<div class="col-md-2">
				       			<!-- 년도 select박스 -->
					       		<select name="searchYear" id="searchYear" class="selectpicker" data-style="btn-danger" data-width="110px">
								<option value="2021"
									<c:if test="${profitDTO.searchYear == '2021'}"> selected </c:if>
								>2021년</option>
								<option value="2020"
									<c:if test="${profitDTO.searchYear == '2020'}"> selected </c:if>
								>2020년</option>
								<option value="2019"
									<c:if test="${profitDTO.searchYear == '2019'}"> selected </c:if>
								>2019년</option>
								</select>
				       			<!-- sub카테고리 -->
					       		<select name="searchSubCat" id="searchSubCat" class="selectpicker" data-style="btn-danger" data-width="110px" style="background-color:#212529">
								<option value="김밥류"
									<c:if test="${profitDTO.mainCategory == '김밥류'}"> selected </c:if>
								>김밥류</option>
								<option value="도시락류"
									<c:if test="${profitDTO.mainCategory == '도시락류'}"> selected </c:if>
								>도시락류</option>
								<option value="유제품류"
									<c:if test="${profitDTO.mainCategory == '유제품류'}"> selected </c:if>
								>유제품류</option>
								</select>
					       		
				     		</div>
			     		</div>
			     		<div class='profit_margin_box'></div>
			     		<div class="row">
			     			<div class="col-md-10">
				   			</div>
				       		<div class="col-md-2">
				       			
								<!-- 조회 버튼 -->
								<input type="submit" id="btn_searchYear" class="btn btn-warning" value="연도 조회" style="width:110px; color:white;"></input>
				       			<input type="submit" id="btn_searchSub" class="btn btn-warning" value="세분류 조회" style="width:110px; color:white;"></input>
				       		</div>
			     		</div>
					</div>
					<!-- 그래프 ajax -->
			 		<div class="row">
			 			<div class="col-md-6" style="float: none; margin:0 auto;">
							<canvas id="monthProfit" height="450" width="600"></canvas>
						</div>
						<div class="col-md-3" style="float: none; margin:0 auto;">
							<canvas id="categoryProfit" height="450" width="600"></canvas>
						</div>
						<div class="col-md-3" style="float: none; margin:0 auto;">
							<canvas id="subCatProfit" height="450" width="600"></canvas>
						</div>
					</div>
            		<!-- 년도별 판매 내역 리스트 -->
            </div>
        	 
            
            
            
            <!-- #/ container -->
        </div>
        <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" id="sellYear">판매 내역</h4>
                                <div class="table-responsive">
                                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                                    	
                                    	<div class="row">
                                    	<div class="col-sm-12">
                                    	<table class="table table-striped table-bordered zero-configuration dataTable" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                        	<thead>
	                                            <tr role="row">
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 130.2px;text-align:center;">
	                                            		상품코드
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 180.6px;text-align:center;">
	                                            		상품명
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 123.4px;text-align:center;">
	                                            		대분류
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 57px;text-align:center;">
	                                            		세분류
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 65px;text-align:center;">
	                                            		원가
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 55.6px;text-align:center;">
	                                            		판매가
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 65.6px;text-align:center;">
	                                            		남은시간
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 200.6px;text-align:center;">
	                                            		판매일자
	                                            	</th>
	                                            </tr>
                                        	</thead>
                                        	<tbody id="list_body">
                                        		<!-- ajax -->
                                        	
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