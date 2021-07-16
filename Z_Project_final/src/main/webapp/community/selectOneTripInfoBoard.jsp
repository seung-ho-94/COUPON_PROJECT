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

<title>커뮤니티</title>
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
		<h2>여행 정보 - 상세 보기</h2>
		<div class="table-responsive">

		<table class="table table-striped table-sm">
			<colgroup>
				<col style="width:auto;" />
				<col style="width:auto;" />
				<col style="width:auto;" />
				<col style="width:auto;" />
				<col style="width:auto;" />
				<col style="width:auto;" />
			</colgroup>
			<tr>
				<th width="70">제목</th>
				<td>${detail.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${detail.id }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${detail.content }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${detail.regdate }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${detail.hit }</td>
			</tr>
			<c:if test="${detail.file_name ne null}">
			<tr>
				<th>업로드 파일</th>
				<td><img src="../Resources/img/${detail.file_name}" width="300"/></td>
			</tr>
			</c:if>
		</table>
		<c:if test="${sessionScope.loginId == detail.id}">
		<div>		
			<button type="button" class="btn btn-sm btn-primary"
					onclick="location.href='updateTripInfoBoard.do?no=${detail.no }'">수정</button>
			<button type="button" class="btn btn-sm btn-primary" 
					onclick="location.href='deleteTripInfoBoard.do?no=${detail.no }'">삭제</button>
		</div>
		</c:if>
	</div>
	<!-- ===== 댓글 ===== -->
	<!-- 댓글 목록 -->
	<article>
		<div class="container">
		<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
			<table class="table table-striped table-sm">
				<c:if test="${not empty commList }">
					<c:forEach var="commList" items="${commList }">
						<tr>
							<td width="150">
								<div>${commList.id } 
									<font size="2" color="lightgray">${commList.regdate }</font>
								</div>
							</td>
							<td width="550">
								<div>${commList.content }
									<c:if test="${sessionScope.loginId == commList.id}">
										<form action="deleteTripInfoBoardComment.do?no=${commList.no }" method="post">	
											<input type="hidden" name="board_no" value="${commList.board_no }">
											<input type="submit" class="btn btn-sm btn-primary" value="댓글 삭제">
											<input type="button" class="btn btn-sm btn-primary" onclick="updateTripInfoBoardComment(${commList.no })" value="댓글 수정">
										</form>								
									</c:if>	
								</div>
							</td>
						</tr>
					</c:forEach>	
				</c:if>
				<c:if test="${empty commList }">
					<tr>
						<td colspan="3" class="center"> 등록된 댓글이 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>
		
		<!-- 댓글 작성 -->
		<c:if test="${sessionScope.loginId != null}">
		<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
			<form action="insertTripInfoBoardComment.do" method="post">
				<input type="hidden" id="board_no" name="board_no" value="${detail.no }" />
				<div class="row">
					<div class="col-sm-5">
						<label for="id">작성자</label>
						<input type="text" class="form-control" name="id" value="${sessionScope.loginId}" readonly>
					</div>
				<div class="col-sm-10">
					<label for="content">내용</label>
					<textarea class="form-control" name="content" placeholder="내용을 입력 해주세요" ></textarea>
				</div>
				</div>
				<div>
					<button type="submit" class="btn btn-sm btn-primary">작성</button>
				</div>
			</form>
		</div>
		</c:if>
		<c:if test="${sessionScope.loginId == null}">
			<div class="fa fa-edit"> 로그인 한 사용자만 댓글 등록이 가능합니다. </div>
		</c:if>
		</div>
		<div style="text-align: center;">
			<button type="button" class="btn btn-sm btn-primary" 
					onclick="location.href='selectTripInfoBoardList.do'">목록</button>
		</div>
		</article>	
	</div>
	</div>
</div>
<script>
	function updateTripInfoBoardComment(no) {
		window.open("updateTripInfoBoardComment.do?no="+no),
					 "width=300, height=350, resizable=no, scrollbars=no";
	}

</script>
</body>
 <%@ include file="footer.jsp" %>
</html>





