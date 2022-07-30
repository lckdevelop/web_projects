$(document).ready(function() {
	$('#loginBtn').click(function() {
		$(location).attr('href', 'login');
	});
	
	$('#joinBtn').click(function() {
		$(location).attr('href', 'join');
	});
	
	$('#resvCkBtn').click(function() {
		$(location).attr('href', 'home');
		alert('로그인 하세요.');
	});

	$('#btnResv').click(function() {
		$(location).attr('href', 'reserve');
	});
		 
});