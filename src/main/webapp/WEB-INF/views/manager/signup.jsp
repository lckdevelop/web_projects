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
	<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
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
                                
                                    <a class="text-center" href="./"> <h4>회원 가입</h4></a>
        
                                <form class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="id" name="id" placeholder="아이디 (4~12 글자)" required>
                                    </div>
                                    <div class="check_font" id="id_check">
                                    </div>
                                    
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="secondpassword" name="secondpassword" placeholder="비밀번호 확인" required>
                                    </div>
                                    
                                    <div class="check_font" id="pw_check">
                                    </div>
                                    
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="name" placeholder="이름" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="accountno" placeholder="계좌번호" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="storecode" name="storecode" placeholder="편의점 코드" required>
                                    </div>
                                    
                                    <div class="check_font" id="storecheck">
                                    </div>

                                    <button class="btn login-form__btn submit w-100" id="reg_submit" type="submit">가입 하기</button>
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
    <script>
    	$("#id").blur(function() {
		// id = "id_reg" / name = "userId"
		var id = $('#id').val();
		var idJ = /^[a-z0-9]{4,12}$/;
		$.ajax({
			url : "${pageContext.request.contextPath}/manager/idCheck?id="+ id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
						console.log("중복인지 확인 완료");
					} else {
						
						if(idJ.test(id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("사용 가능한 아이디 입니다.");
							$('#id_check').css('color', 'green');
							$("#reg_submit").attr("disabled", false);
							console.log("아이디 길이/ 문자열 맞는지 확인 완료");
				
						} else if(id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
							console.log("아이디 입력 되어있는지 확인 완료");
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
							console.log("아이디 형식 맞는지 확인 완료");
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
		$('#password').keyup(function(){
			if($("#secondpassword").val()==''){
				$("#pw_check").text("비밀번호를 한번 더 입력해주세요.");
				$("#pw_check").css("color", "red");
				$("#reg_submit").attr("disabled", true);
			}
			else if($("#password").val() == $("#secondpassword").val()){
				$("#pw_check").text("비밀번호가 일치합니다.");
				$("#pw_check").css("color", "green");
				$("#reg_submit").attr("disabled", false);
			}
		   else{
			   	$("#pw_check").text("비밀번호가 일치하지 않습니다.");
				$("#pw_check").css("color", "red");
				$("#reg_submit").attr("disabled", false);
				
		   }
		   
		});
		
		$('#secondpassword').keyup(function(){
			if($("#password").val() == $("#secondpassword").val()&&$("#password").val()!=''){
		    	if($("#secondpassword").val()!=''){
		    		$("#pw_check").text("비밀번호가 일치합니다.");
					$("#pw_check").css("color", "green");
					$("#reg_submit").attr("disabled", false);
		       }
		    }
		   else{
			   	$("#pw_check").text("비밀번호가 일치하지 않습니다.");
				$("#pw_check").css("color", "red");
				$("#reg_submit").attr("disabled", false);
				
		   }
		   
		});
 
		
		$("#storecode").keyup(function() {

			var storecode = $('#storecode').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/manager/cvstoreoccupiedcheck?storecode="+ storecode,
				type : 'get',
				success : function(data) {
					console.log("1 = 미등록된 편의점코드 / 0 = 기등록된 편의점코드 : "+ data);							
					console.log("스토어코드: "+storecode);
					if (data == 0) {
							$("#storecheck").text("");
							$("#storecheck").text("이미 등록되었거나 존재하지 않는 편의점 코드 입니다.");
							$("#storecheck").css("color", "red");
							$("#reg_submit").attr("disabled", true);
						}
					else{
						$("#storecheck").text("사용 가능한 편의점 코드 입니다.");
						$("#storecheck").css("color", "green");
						$("#reg_submit").attr("disabled", false);
					}
					
					}, error : function() {
							console.log("실패");
					}
				});
			});

	</script>
    <script src="${app}/resources/quixlab/themes/quixlab/plugins/common/common.min.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/custom.min.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/settings.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/gleek.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/styleSwitcher.js"></script>
</form>
</body>
</html>





