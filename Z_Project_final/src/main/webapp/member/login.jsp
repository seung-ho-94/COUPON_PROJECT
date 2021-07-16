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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<title>Bestrip Travel!</title>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="./Resources/css/member.css">
<link rel="icon" href="./Resources/img/favicon.png">
<script>
	
	//로그인 유효성 체크 --------------------------------------------------
	function login_check() {
		if (document.loginInfo.id.value.trim() == "") {
			alert("아이디를 입력하세요.");
			document.loginInfo.id.value = "";
			document.loginInfo.id.focus();
	              return false;
		}
		if (document.loginInfo.password.value.trim() == "") {
			alert("비밀번호를 입력하세요.");
			document.loginInfo.password.value = "";
			document.loginInfo.password.focus();
	              return false;
		}
		
		if (session.getAttribute("loginId") == "0") {
			alert("비밀번호를 입력하세요.");
			document.loginInfo.password.value = "";
			document.loginInfo.password.focus();
	              return false;
		}
		return true;
	}
	
	
	//회원가입 페이지로 이동 메소드
	function signup() {
		location.href = "signup.do";
	}
	
	 //카카로 로그인창 호출 --------------------------------------------------
	  Kakao.init('f80edf3ad380bca22b700c818e1f71db'); //발급받은 키 중 javascript키를 사용해준다.
	  console.log(Kakao.isInitialized()); // sdk초기화여부판단
	  
 	  function kakaoLogin() {
		    Kakao.Auth.authorize({
		        redirectUri: 'http://localhost:8081/kakaologin.do'
		      });		
		  }

	</script>
</head>

<body>
<br><br><br><br>
<div class="wrapper fadeInDown zero-raduis">
  	  <div id="formContent">
  	    <div class="fadeIn first">
  	      <h4 class="my-5">로그인</h4>
  	    </div>
  	    <!-- Login Form -->
  	    <form action="login.do" method="post" name="loginInfo" onsubmit="return login_check()">
  	      <input type="text" name="id" placeholder="아이디를 입력해주세요">
  	      <input type="password" name="password" placeholder="비밀번호를 입력해주세요">
		  <div id="formFooter">
  	      	<a class="underlineHover" href="serchPassword.do" >비밀번호 찾기</a>
  	      </div>
  	      <br>
  	      <input type="submit" value="로그인" style="margin-bottom: 15px;">
  	      <a id="custom-login-btn" href="javascript:kakaoLogin()">
             <img src="./Resources/img/kakao_login_large_narrow.png" style="width: 180px;">
        </a>
        <br><br><br>
  	      <h6>아직 회원이 아니십니까?</h6>
  	      <input type="button" onclick="signup();" value="회원가입">
  	    </form>
  	  </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>



