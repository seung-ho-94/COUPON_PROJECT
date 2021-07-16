<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ 등록</title>

	<style>
		#main-css {
			position: relative;
			margin:0 25% 0 25%;
		}
		
		.center {
			text-align: center;
		}
	</style>
	
	<script>
		function faqCheck() {
			if (document.faqInfo.category.value.trim() == "") {
				alert("카테고리를 선택하세요.");
				document.faqInfo.category.value = "";
				document.faqInfo.category.focus();
	            return false;
			}
			if (document.faqInfo.question.value.trim() == "") {
				alert("질문을 입력하세요.");
				document.faqInfo.question.value = "";
				document.faqInfo.question.focus();
	            return false;
			}
			if (document.faqInfo.answer.value.trim() == "") {
				alert("답변을 입력하세요.");
				document.faqInfo.answer.value = "";
				document.faqInfo.answer.focus();
	            return false;
			}
			return true;
		}
	</script>

</head>
<body>

	<header>
		<%@include file = "adminHeader.jsp" %>
	</header>
	<br><br><br>
	<main>
		<form action="insertFAQ.do" method="post" name="faqInfo" onsubmit="return faqCheck()">
			<div id="main-css">
				<h3 class="center">자주하는 질문 등록</h3>
				<hr>
				
				<%-- 카테고리 --%>
				<div class="form-group">
					<label class="col-form-label mt-4">카테고리</label>
					<select class="form-control" name="category" id="inputCategory">
						<option value="">문의선택</option>
						<option value="쿠폰문의">쿠폰문의</option>
						<option value="회원문의">회원문의</option>
						<option value="커뮤니티문의">커뮤니티문의</option>
						<option value="제휴문의">제휴문의</option>
						<option value="결제문의">결제문의</option>
						<option value="기타문의">기타문의</option>
						<option value="나문희">나문희</option>
					</select>
				</div>
				
				<%-- 질문 --%>
				<div class="form-group">
					<label class="col-form-label mt-4" for="inputQuestion">질문</label>
					<input type="text" class="form-control" name="question" placeholder="QUESTION" id="inputQuestion">
				</div>
				
				<%-- 답변 --%>
				<div class="form-group">
			        <label for="inputAnswer" class="form-label mt-4">답변</label>
			        <textarea class="form-control" name="answer" placeholder="ANSWER" id="inputAnswer" rows="3" style="margin-top: 0px; margin-bottom: 0px; height: 200px;"></textarea>
	            </div>
	            <br><br>
	            
	            <div class="center">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="button" class="btn btn-primary" value="취소" onclick="history.back()">
				</div>
			</div>
		</form>
		
		<br><br><br><br><br><br><br><br><br><br>
	</main>
	
	<footer>
	
	</footer>
	
</body>
</html>