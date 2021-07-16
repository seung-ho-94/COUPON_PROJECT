<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<style>
    textarea {
        width: 400px;
        height: 100px;
        resize: none;
    }
</style>
</head>
<body>
	<!-- 나의 댓글 수정 -->	
	<form method="post">
		<input type="hidden" name="no" value="${updateComment.no }"> 
		<input type="hidden" name="q_no" value="${updateComment.q_no }">
		<input type="hidden" name="id" value="${updateComment.id }">
	<table>
	<tr><th width="70">내용</th></tr>
	<tr>
		<td>
			<textarea name="content">${updateComment.content }</textarea>
		</td>
	</tr>
	</table>
	<div>
		<input type="submit" value="저장">
		<input type="button" value="취소" onclick="window.close()"> 
	</div>
	</form>
</body>
</html>