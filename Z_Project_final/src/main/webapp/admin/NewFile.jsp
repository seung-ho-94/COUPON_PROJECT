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
		
	.pagination {
	  display: inline-block;
	 align-content: center;
	 justify-content: center;
	}

	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
	  border: 1px solid #ddd;
	  margin: 0 4px;
	}
	
	.pagination a.active {
	  background-color: #4CAF50;
	  color: white;
	  border: 1px solid #4CAF50;
	}
	.pagination a.now {
	  background-color: #eaefff;
	  border: 1px solid #1d2557;
	}
	
	.pagination a:hover:not(.active) {background-color: #ddd;} 
	tr{text-align: center;}
	
	#main-css {
         position: relative;
         margin:0 25% 0 25%;
    }
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
	<!-- 페이징 -->
	<div class="center">
	<div class="pagination">
		<c:if test="${paging.startPage != 1 }">
			<a href="/getBoardListNotice2.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="now">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/getBoardListNotice2.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/getBoardListNotice2.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	</div>
	</main>
</body>
</html>