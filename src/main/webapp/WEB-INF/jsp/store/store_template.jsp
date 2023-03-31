<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/lesson02/store_main.css">
<%-- jquery --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap"class="container bg-lighter">
		<header class="d-flex align-items-center bg-info">
			<span class="logo-font">배탈의 민족</span>
		</header>
		<div class="contents">
			<div class="title-box d-flex align-items-center bg-warning">
				<span class="title">우리동네 가게</span>
			</div>
			<c:forEach items="${storeList}" var="store">
			<a href="/store/reviews?storeId=${store.id}&storeName=${store.name}">
				<div class="content1 d-flex align-items-center my-4">
					<div class="ml-4 mb-1">
						<div class="store-font">${store.name}</div>
						<div class="info-font">전화 번호 : ${store.phoneNumber}</div>
						<div class="info-font">주소 : ${store.address}</div>
					</div>
				</div>
			</a>
			</c:forEach>
			<hr>
		</div>
		<footer>
			<div>
				<div class="footer-font1">(주)우와한형제</div>
				<div class="footer-font2">고객센터 : 1500-1500</div>
			</div>
		</footer>
	</div>
</body>
</html>