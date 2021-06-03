<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Thank Store</title>
        <!-- Favicon icon -->
		<link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/favicon.PNG">
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/home/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
    <%-- <div style="size:100%;padding:0px;margin:0px;">
    	<section class="page-section" id="services" style="margin:50px 600px 3rem 600px; border-radius: 25px; background-color:#fff3cc;border-color:#5cb85c; border:15px solid #5cb85c;">
    		<div class="container" style="text-align:center">
                <!-- <div class="masthead-subheading" style="color:orange;" >THANK STORE</div> -->
                <div>
                	<img src="${app}/resources/home/assets/img/logo_copy.png">
                </div>
                <div class="masthead-heading text-uppercase" style="color:#5cb85c; font-size:2rem;">알뜰한 당신을 위한 우리동네 편의점</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="customer" style="width:240px; height:70px; padding:auto; margin:10px;">회원이신가요?</a>
                <a class="btn btn-primary btn-xl text-uppercase" href="manager" style="width:240px; height:70px; padding-left:20px; padding-right:20px; margin:10px;">점포 업주이신가요?</a>
            </div>
        </section>
	</div> --%>
	<header style=" height: 75px;
		position:fixed;
		padding: 0;
		background-color: #fff3cc;
		color: #ff8a3d;
		font-weight: bold;
		display: flex;
		justify-content: space-between;
		align-items: center;
		top: 0;
		width: 100%;
		height:93px;
		opacity: 1;
		">
	  <h1 style="width:300px; height:100px;" ><img style="width:300px; height:100px;" src="${app}/resources/home/assets/img/logo_copy.png"></h1>
	  <nav>
	    <a class="btn btn-primary btn-xl text-uppercase" href="customer" style="width:240px; height:70px; padding:auto; margin:10px;">회원이신가요?</a>
	    <a class="btn btn-primary btn-xl text-uppercase" href="manager" style="width:240px; height:70px; padding-left:20px; padding-right:20px; margin:10px 50px 10px 10px;">점포 업주이신가요?</a>
	    
	  </nav>
	  
	</header>

    	<!-- Masthead-->
        <header class="masthead" style="width:1900px; padding:0px;height:1081px; margin:0;opacity:1">
        	<p style="width: 1900px;
				  height: 600px;
				  position: absolute;
				  top: 0;
				  left: 0;
				  margin:300px 180px 400px 180px;
				  font-size:5rem;
				  font-weight:bold;
				  text-align:center;
				  text-shadow: -1px 0 #ff8a3d, 0 1px #ff8a3d, 1px 0 #ff8a3d, 0 -1px #ff8a3d;
				  ">
        	알뜰한 당신을 위한 <br>우리동네 편의점 플랫폼
        	</p>
            
        </header>
        <!-- Services-->
        <section class="page-section" id="services" style="background-color:white;padding-bottom: 3rem;padding-top:100px;">
        	
            <div class="container" style="width:1200px;">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase"style="font-size:3rem;">서비스</h2>
                    <h3 class="section-subheading text-muted" style="font-size:2rem;">편의점 마감임박 상품 구매 서비스</h3>
                </div>
                <div class="row text-center"style="width:1200px;">
                    <div class="col-md-4" style="width:600px; padding:30px">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-user fa-stack-1x fa-inverse"></i>
                            
                        </span>
                        <h4 class="my-3" style="font-size:3rem;">소비자</h4>
                        <p class="text-muted" style="padding:10px;font-size:1rem;">마감 임박 상품을 정가보다 저렴한 가격에    구매할 수 있습니다!</p>
                    </div>
                    <div class="col-md-4" style="width:600px;padding:30px">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-store fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3" style="font-size:3rem;">편의점</h4>
                        <p class="text-muted" style="padding:10px; font-size:1rem;">마감이 임박한 상품을 판매하여 폐기처분되는 경우를 줄일 수 있습니다!</p>
                    </div>                   
                </div>
            </div>
        </section>
		
        <!-- Footer-->
        <footer class="footer py-4" style="background-color:white">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">
                        Copyright &copy; Thank Store
                        <!-- This script automatically adds the current year to your website footer-->
                        <!-- (credit: https://updateyourfooter.com/)-->
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                    </div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <!-- 여기 잠깐 주석처리 -->
		<script src="resources/home/js/scripts.js"></script>
    </body>
</html>
