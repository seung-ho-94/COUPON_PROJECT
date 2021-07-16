<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bestrip Travel!</title>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="./Resources/css/member.css">
<%-- <%@ include file="./Resources/css/member.css" %> --%>
<link rel="icon" href="./Resources/img/favicon.png">
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./Resources/css/animate.css">
<link rel="stylesheet" href="./Resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="./Resources/css/themify-icons.css">
<link rel="stylesheet" href="./Resources/css/flaticon.css">
<link rel="stylesheet" href="./Resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="./Resources/css/magnific-popup.css">
<link rel="stylesheet" href="./Resources/css/gijgo.min.css">
<link rel="stylesheet" href="./Resources/css/nice-select.css">
<link rel="stylesheet" href="./Resources/css/slick.css">
<link rel="stylesheet" href="./Resources/css/style.css">

<script>

//로그인 유효성 체크 --------------------------------------------------
function serchIdEmail() {

		if (document.loginInfo.id.value.trim() == "") {
			alert("아이디를 입력하세요.");
			document.loginInfo.id.value = "";
			document.loginInfo.id.focus();
	              return false;
		}
		if (document.loginInfo.email.value.trim() == "") {
			alert("이메일을 입력하세요.");
			document.loginInfo.email.value = "";
			document.loginInfo.email.focus();
	              return false;
		}
		return true;
	}
	
</script>
</head>
<body>
<div class="wrapper fadeInDown zero-raduis" style="margin-top: 80px;">
  	  <div id="formContent">
  	    <div class="fadeIn first">
  	      <h4 class="my-5">비밀번호 찾기</h4>
  	    </div>
  	    <form action="findpassword.do" method="post" name="loginInfo" onsubmit="return serchIdEmail()">  
  	      <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
  	      <input type="email"  id="email" name="email" placeholder="이메일을 입력해주세요">
		      <div id="formFooter">
  	      </div>
  	      <br>
  	      <input type="submit" value="확인">
  	      <h6>확인 버튼을 누르면 가입하신 이메일로</h6>
  	      <h6>임시 비밀번호가 발송됩니다.</h6>
  	      <br><br>
  	    </form>
  	  </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>


