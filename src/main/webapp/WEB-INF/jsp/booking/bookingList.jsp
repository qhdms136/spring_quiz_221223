<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 보기</title>
<%-- style --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/booking/booking_list.css">
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
		<div class="contents">
			<div class="content-list">
				<div class="list-title my-3 d-flex justify-content-center">예약 목록 보기</div>
				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookingList}" var="booking">
						<tr>
							<td>${booking.name}</td>
							<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 dd일"/></td>
							<td>${booking.day}</td>
							<td>${booking.headcount}</td>
							<td>${booking.phoneNumber}</td>
							<td>
								<c:choose>
									<c:when test="${booking.state eq '대기중'}">
										<span class="text-primary">${booking.state}</span>
									</c:when>
									<c:when test="${booking.state eq '확정'}">
										<span class="text-success">${booking.state}</span>
									</c:when>
									<c:when test="${booking.state eq '취소'}">
										<span class="text-danger">${booking.state}</span>
									</c:when>
								</c:choose>
							</td>
							<td><button type="button" class="del-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
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
	$('.del-btn').on('click',function(){
		let id = $(this).data('booking-id');
		
		// ajax 통신
		$.ajax({
			
			// request
			type:"delete"
			, url:"/booking/delete_booking"
			, data:{"id":id}
		
			// response
			, success:function(data){
				if(data.code == 1){
					alert("삭제 되었습니다.");
					location.reload(true);
				} else{
					alert(errorMessage);
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