<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seller 추가_input</title>
</head>
<body>

	<h1>판매자 추가</h1>
	
	<form method = "GET" action="/jsp/seller/create">
		<label>닉네임</label><br />
		<input type = "text" name = "nickname"><br />
		
		<label>프로필 사진 url</label><br />
		<input type = "text" name = "profileImgae"><br />
		
		<label>온도</label><br />
		<input type = "text" name ="temperature"><br />
		
		<button type = "submit">추가</button>
	</form>
</body>
</html>