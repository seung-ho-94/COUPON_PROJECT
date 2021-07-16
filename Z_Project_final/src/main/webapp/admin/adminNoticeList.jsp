<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 데이터를 화면 출력 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script>
    function insertNotice(){
    	location.href = "insertNotice.do";
    }
</script>
<style>
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
<div id="main-css">
<h3 align="center" class="contact-title">관리자 공지사항</h3>
<hr>
</div>
<section class="ftco-section">

			
<div id="container" align="center">
	<table class="table table-striped table-hover" style="width: 60%" >
	<thead>
		<tr>
			<td>No.</td>
			<td width="45%">제목</td>
			<td>작성자</td>
			<td>작성날짜</td>
			<td>조회수</td>		
		</tr>
	 </thead>
	 <tbody>
		<c:forEach items="${viewAll }" var="list">
			<tr onclick="location.href='getBoard2.do?no=${list.no }'">
				<td>${list.no }</td>
				<td>${list.title }</td>
				<td>${list.id }</td>
				<td><fmt:formatDate value="${list.regdate }" pattern="yyyy.MM.dd"/> </td>
				<td>${list.hit }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<button type="button" class="btn btn-primary" onclick="insertNotice()">글쓰기</button>
	<form action="getBoardListNotice2.do">
	<table class="border-none">
		<tr>
			<td>
				<select name="searchCondition">
					<option value="TITLE">제목
					<option value="CONTENT">내용
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	<br>
	<!-- 페이징 -->
	<div class="center">
	<div class="pagination">
		<c:if test="${paging.startPage != 1 }">
			<a href="/getBoardListNotice2.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition}&searchKeyword=${paging.searchKeyword}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="now">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/getBoardListNotice2.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition}&searchKeyword=${paging.searchKeyword}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/getBoardListNotice2.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition}&searchKeyword=${paging.searchKeyword}">&gt;</a>
		</c:if>
	</div>
	</div>
</div>
</section>
</body>
</html>