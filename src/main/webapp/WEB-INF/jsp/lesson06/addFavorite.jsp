<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
<%-- style --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/lesson06/add_favorite.css">
<%-- jquery & boot --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div id=wrap class="container">
		<h1>즐겨찾기 추가하기</h1>
		<label for="name"><b>제목</b></label>
		<input type="text" id="name" name="name" class="form-control">
		<label for="url"><b>주소</b></label>
		<input type="text" id="url" name="url" class="form-control">
		<div class="mt-3 d-flex justify-content-center">
		<input type="button" id="addBtn" value="추가" class="btn btn-success">
		</div>
	</div>
<script>
	$(document).ready(function(){
		$("#addBtn").on("click", function(){
			// validation
			let name = $("#name").val().trim();
			if(!name){
				alert("제목을 입력하세요");
				return;
			}
			
			let url = $("#url").val().trim();
			if(!url){
				alert("주소를 입력하세요");
				return;
			}
			else if(!url.startsWith('http')){
				alert("http 나 https형식의 주소를 입력해주세요");
				return;
			}
			console.log(name);
			console.log(url);
			
			// AJAX Request
			$.ajax({
				//request
				type:"POST"
				, url:"/lesson06/quiz01/add_favorite"
				, data:{"name":name, "url":url}
				
				// response
				, success:function(data){
					if(data == "성공"){
						location.href="lesson06/quiz01/result_favorite"
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