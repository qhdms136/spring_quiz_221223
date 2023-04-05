<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 보기</title>
<%-- style --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/booking/booking_check.css">
<%-- jquery & boot --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
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
		<section class="banner bg-info">
			<img src="/img/booking/test06_banner1.jpg" id="bannerImage" alt="banner" width="100%">
		</section>
		<div class="contents bg-info d-flex">
			<div class="bg-dark real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">실시간<br>예약하기</div>
			</div>
			<div class="bg-success col-4">
				
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
	  var bannerSrcArr = ['/img/booking/test06_banner1.jpg', '/img/booking/test06_banner2.jpg', '/img/booking/test06_banner3.jpg', '/img/booking/test06_banner4.jpg'];
      var currentIndex = 0;
      setInterval(function() {
          $('#bannerImage').attr('src', bannerSrcArr[currentIndex]);
          currentIndex++;

          if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
              currentIndex = 0;
          }
      }, 3000); // 3초에 한번씩 함수 실행
});
</script>	
</body>
</html>