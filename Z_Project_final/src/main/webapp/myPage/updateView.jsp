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
<script>
   function updatePwd_check(){
      //현재 비밀번호 입력확인
      if (document.updatePassword.old_password.value.trim() == "") {
            alert("현재 비밀번호를 입력하세요.");
            document.updatePassword.old_password.value = "";
            document.updatePassword.old_password.focus();
               return false;
         }
      if (document.updatePassword.old_password.value.trim() != "${updateView.password }") {
            alert("현재 비밀번호가 일치하지 않습니다.");
            document.updatePassword.old_password.value = "";
            document.updatePassword.old_password.focus();
               return false;
         }
      //새로운 비밀번호 입력확인
      if (document.updatePassword.password.value.trim() == "") {
            alert("새로운 비밀번호를 입력하세요.");
            document.updatePassword.password.value = "";
            document.updatePassword.password.focus();
               return false;
         }
      //새로운 비밀번호확인 입력확인
      if (document.updatePassword.password_check.value.trim() == "") {
            alert("비밀번호 확인을 입력하세요.");
            document.updatePassword.password_check.value = "";
            document.updatePassword.password_check.focus();
               return false;
         }
      document.updatePassword.submit();
      alert("비밀번호 변경이 완료되었습니다.");
   }
   <%-- 비밀번호 예외처리 --%>
   $(document).ready(function() {
      $("#userPassword1").blur(function() {
         var userPassword1 = $("#userPassword1").val();
         var userPassword2 = $("#userPassword2").val();
         var password_pattern = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
         
         if (!password_pattern.test(userPassword1)) {
            $("#password_text1").text("비밀번호는 숫자, 알파벳, 특수문자 포함. 8~20자");
            $("#password_text1").css("color","red");
            document.updatePassword.password.value = "";
            return false;
         } else {
            $("#password_text1").text("");
         }
      });
   });
      
    <%-- 비밀번호 확인 --%>
    $(document).ready(function() {
       $("#userPassword2").blur(function() {
          var userPassword1 = $("#userPassword1").val();
          var userPassword2 = $("#userPassword2").val();
          
          if (userPassword1 != userPassword2) {
             $("#password_text2").text("비밀번호가 일치하지 않습니다.");
             $("#password_text2").css("color","red");
             document.updatePassword.password_check.value = "";
          } else {
             $("#password_text2").text("");
          }
       });
    });

   <%-- 이메일 예외처리 --%>
   function update_check() {
    $(document).ready(function() {
       $("#uesrEmail").blur(function() {
          var uesrEmail = $("#uesrEmail").val();
          var uesrEmail_pattern = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
          
          if (!uesrEmail_pattern.test(uesrEmail)) {
             $("#email_text").text("ex) abc123@xmail.com");
             $("#email_text").css("color","red");
             document.signUpInfo.email.value = "";
             return false;
          } else {
             $("#email_text").text("");
          }
       });
    });
    document.signUpInfo.submit();
   alert("회원 정보가 변경되었습니다.");
}
   //회원탈퇴 예외처리
function delete_member(){
    if (document.deletePassword.password_check.value.trim() != "${updateView.password }") {
          alert("비밀번호가 일치하지 않습니다.");
          document.deletePassword.password_check.value = "";
          document.deletePassword.password_check.focus();
             return false;
       }
    document.deletePassword.submit();
 }
</script> 
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
                <a href="updateView.do" class="nav-item nav-link has-icon nav-link-faded active">
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
        <c:choose >      
         <c:when test='${sessionScope.loginId.contains("@") == false}'>
        <div class="col-md-9">
              <div class="tab-pane" id="profile">
              <div class="card">
              <div class="card-body tab-content">
                <form action="updateMember.do" method="GET" name="signUpInfo">
                <input type="hidden" name="id" value="${updateView.id }">
                <label class="d-block">회원정보 수정</label>
                <div class="form-group">
                    <label for="fullName">아이디　　</label>
                    <input type="text" class="form-control" id="fullName" aria-describedby="fullNameHelp"
                       style="width: 530px;  height: 10px;" value="${updateView.id }" readonly>
                    <label style="color: #2493e0; margin-left: 20px;"></label>
                  </div>
                  <div class="form-group">
                    <label for="fullName">이름　　　</label>
                    <input type="text" class="form-control" id="fullName" aria-describedby="fullNameHelp"
                       style="width: 530px;  height: 40px;" value="${updateView.name }" name="name">
                    <label style="color: #2493e0; margin-left: 20px;"></label>
                  </div>
                  <div class="form-group">
                    <label for="email">이메일　　</label>
                    <input type="text" class="form-control" id="uesrEmail" aria-describedby="email"
                       style="width: 530px; height: 40px;" value="${updateView.email }" name="email">
                     <div id="email_text" class="check_color" style="margin-left: 65px;"></div>
                  </div>
                   <div class="form-group">
                    <label for="phone">연락처　　</label>
                    <input type="text" class="form-control" id="phone" aria-describedby="phone"
                       style="width: 530px; height: 40px;" value="${updateView.phone }" name="phone">
                  </div>
                   <div class="form-group">
                    <label for="birth">생년월일　</label>
                    <input type="text" class="form-control" id="birth" aria-describedby="birth"
                       style="width: 530px; height: 40px;" value="${updateView.birth }" readonly>
                        <input type="hidden" name="birth" value="${updateView.birth }">
                  </div>
                  <button type="reset" class="btn btn-light" style="width: 302px; height: 40px;"> 취소</button>
                  <button type="button" class="btn btn-primary" style="width: 302px; height: 40px;" onclick="update_check(this.form)">확인</button>
                  </form>
                  <div class="form-group">
                  <form action="updatePwd.do" name="updatePassword" method="post">
                  <br><br>
                  <!-- 비밀번호 변경 -->
                     <label class="d-block">비밀번호 변경</label>
                       <input type="text" class="form-control" name="old_password" style="height: 40px;" placeholder="현재 비밀번호">
                        <input type="text" class="form-control mt-1" style="height: 40px;" id="userPassword1" name="password" placeholder="새로운 비밀번호">
                           <div id="password_text1" class="check_color"></div>
                        <input type="text" class="form-control mt-1" style="height: 40px;" id="userPassword2" name="password_check" placeholder="새로운 비밀번호 확인">
                           <div id="password_text2" class="check_color"></div>
                        <button type="reset" class="btn btn-light" style="width: 302px;"> 취소</button>
                        <button type="button" class="btn btn-primary" onclick="updatePwd_check(this.form)" style="width: 302px;">확인</button>
                  </form> 
                     </div>
                     <!-- 회원 탈퇴 -->
                      <div class="form-group">
                  <form action="deleteMember.do" name="deletePassword" method="post">
                  <br><br>
                     <label class="d-block">회원 탈퇴</label>
                       <input type="text" class="form-control" name="password_check" style="height: 40px;" placeholder="현재 비밀번호">
                           <div id="password_text3" class="check_color"></div>
                        <button type="reset" class="btn btn-light" style="width: 302px;"> 취소</button>
                        <button type="button" class="btn btn-primary" onclick="delete_member(this.form)" style="width: 302px;">확인</button>
                  </form> 
                     </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  </c:when>
              <c:otherwise>
              <div class="col-md-8">
              <div class="tab-pane" id="profile">
              <div class="card">
              <div class="card-body tab-content">
              <!-- 카카오 사용자용 회원정보 -->
                <div class="form-group">
                   <label class="d-block">회원정보</label>
                    <label for="fullName">아이디　　　　　</label>
                    <input type="text" class="form-control" id="fullName" aria-describedby="fullNameHelp"
                       style="width: 530px;  height: 10px;" value="${id }" readonly>
                    <label style="color: #2493e0; margin-left: 20px;"></label>
                  </div>
                  <div class="form-group">
                    <label for="fullName">이름　　　　　　</label>
                    <input type="text" class="form-control" id="fullName" aria-describedby="fullNameHelp"
                       style="width: 530px;  height: 40px;" value="${name }" name="name" readonly>
                    <label style="color: #2493e0; margin-left: 20px;"></label>
                  </div>
                  <div class="form-group">
                    <label for="email">이메일　　　　　</label>
                    <input type="text" class="form-control" id="uesrEmail" aria-describedby="email"
                       style="width: 530px; height: 40px;" value="${email }" name="email" readonly>
                     <div id="email_text" class="check_color" style="margin-left: 65px;"></div>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  </c:otherwise>
                  </c:choose>
            </div>
            
      </div>
</body>
<%@ include file="footer.jsp" %>
</html>