<html>
<!DOCTYPE html>
	<head>
<!-- 		<link rel="stylesheet" type="text/css" href="iphone.css" media="only screen and (max-width:480px)"/> -->
<!-- 		<link rel="stylesheet" type="text/css" href="desktop.css" media="screen and (min-width:481px)"/> -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="user-scalable=no, width=device-width" />
		<meta name="apple-mobile-web-app-capable" content="yes"/>
		<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
		
		<script language='javascript' type='text/javascript'>
			var orientationEvent;
			var uAgent=navigator.userAgent.toLowerCase();
			var mobilePhones='android';
			
			if(uAgent.indexOf(mobilePhones)!= -1) {
				orientationEvent="resize"; // 안드로이드는 resize로 들어옴
			}
			else orientationEvent="orientationchange"; // 아이폰은 이렇게 들어옴
			window.addEventListener(orientationEvent, function()
			{
				locaiton.href('#');
			}, false);
			
			var prevScreen = 0;
			var sv_prevScreen = 0;
			
			function prevShow() {
				ScreenShow(prevScreen);
			}
			
			// 서브메뉴를 선택(하단 버튼을 누름)했을 때
			var muCnt = 5; // 서브메뉴
			var scCnt = 12; // 화면
			
			function fncShow(pos) {
				var i = 0;
				
				// 모든 일반화면은 막는다
				for(i=0; i<scCnt; i++) {
					var obj = document.getElementById("s"+i);
					obj.style.display = 'none';
				}
				// 메뉴선택에 따라 중간메뉴div는 보여주고, 누른 버튼의 배경을 바꿔준다.
				for(i=0; i<muCnt; i++) {
					var obj = document.getElementById("menu"+i);
					var obj2 = document.getElementById("m"+i);
					
					if (i == pos) {
						obj.style.display = '';
						obj2.style.background ="#defffd";
					} else {
						obj.style.display = 'none';
						obj2.style.background = "#70a8fa";
					}
				}
			}
			// 총 화면은 12개이고 화면이 선택된 번호에 따라 화면을 보여주는 함수
			var scCnt = 12;
			var ScrObj;
			
			var timer1;
			
			function ScrAnimation() {
				var offset = -50;
				
				if (parseInt(ScrObj.style.left) > 10) {
					ScrObj.style.left = parseInt(ScrObj.style.left) + offset + "px";
					timer1 = setTimeout("ScrAnimation()", 1);
				} else {
					ScrObj.style.left=5;
					clearTimeout(timer1);
				}
			}
			
			function ScreenShow(pos) {
				var i = 0;
				// 모든 메뉴페이지는 막는다.
				for(i=0; i<muCnt; i++) {
					var obj = document.getElementById("menu"+i);
					obj.style.display = 'none';
				}
				
				// 선택된 화면번호의 화면만 보여준다
				for(i=0; i<scCnt; i++) {
					var obj = document.getElementById("s"+i);
						if (i == pos) {
							prevScreen = sv_prevScreen;
							sv_prevScreen = i;
							obj.style.display = '';
							obj.style.position="relative";
							obj.style.top=35;
							obj.style.left=screen.width;
							obj.style.height=screen.height-120;
							
							ScrObj=obj;
							ScrAnimation();
						} else {
							obj.style.display = 'none';
						}
				}
			}
		</script>
		<style type="text/css">
			li {
				text-align:left;vertical-align:middle;margin:2;padding:10;height:20;background-color:#aaaa00;border:2px;solid:red;font-size:16px;
			}
			
			ul {
				text-align:left;vertical-align:middle;margin:2;padding:10;height:20;background-color:#bbaabb;border:2px;solid:red;font-size:16px;
			}
			
		</style>
	</head>
	<body>
	<div align=center>
		<div id="container" style="width:device-width;height:device-height;">
			<div id="header1" style="background-color:#defffd;height:35px;width: 15%;float:left;"onclick=prevShow();>
				<img src="back_btn.png" width=40px height=32px></div>
			<div id="header2" style="background-color:#defffd;height:35px;width: 70%;float:left;">
				<center style="margin:10px"><B>Cotton Resort</B></center></div>
			<div id="header3" style="background-color:#defffd;height:35px;width: 15%;float:left;"onclick=ScreenShow(0);>
				<img src="home_btn.png" width=30px height=32px width=100% height=100%></div>
			<div id="menu0" style="background-color:#70a8fa;display:none;width:device-width"> 
			About Us
				<li onclick='ScreenShow(0);'> PoolRoom </a></li>
				<li onclick='ScreenShow(1);'> SeaViewRoom</li>
				<li onclick='ScreenShow(2);'> DeluxRoom</li>
			</div>
			<div id="menu1" style="background-color:#70a8fa;display:none;width:device-width"> 
			Destination
				<li onclick='ScreenShow(3);'> Location</li>
				<li onclick='ScreenShow(4);'> Transportation</li>
			</div>
			<div id="menu2" style="background-color:#70a8fa;display:none;width:device-width"> 
			Facility
				<li onclick='ScreenShow(5);'> InfinityPool</li>
				<li onclick='ScreenShow(6);'> Wedding</li>
				<li onclick='ScreenShow(7);'> Dining</li>
			</div>
			<div id="menu3" style="background-color:#70a8fa;display:none;width:device-width"> 
			Reservation
				<li onclick='ScreenShow(8);'> Reservation</li>
				<li onclick='ScreenShow(9);'> ReserveToday</li>
			</div>
			<div id="menu4" style="background-color:#70a8fa;display:none;width:device-width"> 
			Notice
				<li onclick='ScreenShow(10);'> Resort</li>
				<li onclick='ScreenShow(11);'> Customer</li>
			</div>
			
			<div id="s0" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="a_01_m.jsp" frameborder="0" border="0" bordercolor="white"
					width=320px height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s1" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="a_02.html" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s2" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="a_03.html" frameborder="0" border="0" bordercolor="white"
					width=320px height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s3" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="b_01.html" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s4" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="b_02.html" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s5" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="c_01.html" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s6" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="c_02.html" frameborder="0" border="0" bordercolor="white"
					width=100% height=420px marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s7" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="c_03.html" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s8" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="d_01_m.jsp" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s9" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="d_02_m.jsp" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s10" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="e_01_m.jsp" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="s11" style="display:none;height:200px;width:device-width;">
				<center>
					<iframe src="e_02_m.jsp" frameborder="0" border="0" bordercolor="white"
					width=100% height=530 marginwidth="0" marginheight="0"
					scroling="no">
					</iframe>
				</center>
			</div>
			<div id="m0" onclick="fncShow(0);" style="position:absolute;bottom:3px;position:absolute;left:1%;background-color:#70a8fa;height:60px;width:18%;float:left;">
				<center>
					<img src="room.png" width=40px height=40px><br>
					<font size=2>About Us</font>
				</center>
			</div>
			<div id="m1" onclick="fncShow(1);" style="position:absolute;bottom:3px;position:absolute;left:21%;background-color:#70a8fa;height:60px;width:18%;float:left;">
				<center>
					<img src="des.png" width=40px height=40px><br>
					<font size=2>Destination</font>
				</center>
			</div>
			<div id="m2" onclick="fncShow(2);" style="position:absolute;bottom:3px;position:absolute;left:41%;background-color:#70a8fa;height:60px;width:18%;float:left;">
				<center>
					<img src="pool.png" width=40px height=40px><br>
					<font size=2>Facility</font>
				</center>
			</div>
			<div id="m3" onclick="fncShow(3);" style="position:absolute;bottom:3px;position:absolute;left:61%;background-color:#70a8fa;height:60px;width:18%;float:left;">
				<center>
					<img src="reserve.png" width=40px height=40px><br>
					<font size=2>Reservation</font>
				</center>
			</div>
			<div id="m4" onclick="fncShow(4);" style="position:absolute;bottom:3px;position:absolute;left:81%;background-color:#70a8fa;height:60px;width:18%;float:left;">
				<center>
					<img src="notice.png" width=40px height=40px><br>
					<font size=2>Notice</font>
				</center>
			</div>
		</div>
	</div>
	</body>
</html>