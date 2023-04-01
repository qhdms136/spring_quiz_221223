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
<link rel="stylesheet" href="/css/lesson02/reviews.css">
<%-- jquery --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap"class="container bg-lighter">
		<header class="d-flex align-items-center bg-info">
			<a class="logo-font" href="/store/store_template">배탈의 민족</a>
		</header>
		<div class="contents">
			<div class="title-box d-flex align-items-center">
				<span class="title">${storeName} - 리뷰</span>
			</div>
			<c:forEach items="${reviewList}" var="review" varStatus="status">
				<div class="content1 d-flex align-items-center my-4">
					<div class="ml-4">
						<div class="d-flex align-items-center mt-3">
							<div class="store-font">${review.userName}</div>
							<div class="ml-3">
								<c:forEach begin="1" end="${review.point - (review.point % 1)}" step="1">
								<img src="/img/star_fill.png" width="25">
								</c:forEach>
								<c:if test="${(review.point % 1) == 0.5}">
								<img src="/img/star_half.png" width="25">
								</c:if>
								<c:forEach begin="1" end="${(5 - review.point) - (review.point % 1)}" step="1">
								<img src="/img/star_empty.png" width="25">
								</c:forEach>
							</div>
						</div>
							<div class="info-cdate"><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월 d일"/></div>
							<div class="info-review my-2">${review.review}</div>
							<span class="info-menu">${review.menu}</span>
					</div>	
				</div>
			</c:forEach>
			<c:if test="${empty reviewList}"><div class="none-review">작성된 리뷰가 없습니다.</div></c:if>
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