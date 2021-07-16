<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제휴문의 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script>
	function qnaUpdateComment(no) {
		window.open("qnaUpdateComment.do?no="+no),
					 "width=300, height=350, resizable=no, scrollbars=no";
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
	<h3 class="contact-title">제휴문의 상세보기</h3>
	<hr>
	 <table class="table">
        <tbody>
            <tr>
                <th>작성자</th>
                <td>${board.name }</td>
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
	    <button type="button" class="btn btn-primary" onclick="location.href='deleteNotice.do?no=${board.no }'">삭제</button>
	    <button type="button" class="btn btn-primary" onclick="location.href='QNAList.do'">글목록</button>
    </div>
</div>
</body>
</html>





