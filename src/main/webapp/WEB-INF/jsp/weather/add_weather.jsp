<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/lesson05/add_weather.css">
<%-- jquery --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<%-- datepiker --%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="d-flex">
			<header>
				<div class="logo d-flex justify-content-center align-items-center">
					<img src="/img/sig2.png" width="50" class="mx-2"><span class="logo-font">기상청</span>
				</div>
				<nav class="menu">
					<ul class="nav flex-column">
						<li class="nav-item">
							<a href="#" class="nav-link">날씨</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">날씨입력</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">테마 날씨</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">관측 기후</a>
						</li>
					</ul>
				</nav>
			</header>
			<div class="contents pt-3">
					<h1>날씨 입력</h1>	
					<form method="post" action="/lesson05/add_weather_view">
					<div class="d-flex justify-content-between">
							<div class="d-flex align-items-center">
								<label for="date">날짜</label>
								<input id="date" name="date" class="form-control mx-2">
							</div>
							<div class="d-flex align-items-center">
								<label for="weather">날씨</label>
								<select id="weather" name="weather" class="form-select mx-2 form-control">
									<option value="비">비</option>
									<option value="흐림">흐림</option>
									<option selected value="맑음">맑음</option>
									<option value="구름조금">구름조금</option>
								</select>
							</div>
							<div class="d-flex align-items-center">
								<label for="microDust">미세먼지</label>
								<select id="microDust" name="microDust" class="form-select mx-2 form-control">
									<option selected value="좋음">좋음</option>
									<option value="보통">보통</option>
									<option value="나쁨">나쁨</option>
									<option value="최악">최악</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-between">
							<div class="input-group d-flex align-items-center col-4">
								<label for="temperatures">기온</label>
								<input id="temperatures" class="form-control ml-2">
								<span class="input-group-text">℃</span>
							</div>
							<div class="input-group d-flex align-items-center col-4">
								<label for="precipitation">강수량</label>
								<input id="precipitation" class="form-control ml-2">
								<span class="input-group-text">mm</span>
							</div>
							<div class="input-group d-flex align-items-center col-4">
								<label for="windSpeed">풍속</label>
								<input id="windSpeed" class="form-control ml-2">
								<span class="input-group-text">km/h</span>
							</div>
						</div>
						<button type="submit" class="btn btn-success">저장</button>
					</form>
			</div>
		</div>
		<footer class="d-flex">
		<div class="logo2 d-flex justify-content-center align-items-center">
			<img src="/img/sig3.png" width="200">
		</div>	
			<address class="d-flex align-items-center ml-4 text-muted">(07062) 서울시 동작구 여의대방로16길 61<br>
			Copyright@2023 KMA. All Rights RESERVED</address>
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
		});
	</script>
	<style>
		.ui-datepicker { width: 17em; padding: .2em .2em 0; display: none; font-size: 20px;}
	</style>
</body>
</html>