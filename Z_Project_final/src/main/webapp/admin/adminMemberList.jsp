<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
		/* #container {
			width: 1200px;
			position: absolute;
			top: 40%;
			left: 50%;
			transform: translate(-50%, -50%);
		} */
		
		tr{text-align: center;}
</style>
</head>
<body>
	<header>
		<%@include file="adminHeader.jsp"%>
	</header>
	<br><br><br>
	<main>
	<h3 align="center">회원관리</h3>
	<hr>	
	<!-- 검색을 위한 폼  -->
	<form action="memberList.do">
	<table class="border-none" style="float: right">
		<tr>
			<td>
				<select name="searchCondition">
					<option value="NAME">이름
					<option value="ID">아이디
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>	
	</form>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">NAME</th>
				<th scope="col">EMAIL</th>
				<th scope="col">PHONE</th>
				<th scope="col">BIRTH</th>
				<th scope="col">REGDATE</th>
				<th scope="col">STATUS</th>
				<th scope="col">DELETE</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty memberList }">
				<c:forEach var="member" items="${memberList }">
					<tr>
						<td>${member.id }</td>
						<td>${member.name }</td>
						<td>${member.email }</td>
						<td>${member.phone }</td>
						<td>${member.birth }</td>
						<td>${member.regdate }</td>
						<td>
						        <c:if test="${member.status == 1 }">
						            <form action="memberStatus.do">
							            <input type="submit" value="활성화" class="btn btn-primary">
							            <input type="hidden" name="id" value="${member.id }">
							            <input type="hidden" name="status" value="${member.status }">
						            </form>
						        </c:if>
						        <c:if test="${member.status == 0 }">
						            <form action="memberStatus.do">
							            <input type="submit" value="비활성화" class="btn btn-danger">
							            <input type="hidden" name="id" value="${member.id }">
							            <input type="hidden" name="status" value="${member.status }">
						            </form>
						        </c:if>
						</td>
						<td><input type="button" value="삭제" class="btn btn-primary" onclick="location.href='deleteMemberList.do?id=${member.id }'"></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty memberList }">
				<tr>
					<td colspan="5" class="center">데이터가 없습니다</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	</main>
</body>
</html>