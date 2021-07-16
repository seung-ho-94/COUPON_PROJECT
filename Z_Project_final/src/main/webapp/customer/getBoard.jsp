<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bestrip Travel!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<%@ include file="header.jsp" %>
</head>
<body>
<br><br><br>
<section class="sample-text-area">
	<div class="container box_1170">
		<h2 class="text-heading">${board.title}</h2>
		<p>작성자 : 관리자<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								  <a class="btn btn-outline-secondary" type="button" href="getBoardListNotice.do">목록으로</a>
								</div></p>
		<hr>
		<p class="sample-text fs-5">
			${board.content }
		</p>
	</div>
</section>
<br><br><br><br><br>

</body>
 <%@ include file="footer.jsp" %>
</html>





