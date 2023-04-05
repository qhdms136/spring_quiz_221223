<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과창</title>
<%-- style --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/lesson06/result_favorite.css">
<%-- jquery & boot --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${favoriteList}" var="favorite">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td><a href="${favorite.url}" class="url-font" target="_blank">${favorite.url}</a></td>
					<%-- <td><button type="button" class="del-btn btn btn-danger" value="${favorite.id}">삭제</button></td> --%>
					<td><button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
<script>
$(document).ready(function(){
	
	// (1)
	/* $('.del-btn').on('click', function(e){
		let id = e.target.value;
		// let id = $(this).val();
		alert(id);
	}); */
	
	// (2)
	// data-favorite-id 태그에 값을 심어 놓는다.  data-  그 뒤부터는 이름을 직접 짓는다. (!!!!! 대문자 들어가면 안됨 camel X)
	// 스크립트 : $(this).data('favorite');
	$('.del-btn').on('click', function(){
		let id = $(this).data('favorite-id');
		//alert(id);
		
		$.ajax({
			
			// request
			type:"post"
			, url:"/lesson06/quiz01/delete_favorite"
			, data:{"id":id}
		
			// response
			, success:function(data){
				if(data.code == 1){
					location.reload(true); // 새로고침 (장점 : 현재 위치 고정)
				} else{
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error){
				alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요");
			}
		});
	});
	
});
</script>	
</body>
</html>