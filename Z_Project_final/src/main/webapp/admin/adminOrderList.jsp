<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문내역</title>

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
		
		tr {text-align: center;}
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
				<h3 class="center">관리자 주문내역</h3>
				<hr>
				
				<div class="grid">
						<div class="cate-content">
							<a class="nav-link btn btn-outline-primary" href="adminOrderList.do?status=입금대기">입금대기</a>
						</div>
						<div class="cate-content">
							<a class="nav-link btn btn-outline-primary" href="adminOrderList.do?status=주문취소">주문취소</a>
						</div>
						<div class="cate-content">
							<a class="nav-link btn btn-outline-primary" href="adminOrderList.do?status=취소완료">취소완료</a>
						</div>
						<div class="cate-content">
							<a class="nav-link btn btn-outline-primary" href="adminOrderList.do?status=결제완료">결제완료</a>
						</div>
				</div>
			</div>
		</form>
		<br><br>
	<div id="main-css">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">ID</th>
					<th scope="col">BUY_DATE</th>
					<th scope="col">TOTAL_PRICE</th>
					<th scope="col">QUANTITY</th>
					<th scope="col">PAYMENT_OPTION</th>
					<th scope="col">STATUS</th>
					<th scope="col">취소</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list }">
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.no }</td>
							<td>${list.id }</td>
							<td>${list.buy_date }</td>
							<td>${list.total_price }</td>
							<td>${list.quantity }</td>
							<td>${list.payment_option }</td>
							<td>${list.status }</td>
							<td>
								<c:if test="${list.status == '주문취소' }">
						            <form action="orderStatus.do">
							            <input type="submit" value="취소승인" class="btn btn-primary">
							            <input type="hidden" name="no" value="${list.no }">
							            <input type="hidden" name="status" value="${list.status }">
						            </form>
								</c:if>
								<c:if test="${list.status == '입금대기' }">
						            <form action="orderStatus.do">
							            <input type="submit" value="결제승인" class="btn btn-primary">
							            <input type="hidden" name="no" value="${list.no }">
							            <input type="hidden" name="status" value="${list.status }">
						            </form>
								</c:if>
								<c:if test="${list.status == '결제완료' }">
						            <form action="orderStatus.do">
							            <input type="submit" value="결제취소" class="btn btn-primary">
							            <input type="hidden" name="no" value="${list.no }">
							            <input type="hidden" name="status" value="${list.status }">
						            </form>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
		
		<br><br><br><br><br><br><br><br><br><br>
	</main>
	
	<footer>
	
	</footer>
	
</body>
</html>