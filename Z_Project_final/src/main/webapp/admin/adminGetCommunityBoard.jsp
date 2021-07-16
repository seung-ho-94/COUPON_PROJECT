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
	<h3 class="contact-title">글상세 ${board.category}</h3>
	<hr>
	 <table class="table">
        <tbody>
            <tr>
                <th>제 목</th>
                <td>${board.title}</td>
                <th>조회수</th>
                <td>${board.hit }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${board.id }</td>
                <th>등록일</th>
                <td>${board.regdate }</td>
            </tr>
            <tr>
                <th>내 용</th>
                <td colspan="3" height="350px" valign="top">
                    ${board.content }
                </td>
            </tr>
			<tr>
				<th>첨부 파일</th>
				<td>
					<a href="fileDownload2.do?file_name=${board.file_name}" >${board.file_name}</a>
				</td>
			</tr>
        </tbody>
    </table>
    <div class="center">
	    <button type="button" class="btn btn-primary" onclick="location.href='deleteCommunity.do?no=${board.no }&category=${board.category }'">삭제</button>
	    
    </div>

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
								<form action="deleteCommunityComment.do?no=${commList.no }" method="post">	
									<input type="hidden" name="board_no" value="${commList.board_no }">
									<input type="hidden" name="category" value="${board.category }">
									<input type="submit" class="btn btn-sm btn-primary" value="댓글 삭제" style="float: right; margin-left:5px"> 		
								</form>
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
<c:if test="${sessionScope.adminInfo != null}">
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
	<form action="insertCommunityComment.do" method="post">
		<input type="hidden" id="board_no" name="board_no" value="${board.no }" />
		<input type="hidden" name="category" value="${board.category }">
		<div class="row">
			<div class="col-sm-5">
				<label for="id">작성자</label>
				<input type="text" class="form-control" name="id" value="${sessionScope.adminInfo.id}" readonly>
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
<c:if test="${sessionScope.adminInfo == null}">
	<div class="fa fa-edit"> 로그인 한 사용자만 댓글 등록이 가능합니다. </div>
</c:if>

</div>
</article>	
    
<br><br><br><br><br><br><br><br><br><br>
</div>

</body>
</html>





