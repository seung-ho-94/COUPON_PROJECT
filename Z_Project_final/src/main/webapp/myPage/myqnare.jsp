<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<link rel="stylesheet" href="../Resources/css/mypage.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<title>Bestrip Travel!</title>
<%@ include file="header.jsp" %>

</head>
<div class="container">
<br><br><hr>
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
                <a href="selectCartList.do" class="nav-item nav-link has-icon nav-link-faded">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shield mr-2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>찜목록
                </a>
                <a href="updateView.do" class="nav-item nav-link has-icon nav-link-faded">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card mr-2"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>마이 프로필
                </a>
                 <a href="myqnare.do" class="nav-item nav-link has-icon nav-link-faded active">
                 <input type="hidden" value="${sessionScope.loginId}" name="coupon_category">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card mr-2"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>나의 문의내역
                </a>
              </nav>
            </div>
          </div>
        </div>
          <div class="col-md-8">
              <div class="tab-pane" id="billing">
               <h6>메세지</h6>
                <hr>
                <form>
                  <div class="form-group">
                    <label class="d-block mb-0">나의 문의 내역</label>
                    <br>
                    <c:forEach var="list" items="${list }" >
                    <div class="small text-muted mb-3">
                    	<p>${list.content }</p>
                    </div>
                    </c:forEach>
                  </div>
              <c:forEach var="volist" items="${volist }" >
                  <div class="form-group mb-0">
                    <div class="border border-gray-500 bg-gray-200 p-3 text-left font-size-sm">답변 : <p>${volist.content }</p></div>
                  </div>
                </c:forEach>
                </form>
              </div>
          </div>
        </div>
      </div>

</body>
<%@ include file="footer.jsp" %>
</html>