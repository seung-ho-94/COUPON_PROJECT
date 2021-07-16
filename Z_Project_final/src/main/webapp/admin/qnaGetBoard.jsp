<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세(getBoard.jsp)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script>
	function qnaUpdateComment(no) {
		
	    var _width = '450';
	    var _height = '200';
	 
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
	    
	    window.open('qnaUpdateComment.do?no='+no, '', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
	}

</script>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1, h3, p { text-align: center; }
	table { 
		border-style: solid;
		border-collapse: collapse; 
		width: 100%; 
	}
	table, th, td {
		border : 1px solid black;
		margin : 0 auto;
	}
	th { 
		background-color: #e3e1f2;
		width: 15%;
		height: 50px;
		text-align: center;
	 }
	 td{
	 	width : 50%;
	 	height: 50%px;
	 }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>
	<header>
		<%@include file="adminHeader.jsp"%>
	</header>	
	<br><br><br>
<div id="container">
	<h3 class="contact-title">1:1문의 상세보기</h3>
	<hr>
	 <table class="table">
        <tbody>
            <tr>
                <th>카테고리</th>
                <td>${board.category}</td>
                <th>상태</th>
                <td>${board.status }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${board.id }</td>
                <th>등록일</th>
                <td>${board.regdate }</td>
            </tr>
            <tr>
                <th>제 목</th>
                <td>${board.title}</td>                
            </tr>
            <tr>
                <th>내 용</th>
                <td colspan="3" height="350px" valign="top">
                    ${board.content }
                </td>
            </tr>
        </tbody>
    </table>
    <div class="center">
	    <button type="button" class="btn btn-primary" onclick="location.href='qnaDeleteGetboard.do?no=${board.no }&status=${board.status }'">삭제</button>
	    <button type="button" class="btn btn-primary" onclick="location.href='QNAList.do?status=${board.status }'">글목록</button>
    </div>
</div>
<!-- 댓글 목록 -->
<article>
	<div class="container">
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
	<table class="table table-striped table-sm">
		<c:if test="${not empty commList }">
			<c:forEach var="commList" items="${commList }">
				<tr>
					<td width="550">
						<div>답변  : ${commList.content }
							<c:if test="${sessionScope.loginId == commList.id}">
								<form action="qnaDeleteComment.do?no=${commList.no }" method="post">	
									<input type="hidden" name="q_no" value="${commList.q_no }">
									<input type="submit" class="btn btn-sm btn-primary" value="답변 삭제" style="float: right; margin-left:5px"> 
									<input type="button" class="btn btn-sm btn-primary" onclick="qnaUpdateComment(${commList.no })" value="답변 수정" style="float: right">		
								</form>
							</c:if>
						</div>
					</td>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
</div>

<!-- 댓글 작성 -->
<c:if test="${sessionScope.adminInfo != null}">
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
	<form action="qnaInsertComment.do" method="post">
		<input type="hidden" id="q_no" name="q_no" value="${board.no }" />
		<div class="row">
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
<c:if test="${sessionScope.adminInfo == null}">
	<div class="fa fa-edit"> 관리자 로그인 후  답변 등록이 가능합니다. </div>
</c:if>
</div>
</article>

</body>
</html>





