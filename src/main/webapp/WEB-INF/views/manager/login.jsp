<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="app" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/favicon.PNG">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>ThankStore 로그인</title>
    <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
</head>

<body class="h-100">
<form method="post">
    <!--*******************
        Preloader start
    ********************-->
    <div>
    </div>
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <div class="login-form-bg h-100"  style="margin: 200px">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="./"> <h4>THANK STORE</h4></a>
        
                                <form class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" name="id" class="form-control" placeholder="ID">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password"class="form-control" placeholder="PASSWORD">
                                    </div>
                                    <button class="btn login-form__btn submit w-100" type="submit">로그인</button>
                                </form>
                                <p class="mt-5 login-form__footer">계정이 없으신가요? <a href="./manager/signup" class="text-primary">계정 만들기</a></p> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${app}/resources/quixlab/themes/quixlab/plugins/common/common.min.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/custom.min.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/settings.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/gleek.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/styleSwitcher.js"></script>
</form>
</body>
</html>





