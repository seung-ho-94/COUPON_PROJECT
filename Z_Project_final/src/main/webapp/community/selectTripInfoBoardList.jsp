<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>커뮤니티</title>

<%@ include file="header.jsp" %>
<script>
	$(document).on('click', '#btnWriteForm', function(e){
		e.preventDefault();
		location.href = "insertTripInfoBoard.do";
	});
</script>
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
		<h2>여행 정보</h2>
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width:5%;" />
						<col style="width:auto;" />
						<col style="width:15%;" />
						<col style="width:10%;" />
						<col style="width:10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty list }">
							<c:forEach var="vo" items="${list }">
								<tr>
									<td class="center">${vo.no }</td>
									<td><a href="selectOneTripInfoBoard.do?no=${vo.no }">${vo.title }</a></td>
									<td>${vo.id }</td>
									<td>${vo.regdate }</td>
									<td>${vo.hit }</td>
								</tr>	
							</c:forEach>
						</c:if>
						
						<c:if test="${empty list }">
							<tr>
								<td colspan="5" class="center">데이터가 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<c:if test="${sessionScope.loginId != null}">
			<div >
				<button type="button" class="btn btn-sm btn-primary"
						onclick="location.href='insertTripInfoBoard.do'">글쓰기</button>
			</div>
			</c:if> 
			<!-- 페이징 처리 -->
			<div id="pagingDiv">
				<ul class="pagination">
					<c:if test="${paging.prev}">
						<li class="page-item"><a class="page-link" href="${paging.startPage - 1 }">이전</a></li>
					</c:if>
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage }">
						&nbsp;<a class="page-link" href="${num }">${num }</a>&nbsp;
					</c:forEach>
					<c:if test="${paging.next}">
						<li class="page-item"><a class="page-link" id="next" href="${paging.endPage + 1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
			
			<form id="pagingFrm" name="pagingForm" action="selectTripInfoBoardList.do" method="get">
				<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
				<input type="hidden" id="amount" name="amount" value="${paging.cri.amount }">
				<input type="hidden" id="type" name="type" value="${paging.cri.type }">
				<input type="hidden" id="keyword" name="keyword" value="${paging.cri.keyword }">	
				
			</form>	
			<!-- 검색 -->
			<div class="form-group row justify-content-center">
				<div id="search" class="w100" style="padding-right:10px">
					<form id="searchForm" action="selectTripInfoBoardList.do" method="get">
						<select name="type">
							<option value="" <c:out value="${paging.cri.type == null?'selected':'' }" />>선택</option>
							<option value="T" <c:out value="${paging.cri.type eq 'T'?'selected':'' }" />>제목</option>
							<option value="C" <c:out value="${paging.cri.type eq 'C'?'selected':'' }" />>내용</option>
							<option value="W" <c:out value="${paging.cri.type eq 'W'?'selected':'' }" />>작성자</option>
						</select>
							<input type="text" name="keyword" />
							<input type="submit" id="searchBtn" class="btn btn-sm btn-primary" value="검색" />			
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		
		//페이지 번호 이동
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			$('#pageNum').val($(this).attr("href"));
			pagingForm.submit();
		});
	});
</script>
 <%@ include file="footer.jsp" %>
</html>


