<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>

<style>
#main-css {
	position: relative;
	margin: 0 25% 0 25%;
}

.center {
	text-align: center;
}
</style>

<script>
	function faqCheck() {
		if (document.NoticeInfo.title.value.trim() == "") {
			alert("제목을 입력하세요.");
			document.NoticeInfo.title.value = "";
			document.NoticeInfo.title.focus();
			return false;
		}
		if (document.NoticeInfo.content.value.trim() == "") {
			alert("내용을 입력하세요.");
			document.NoticeInfo.content.value = "";
			document.NoticeInfo.content.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>

	<header>
		<%@include file="adminHeader.jsp"%>
	</header>
    <br><br><br>
	<main>
		<form action="insertNotice.do" method="post" name="NoticeInfo"
			onsubmit="return faqCheck()" enctype="multipart/form-data">
			<div id="main-css">
				<h3 class="center">공지사항 등록</h3>
				<hr>

				<%-- 제목 --%>
				<div class="form-group">
					<label class="col-form-label mt-4" for="inputTitle">제목</label> 
					<input type="text" class="form-control" name="title" placeholder="제목"
						id="inputTitle">
				</div>

				<%-- 내용 --%>
				<div class="form-group">
					<label for="inputContent" class="form-label mt-4">내용</label>
					<textarea class="form-control" name="content" placeholder="내용"
						id="inputContent" rows="3"
						style="margin-top: 0px; margin-bottom: 0px; height: 200px;"></textarea>
				</div>
				<br>

				<div class="center">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="button" class="btn btn-primary" value="취소"
						onclick="history.back()">
				</div>
			</div>
		</form>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</main>

	<footer> </footer>

</body>
</html>