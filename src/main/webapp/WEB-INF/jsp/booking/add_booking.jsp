<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 하기</title>
<%-- style --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/booking/add_booking.css">
<%-- jquery & boot --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<%-- datepiker --%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap"class="container">
		<header class="d-flex justify-content-center align-items-center">
			<div><span class="logo-font">통나무 팬션</span></div>
		</header>
		<nav class="menu">
			<ul class="nav nav-fill">
				<li class="nav-item">
					<a href="#" class="nav-link">팬션소개</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">객실보기</a>
				</li>
				<li class="nav-item">
					<a href="/booking/add_booking_view" class="nav-link">예약하기</a>
				</li>
				<li class="nav-item">
					<a href="/booking/booking_list" class="nav-link">예약목록</a>
				</li>
			</ul>
		</nav>
		<div class="contents">
			<div class="content-add">
				<div class="list-title my-3 d-flex justify-content-center">예약 하기</div>
				<div class="d-flex justify-content-center">
					<div class="form-group col-6">
						<label for="name"><b>이름</b></label>
						<input type="text" id="name" class="form-control">
						<label for="date" class="mt-2"><b>예약날짜</b></label>
						<input type="text" id="date" class="form-control">
						<label for="day" class="mt-2"><b>숙박일수</b></label>
						<input type="text" id="day" class="form-control">
						<label for="headcount" class="mt-2"><b>숙박인원</b></label>
						<input type="text" id="headcount" class="form-control">
						<label for="phoneNumber" class="mt-2"><b>전화번호</b></label>
						<input type="text" id="phoneNumber" class="form-control">
						<button type="button" id="bookingBtn" class="mt-4 btn btn-warning form-control">예약하기</button>
					</div>
				</div>
			</div>
		</div>
		<footer class="d-flex align-items-center">
			<address class="foot-font">제주특별자치도 제주시 애월옵<br>
			사업자등록번호:111-22-255222/농어촌민박사업자지정/대표:김통목<br>
			Copyright 2025 tongnamu. All right reserved.
			</address>
		</footer>
	</div>
<script>
$(document).ready(function(){
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames:['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort:['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear:true,
		yearSuffix: '년'
		});
		
	$('#date').datepicker();
		
	$('#bookingBtn').on('click',function(){
		let name = $("#name").val().trim();
		if(!name){
			alert("이름을 입력해주세요");
			return;
		}
		let date = $("#date").val().trim();
		if(!date){
			alert("예약날짜를 입력해주세요");
			return;
		}
		let day = $("#day").val().trim();
		if(!day){
			alert("숙박일수를 입력해주세요");
			return;
		}
		let headcount = $("#headcount").val().trim();
		if(!headcount){
			alert("숙박인원을 입력해주세요");
			return;
		}
		let phoneNumber = $("#phoneNumber").val().trim();
		if(!phoneNumber){
			alert("전화번호 입력해주세요");
			return;
		}
		if(!phoneNumber.match('-')){
			alert("'-'를 포함하여 전화번호를 입력해주세요");
			return;
		}
		console.log(name);
		console.log(date);
		console.log(day);
		console.log(headcount);
		console.log(phoneNumber);
			
		// ajax 통신
		$.ajax({
				
			// request
			type:"POST"
			, url:"/booking/add_booking"
			, data:{
				"name":name,
				"date":date,
				"day":day,
				"headcount":headcount,
				"phoneNumber":phoneNumber}
			// response
			, success:function(data){
				if(data.code == 1){
					location.href="/booking/booking_list";
				} else{
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error){
				alert(request);
				alert(status);
				alert(error);
			}
		});
	});
});
</script>	
</body>
</html>