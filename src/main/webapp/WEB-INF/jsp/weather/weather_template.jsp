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
<link rel="stylesheet" href="/css/lesson05/weather_main.css">
<%-- jquery --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap" class="bg-dark">
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
			<div class="contents bg-info">
				<h1>과거 날씨</h1>
				<table class="table">
					<thead>
					<tr>
						<th>날짜</th>
						<th>날씨</th>
						<th>기온</th>
						<th>강수량</th>
						<th>미세먼지</th>
						<th>풍속</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${weathers}" var="weather" varStatus="status">
							<tr>
								<td>
									<fmt:parseDate value="${weather.date}" pattern="yyyy-MM-dd HH:mm:SS" var="date1"/>
									<fmt:formatDate value="${date1}" pattern="yyyy년 M월 d일"/>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<footer class="bg-warning d-flex " >
		<div class="logo2 d-flex justify-content-center align-items-center">
			<img src="/img/sig3.png" width="200">
		</div>	
			<address class="d-flex align-items-center ml-4 text-muted">(07062) 서울시 동작구 여의대방로16길 61<br>
			Copyright@2023 KMA. All Rights RESERVED</address>
		</footer>
	</div>
</body>
</html>