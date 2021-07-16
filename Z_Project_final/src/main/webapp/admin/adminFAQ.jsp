<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ</title>

	<style>
		#main-css {
			position: relative;
			margin:0 25% 0 25%;
		}
		
		.grid {
			text-align: center;
		}
		
		.cate-content {
			display:inline-block;
		}
		
		.center {
			text-align: center;
		}
	</style>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script>
		function goInsertFAQ() {
			location.href="insertFAQView.do";
		}
		function goUpdateFAQ(form) {
			if($(":input:radio[name='no']:checked").length < 1) {
				alert("수정하실 질문을 선택하세요.");
				return;
			}
		    form.action="updateFAQView.do";
		    form.submit();
		}
		function goDeleteFAQ(form) {
			if($(":input:radio[name='no']:checked").length < 1) {
				alert("삭제하실 질문을 선택하세요.");
				return;
			}
		    form.action="deleteFAQ.do";
		    form.submit();
		}
	</script>
	
</head>
<body>
	
	<header>
		<%@include file = "adminHeader.jsp" %>
	</header>
	<br><br><br>
	<main>
		<form method="post">
			<div id="main-css">
				<h3 class="center">자주하는 질문</h3>
				<hr>
				
				<div class="grid">
					<c:forEach var="category" items="${faqCateList }">
						<div class="cate-content">
							<a class="nav-link btn btn-outline-primary" href="FAQList.do?category=${category }">${category }</a>
						</div>
					</c:forEach>
				</div>
				<br><br>
				
				<c:forEach var="list" items="${faqList }">
					<div class="accordion">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${list.no }" aria-expanded="false">
									[${list.category }] &emsp;&emsp; <strong>Q.${list.question }</strong>
								</button>
							</h2>
							<div id="collapse${list.no }" class="accordion-collapse collapse">
								<div class="accordion-body">
									<input type="radio" name="no" value="${list.no }"> No.${list.no } <br>
										&emsp;&emsp;&emsp; <strong>A.${list.answer }</strong>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<br><br>
				
				<div class="center">
					<input type="button" class="btn btn-primary" value="등록" onclick="goInsertFAQ()">
					<input type="button" class="btn btn-primary" value="수정" onclick="goUpdateFAQ(this.form)">
					<input type="button" class="btn btn-primary" value="삭제" onclick="goDeleteFAQ(this.form)">
					<!-- 카테고리 값 (deleteFAQ 에서 return "forward:/FAQList.do"; 할 때 필요) -->
					<input type="hidden" name="category" value="${category }">
				</div>
			</div>
		</form>
		
		<br><br><br><br><br><br><br><br><br><br>
	</main>
	
	<footer>
	
	</footer>
	
</body>
</html>