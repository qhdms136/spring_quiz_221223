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
		<div class="form-group">
			<label for="name" class="mt-2"><b>제목</b></label>
			<input type="text" id="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="url" class="mt-2"><b>URL 주소</b></label>
			<div class="d-flex">
				<input type="text" id="url" class="form-control col-11">
				<button type="button" class="btn btn-info col-1" id="urlCheckBtn">중복확인</button>
			</div>
				<small id="urlStatusArea"><span></span></small>
		</div>
			<div class="mt-3">
		<input type="button" id="addBtn" value="추가" class="mt-2 btn btn-success col-12">
		</div>
	</div>
<script>
	$(document).ready(function(){
		// 중복확인 버튼
		$("#urlCheckBtn").on("click", function(){
			// urlStatusArea 하위 태그 초기화
			$("#urlStatusArea").empty();
			
			let url = $("#url").val().trim();
			
			if(url == ""){
				$("#urlStatusArea").append('<span class="text-danger">url을 입력해주세요</span>');
				return;
			}
			
			// ajax 통신
			$.ajax({
				// request
				type:"GET"
				, url:"/lesson06/quiz01/is_duplication"
				, data:{"url":url}
			
				//response
				, success:function(data){
					if(data.isDuplication == true){
						$("#urlStatusArea").append('<span class="text-danger">중복된 url 입니다.</span>');
					}
				}
				, error:function(request, status, error){
					alert(request);
					alert(status);
					alert(error);
				}
			});
		});
		
		// 추가 버튼
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
			// http도 아니고 https도 아닐 때 잘못된 주소
			if(url.startsWith("http://") == false && url.startsWith("https://") == false){
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
				, success:function(data){		// jquery ajax 함수가 json string을 object로 파싱해줌
					/* alert(data.code);
					alert(data.result); */
					if (data.code == 1){
						location.href="/lesson06/quiz01/result_favorite"
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