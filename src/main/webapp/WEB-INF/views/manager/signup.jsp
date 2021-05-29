<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="app" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
</head>

<body class="h-100">
    <form method="post">
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
    <div class="login-form-bg h-100"  style="margin: 200px">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                
                                    <a class="text-center" href="index.html"> <h4>회원 가입</h4></a>
        
                                <form class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="id" placeholder="아이디" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="password" placeholder="비밀번호" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="name" placeholder="이름" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="accountno" placeholder="계좌번호" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="storecode" placeholder="편의점 코드" required>
                                    </div>
                                    <button class="btn login-form__btn submit w-100" type="submit">가입 하기</button>
                                </form>
                                    <p class="mt-5 login-form__footer">계정이 있으신가요? <a href="../manager" class="text-primary"> 로그인 </a> 하기</p>
                                    </p>
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





