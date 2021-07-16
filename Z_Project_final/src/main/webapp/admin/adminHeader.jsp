<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminHeader</title>
	
	<link rel="stylesheet" href="https://bootswatch.com/5/cosmo/bootstrap.css">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js">
	</script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="adminMain.do">Admin</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item">
						<a class="nav-link" href="adminMain.do">통계</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="memberList.do">회원관리</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-haspopup="true" aria-expanded="false">상품관리</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="insertCoupon.do">상품등록</a>
							<a class="dropdown-item" href="updateDeleteCoupon.do">상품수정/삭제</a>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="adminOrderList.do?status=주문취소">주문관리</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="adminCommunityList.do?category=FREE">자유게시판</a>
							<a class="dropdown-item" href="adminCommunityList.do?category=TRIP">여행정보</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-haspopup="true" aria-expanded="false">고객센터</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="getBoardListNotice2.do">공지사항</a>
							<a class="dropdown-item" href="FAQList.do?category=쿠폰문의">자주하는 질문</a>
							<a class="dropdown-item" href="QNAList.do?status=미답변">1:1 문의</a>
							<a class="dropdown-item" href="contactList.do">제휴 문의</a>
						</div>
					</li>
				</ul>
				${adminInfo.id }님 반갑습니다.
	            <a class="nav-link" style="color: white" href="admin/adminLogout.jsp">로그아웃</a>
	            <a class="nav-link" style="color: white" href="../main.jsp">사용자 페이지</a>
			</div>
		</div>
	</nav>
</body>
</html>