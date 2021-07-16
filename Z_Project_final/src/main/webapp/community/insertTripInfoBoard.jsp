<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>커뮤니티</title>
<style>
	body {
	  padding-top: 70px;
	  padding-bottom: 30px;
	}
</style>
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
		<h2>여행 정보 - 글 작성</h2>
			<div class="container" role="main">
				<form action="insertTripInfoBoard.do" method="post" enctype="multipart/form-data">
					<div class="mb-3">
						<label for="title">제목</label>
						<input type="text" class="form-control" name="title" placeholder="제목을 입력 해주세요">
					</div>
					<div class="mb-3">
						<label for="id">작성자</label>
						<input type="text" class="form-control" name="id" value="${sessionScope.loginId}" readonly>
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content" placeholder="내용을 입력 해주세요" ></textarea>
					</div>
					<div class="mb-3">
						<label for="content">첨부 파일</label>
						<input type="file" class="form-control" name="attach_file" placeholder="파일을 업로드 해주세요">
					</div>
					<div>
						<input type="submit" value="등록" class="btn btn-sm btn-primary">
						<input type="button" value="목록" class="btn btn-sm btn-primary" 
								onclick="location.href='selectTripInfoBoardList.do'">
					</div>
				</form>
			</div>	
		</div>
	</div>
</div>
</body>
 <%@ include file="footer.jsp" %>
</html>








