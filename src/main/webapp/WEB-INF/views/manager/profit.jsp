<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${managerDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>수익 현황입니다.</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/manager/css/manager.css" rel="stylesheet">
<link
	href="${app}/resources/manager/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jquery -->
<script type="text/javascript"
	src="${app}/resources/manager/js/jquery-3.6.0.min.js"></script>
<!-- gson chart -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script type="text/javascript">
$(function() {
    let cvsno = '${dto.cvsno}';
	
    // 월별 수익 차트
    function createMonthChart() {
        let ctx = document.getElementById("monthProfit").getContext("2d");
        LineChartDemo = Chart.Line(ctx, {
            data : lineChartData,
            options : {
                scales : {
                    yAxes : [ {
                        ticks : {
                            beginAtZero : true
                        }
                    } ]
                }
            }
        });
    }
    
    
    $('#btn_searchYear').click(function(){
    	let searchYear = $("#searchYear").val();
        let chartLabels = [];
        let chartData=[];
        
        //getJson으로 데이터 
        $.getJSON("${app}/manager/profit/"+cvsno+"/"+searchYear, function(data){
            $.each(data, function(key, value) {
            	chartLabels.push(value.month);
                chartData.push(value.profitpermonth);
            });
            
            lineChartData = {
            		labels : chartLabels,
                    datasets : [ {
                        label : searchYear + "년 월별 수익",
                        backgroundColor:"#bfdaf9",
                        borderColor: "#80b6f4",
                        pointBorderColor: "#80b6f4",
                        pointBackgroundColor: "#80b6f4",
                        pointHoverBackgroundColor: "#80b6f4",
                        pointHoverBorderColor: "#80b6f4",
                        fill: false,
                        borderWidth: 4,
                        data : chartData
                    } ]

            }
            createMonthChart();
            
        });
        let doughnutChart = document.getElementById("categoryProfit").getContext("2d");
        let chartLabels2 = [];
        let chartData2 = [];
        // 2번째 차트
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
            		      'rgb(255, 205, 86)'
            		    ],
            		    hoverOffset: 4
            		  }]
            	},
            	options: {
            		title: {
            			display : true,
            			text : searchYear + "년 메인 카테고리별 현황",
            		}
            	}
            });
            
        });
    })

    
})
</script>
</head>
<body>
<div id='container'>
<!-- 카테고리 바입니다. -->
    <div id='box-left'>
		<jsp:include page="/WEB-INF/views/manager/fragment/categorybar.jsp" flush="true" />
    </div>
    <!-- 프로필 바입니다. -->
    <div id='box-center'>
		<jsp:include page="/WEB-INF/views/manager/fragment/profilebar.jsp" flush="true" />
    </div>
	<div id='box-right'>
 		<div id="product-search-box">
   			<div class="row">
	   			<div class="col-md-5">
	    			<h3>${dto.brand}&nbsp;${dto.spot}&nbsp;수익 현황</h3>
	       		</div>
	       		<div class="col-md-2">
	       		<select name="searchYear" id="searchYear">
				<option value="2021"
					<c:if test="${profitDTO.searchYear == '2021'}"> selected </c:if>
				>2021</option>
				<option value="2020"
					<c:if test="${profitDTO.searchYear == '2020'}"> selected </c:if>
				>2020</option>
				<option value="2019"
					<c:if test="${profitDTO.searchYear == '2019'}"> selected </c:if>
				>2019</option>
				</select>년
	       		</div>
	    		<div class="col-md-2">
	       			<input type="submit" id="btn_searchYear" class="btn btn-default" value="submit"></input>
	     		</div>
     		</div>
   		</div>
	 	<div class="container">
	 		<div class="row">
	 			<div class="col-md-7">
					<canvas id="monthProfit" height="450" width="600"></canvas>
				</div>
				<div class="col-md-5">
					<canvas id="categoryProfit" height="450" width="600"></canvas>
				</div>
			</div>
		</div>
		</div>
		<div id="loadPage">
							
		</div>
	</div>
</div>
</body>
</html>