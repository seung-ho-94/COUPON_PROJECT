<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 QNA</title>
	<style>
		#main-css {
			position: relative;
			margin:0 15% 0 15%;
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
			<h3 class="center">1:1문의</h3>
			<hr>
			
			<div class="grid">
				<c:forEach var="status" items="${qnaStatusList }">
					<div class="status-content">
						<a class="nav-link btn btn-outline-primary" href="QNAList.do?status=${status }">${status }</a>
					</div>
				</c:forEach>
			</div>
			<br><br>
			
			<table class="table table-hover center">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">아이디</th>
						<th scope="col">제목</th>
						<th scope="col">이메일</th>
						<th scope="col">날짜</th>
						<th scope="col">문의유형</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${qnaList }">
					<tr onclick="location.href='qnaGetBoard.do?no=${list.no }'">
						<td>${list.no }</td>
						<td>${list.id }</td>
						<td>${list.title }</td>
						<td>${list.email }</td>
						<td>${list.regdate }</td>
						<td>${list.category }</td>
						<td>${list.status }</td>
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