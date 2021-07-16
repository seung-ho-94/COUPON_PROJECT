<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 정보 게시판</title>
</head>
<body>
	<!-- 나의 댓글 수정 -->	
	<form action="updateTripInfoBoardComment.do?no=${updateComment.no }" method="post">
		<input type="hidden" name="no" value="${updateComment.no }"> 
		<input type="hidden" name="board_no" value="${updateComment.board_no }">
		<input type="hidden" name="id" value="${updateComment.id }">
	<table>
	<tr class="mb-3">
		<th width="70">작성자</th>
		<td>"${updateComment.id }"</td>
	</tr>
	<tr>
		<th width="70">내용</th>
		<td>
			<textarea name="content"> ${updateComment.content } </textarea>
		</td>
	</tr>
	</table>
	<div>
		<input type="submit" value="저장" onclick="submit()">
		<input type="button" value="취소" onclick="window.close()"> 
	</div>
	</form>
</body>
</html>

<script>
	function submit() {
		opener.parent.location="updateTripInfoBoardComment.do";
	}
</script>