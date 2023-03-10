<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<style>
	table{
		text-align: center;
		width: 500px;
	}
	th, td{
		border-bottom: 1px solid black;
	}
	.delBtn{
		width: 45px;
		height: 26PX;
		background-color: red;
		color: white;
		border: none;
		font-size: 12px;
		font-weight: 600;
	}
</style>
</head>
<body>
	<h1>즐겨찾기 목록</h1>
	<table>
		<thead>
			<tr>
				<th>No.</th>
				<th>이름</th>
				<th>주소</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="site" items="${siteList }" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${site.name }</td>
				<td>${site.url }</td>
				<td><button type="button" class="delBtn" data-site-name="${site.id }">삭제</button></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="addList">
		<a href="/ajax/site/input">추가하기</a>	
	</div>
	
	<script>
		$(document).ready(function(){
			
			//id는 하나만 관리하기 위한 것이기 때문에 id로 접근하면 안되고
			//class로 선언해야 모든 삭제 버튼에 접근 가능하다.
			$(".delBtn").on("click", function(){
				
				var siteId = $(this).data("siteName");
				
				$.ajax({
					type:"post",
					url: "/ajax/site/deleteById",
					data:{
						"id": siteId,
					},
					success:function(res){
						if(res.result){
							//성공하면 새로고침
							location.reload();
						}
						else{
							alert("삭제가 안되었습니다.");
						}
					},
					error:function(err){
						alert('error');
					}
				})
			})
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>