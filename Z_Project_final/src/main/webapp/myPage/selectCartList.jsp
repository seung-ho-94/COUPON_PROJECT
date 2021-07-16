<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<title>Bestrip!</title>
<%@ include file="header.jsp" %>
</head>
<body>
<div class="container">
<br><br><hr>
<form>
      <div class="row gutters-sm">
        <div class="col-md-3 d-none d-md-block">
          <div class="card">
            <div class="card-body">
              <nav class="nav flex-column nav-pills nav-gap-y-1">
                <a href="buyCartList.do" class="nav-item nav-link has-icon nav-link-faded">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user mr-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>구매 내역
                </a>
                <a href="deleteCartList.do" class="nav-item nav-link has-icon nav-link-faded">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings mr-2"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>취소내역
                </a>
                <a href="selectCartList.do" class="nav-item nav-link has-icon nav-link-faded active">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shield mr-2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>찜목록
                </a>
                <a href="updateView.do" class="nav-item nav-link has-icon nav-link-faded">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card mr-2"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>마이 프로필
                </a>
                 <a href="myqnare.do" class="nav-item nav-link has-icon nav-link-faded">
                 <input type="hidden" value="${sessionScope.loginId}" name="coupon_category">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card mr-2"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>나의 문의내역
                </a>
              </nav>
            </div>
          </div>
        </div>
		<!-- 중앙 내용 --> 
		<div class="col-md-9">
			<div class="container">
				<div class="table table-bordered">
				<label class="d-block">*쿠폰 이름을 클릭하면 쿠폰 상세페이지에서 구매가 가능합니다. </label>
					<table class="table">
						<colgroup>					
							<col style="width:12%;" />
							<col style="width:auto;" />
							<col style="width:12%;" />
							<col style="width:auto;" />
							<col style="width:auto;" />
							<col style="width:auto;" />
							<col style="width:auto;" />
						</colgroup>
						<thead>
							<tr>
								<th>쿠폰 번호</th>
								<th>쿠폰명</th>
								<th>수량</th>
								<th>금액</th>
								<th>사용 기간</th>
								<th>선택 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty cartList }">
								<c:forEach var="cartList" items="${cartList }">
								<tr>
									<td class="center">${cartList.coupon_key }</td>
									<td><a href="couponDetail.do?coupon_key=${cartList.coupon_key }">${cartList.name }</a></td>
									<td>${cartList.quantity }</td>
									<td>${cartList.total_price }</td>
									<td>${cartList.first_date } ~ ${cartList.last_date }</td>
									<td>${cartList.select_date }
									&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-sm btn-outline-info" 
										onclick="location.href='deleteCart.do?no=${cartList.no }'">삭제</button></td>
								</tr>	
								</c:forEach>
							</c:if>
							<c:if test="${empty cartList }">
								<tr>
									<td colspan="8" class="center">찜한 내역이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
</form>
</div>
<br><br>
</body>
<%@ include file="footer.jsp" %>
</html>