<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 제휴문의</title>
	<style>
		#main-css {
			position: relative;
			margin:0 25% 0 25%;
		}
		
		.grid {
			text-align: center;
		}
		
		.status-content {
			display:inline-block;
		}
		
		.center {
			text-align: center;
		}
	</style>
</head>
<body>

	<header>
		<%@include file = "adminHeader.jsp" %>
	</header>
	<br><br><br>
	<main>
		<div id="main-css">
			<h3 class="center">제휴문의</h3>
			<hr>
			
			<table class="table table-hover center">
				<thead>
					<tr>
						<th scope="col">NO</th>
						<th scope="col">TITLE</th>
						<th scope="col">CONTENT</th>
						<th scope="col">EMAIL</th>
						<th scope="col">NAME</th>
						<th scope="col">REGDATE</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${list }">
					<tr onclick="location.href='contactGetBoard.do?no=${list.no }'">
						<td>${list.no }</td>
						<td>${list.title }</td>
						<td>${list.content }</td>
						<td>${list.email }</td>
						<td>${list.name }</td>
						<td>${list.regdate }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	
	<footer>
	
	</footer>
	
</body>
</html>