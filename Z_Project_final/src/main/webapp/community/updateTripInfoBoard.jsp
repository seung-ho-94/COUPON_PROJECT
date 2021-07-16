<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

	<title>여행 정보 게시판</title>
	<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
<%@ include file="header.jsp" %>
</head>
<body>
<div class="container pt-3"> 
	<div class="row"> 
		<!-- 왼쪽 사이드 바 --> 
		<div class="col-sm-3"> 
			<h3>커뮤니티</h3> 
			<ul class="list-group"> 
			<li class="list-group-item list-group-item-action">
			<a href="selectFreeBoardList.do">자유 게시판</a></li> 
			<li class="list-group-item list-group-item-action">
			<a href="selectTripInfoBoardList.do">여행 정보</a></li> 
			<li class="list-group-item list-group-item-action">
			<a href="#">리뷰 게시판</a></li> 
			</ul> 
		</div> 
		<!-- 중앙 내용 --> 
		<div class="col-sm-8"> 
		<h2>여행 정보 - 글 수정</h2>
		<div class="container">
			<div class="table-responsive">
	 			<form action="updateTripInfoBoard.do" method="post" id="update" enctype="multipart/form-data">
				<input type="hidden" name="no" value="${detail.no }"> 
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width:auto;" />
					<col style="width:auto;" />
					<col style="width:auto;" />
					<col style="width:auto;" />
					<col style="width:auto;" />
				</colgroup>
				<tr class="mb-3">
					<th width="70">제목</th>
					<td>
						<input type="text" name="title" size="30"
								value="${detail.title }">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${detail.id }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="10" cols="40">${detail.content } </textarea>
					</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${detail.regdate }</td>
				</tr>
		<%-- 		<tr>
					<th>첨부 파일</th>
					<td>
						<input type="file" name="attach_file"> 
						${freeDetail.attach_file }
					</td>
				</tr> --%>
			</table>
			<div>
				<input type="submit" value="수정" class="btn btn-sm btn-primary">
				<input type="button" value="목록" class="btn btn-sm btn-primary" 
							onclick="location.href='selectTripInfoBoardList.do'">
			</div>
	 			</form> 
			</div>
		</div>
	</div>
</div>
</div>
</body>
 <%@ include file="footer.jsp" %>
</html>





