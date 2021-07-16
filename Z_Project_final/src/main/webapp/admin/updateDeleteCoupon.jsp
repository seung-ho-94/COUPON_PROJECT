<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품수정/삭제</title>

	<style>
		#main-css {
			position: relative;
			margin:0 10% 0 10%;
		}
		
		.grid {
			text-align: center;
		}
		
		.one-content {
			width: 270px;
			height: 450px;
			margin: 0 1% 0 1%;
			text-align: center;
			display: inline-block;
		}
		
		.img-content {
			width: 250px;
			height: 250px;
			border-radius: 10%;
			transition: all .15s ease-in-out;
		}
		
		.img-content:hover {
			filter: brightness(70%);
		}

		.name-link:link { color: black; text-decoration: none;}
		.name-link:visited { color: black; text-decoration: none;}
		.name-link:hover { color: gray; text-decoration: none;}
		
	</style>
</head>
<body>

	<header>
		<%@include file = "adminHeader.jsp" %>
	</header>
	<br><br><br>
	
	<main>
	
		<div id="main-css">
			<h3 align="center">상품수정/삭제</h3>
			<hr>
			<br><br><br>
			
			<div class="grid">
				<c:forEach var="list" items="${couponList }">
					<div class="one-content">
						<form action="deleteCoupon.do" method="post">
							<a href="updateCoupon.do?coupon_key=${list.coupon_key }">
								<c:choose>
									<c:when test="${empty list.attach_file1 }">
										<img class="img-content" src="/img/default-img.png" id="img1"/>
									</c:when>
									<c:otherwise>
										<img class="img-content" src="/img/${list.attach_file1 }" id="img1"/>
									</c:otherwise>
								</c:choose>
							</a>
							<div style="height: 100px;">
								<span style="color: gray;">제품번호: ${list.coupon_key }</span><br>
								<b>
									<a class="name-link" href="updateCoupon.do?coupon_key=${list.coupon_key }">
										${list.name }<br>
									</a>
									<fmt:formatNumber type="number" value="${list.price }"/>원<br>
								</b>
							</div>
							<input type="submit" class="btn btn-primary" value="삭제">
							<input type="hidden" name="coupon_key" value="${list.coupon_key }">
							<input type="hidden" name="attach_file1" value="${list.attach_file1 }">
							<input type="hidden" name="attach_file2" value="${list.attach_file2 }">
							<input type="hidden" name="attach_file3" value="${list.attach_file3 }">
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br>
		
	</main>
	
	<footer>
	
	</footer>
	
</body>
</html>