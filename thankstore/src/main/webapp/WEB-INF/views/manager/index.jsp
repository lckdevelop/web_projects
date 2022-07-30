<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${managerDTO}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta charset="utf-8">


<title>관리자 페이지</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/favicon.PNG">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${app}/resources/manager/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="${app}/resources/manager/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${app}/resources/manager/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${app}/resources/manager/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${app}/resources/manager/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${app}/resources/manager/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${app}/resources/manager/css/style.css" rel="stylesheet">

<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/manager/js/jquery-3.6.0.min.js"></script>
<%-- <script type="text/javascript" src="${app}/webjars/jquery/3.6.0/jquery.js"></script> --%>
<script type="text/javascript">
$(function() {
	$('#allList').click(function(){
		alert("hello");
		$.ajax({
			type:"get",
	        datatype:"json",
	        url:"${app}/manager/allList/"+${dto.cvsno},
	        success:function (data){
	        	var v_loadPage ="";
	        	$("#loadKind").text("마이 점포 전상품 리스트");
	        	document.getElementById('loadUrl').setAttribute("action", "${app}/manager/test");
	            for(var i in data){
		            v_loadPage += "<hr><div class='col-sm-5'>";
		            v_loadPage += "<img src='${app}/resources/manager/img/favicon.png' alt='havetochange' />";
			    	v_loadPage += "</div>";
			    	v_loadPage += "<div class='col-sm-5'>";
			    	v_loadPage += "상품명: " + data[i].name+"<br>";
			    	v_loadPage += "상풍코드: " + data[i].productcode+"<br>";
			    	v_loadPage += "세부분류: " + data[i].subcategory+"<br>";
			    	v_loadPage += "유통기간: " + data[i].productperiod+"<br>";
		    		v_loadPage += "할인가: " + data[i].price+"<br>";
		    		v_loadPage += "<input type='submit' />";
			    	v_loadPage += "</div>";
	            }
	            
	            $("#loadPage").html(v_loadPage);
	        }
		});
	});
});
</script>
</head>

<body>

	<!-- ======= Mobile nav toggle button ======= -->
	<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>
	<div id="page-wrapper">
	<!-- ======= Header ======= -->
	<div id="page-left">
	<header id="header">
		<div class="d-flex flex-column">
			<div class="profile">
				<img src="${app}/resources/manager/img/profile-img.jpg" alt=""
					class="img-fluid rounded-circle">
				<h1 class="text-light">
					<a href="index.html">Alex Smith</a>
				</h1>
				<div class="space-bottom"></div>
				<h3 class="text-light">${dto.name}점장님 안녕하세요.</h3>
				<h3 class="text-light">${dto.brand}${dto.spot}</h3>
				<h3 class="text-light">${dto.storecode}</h3>
				<h3 class="text-light">
					<a href="index.html">수익금:${dto.profit}</a>
				</h3>
			</div>
			<nav id="navbar" class="nav-menu navbar">
				<ul>
					<li><a id="allList" class="nav-link scrollto active"><i
							class="bx bx-home"></i> <span>마이점포 전상품 리스트</span></a></li>
					<li><a class="nav-link scrollto"><i class="bx bx-user"></i>
							<span>폐기임박상품 등록 리스트</span></a></li>
					<!--           <li><a href="#about" class="nav-link scrollto"><i class="bx bx-user"></i> <span>폐기임박상품 등록 리스트</span></a></li> -->
					<li><a class="nav-link scrollto"><i
							class="bx bx-file-blank"></i> <span>폐기임박상품 리스트</span></a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->
		</div>

	</header>
	</div>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<div id="page-right">
	<main id="main">
		<div class="container">
			<div class="row">
			<form id="loadUrl">
				<!-- 여기에 page ajax로 load -->
				<div class="col-md-12">
					<h1 id="loadKind" class='col-md-10'></h1>
				</div>
				
				<div id="loadPage">
						
				</div>
			</form>
			</div>
		</div>
	</main>

	</div>
	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>iPortfolio</span></strong>
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End  Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	
	</div> <!-- 전체 끝 -->

	<!-- Vendor JS Files -->
	<script src="${app}/resources/manager/vendor/aos/aos.js"></script>
	<script
		src="${app}/resources/manager/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${app}/resources/manager/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${app}/resources/manager/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${app}/resources/manager/vendor/php-email-form/validate.js"></script>
	<script
		src="${app}/resources/manager/vendor/purecounter/purecounter.js"></script>
	<script
		src="${app}/resources/manager/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${app}/resources/manager/vendor/typed.js/typed.min.js"></script>
	<script
		src="${app}/resources/manager/vendor/waypoints/noframework.waypoints.js"></script>
	<!-- Template Main JS File -->
	<script src="${app}/resources/manager/js/main.js"></script>

</body>

</html>