<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 데이터를 화면 출력 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bestrip Travel!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<%@ include file="header.jsp" %>
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
</style>
</head>
<body>
    <!--::industries start::-->
<form action="getBoardListNotice.do" method="post">
    <section class="hotel_list section_padding">
 <%--        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2 class="contact-title" align="center" style="font-size: 29px">베스트립 소식</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach items="${viewAll }" var="list">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <a href='getBoard.do?no=${list.no }'><img src="./Resources/img/gallery/gallery_5.png" alt=""></a>
                        <div class="hover_text">
                        </div>
                        <div class="hotel_text_iner">
                            <h3><a href='getBoard.do?no=${list.no }'>${list.title }</a></h3>
                            <div class="place_review">
                                <i class="ti-instagram"></i>
                                <span>&nbsp;&nbsp;${list.regdate }</span>
                            </div>
                            <p><i class="fas fa-search" style="color: black;">&nbsp;조회수&nbsp;</i>  (${list.hit })</p>
                            
                            <h5>작성자 : <span>관리자</span></h5>
                        </div>
                        
                    </div>
                    <br>
                </div>
            </c:forEach>
            </div>
        </div>
         --%>
<div class="row justify-content-center">
	<table border="1" class="table table-hover" style="width: 60%" >
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
			<tr>
				<td>${list.no }</td>
				<td><a href='getBoard.do?no=${list.no }'>${list.title }</a></td>
				<td>${list.id }</td>
				<td><fmt:formatDate value="${list.regdate }" pattern="yyyy.MM.dd"/> </td>
				<td>${list.hit }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table> 
	</div>
  </section>	
	<!-- 페이징 -->
	<div class="center">
	<div class="pagination">
		<c:if test="${paging.startPage != 1 }">
			<a href="/getBoardListNotice.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="now">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/getBoardListNotice.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/getBoardListNotice.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	</div>
</form>
 
</body>
<%@ include file="footer.jsp" %>
</html>