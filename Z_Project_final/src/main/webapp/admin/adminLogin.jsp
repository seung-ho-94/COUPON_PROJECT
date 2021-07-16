<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>

	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/cosmo/bootstrap.min.css">
	
	<style>
		#container {
			width: 300px;
			position: absolute;
			top: 40%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		
		.center {
			text-align: center;
		}
	</style>
	
	<%-- 아이디, 패스워드 예외처리 --%>
	<script>
		function loginCheck() {
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
			return true;
		}
	</script>
	
</head>
<body>
	<form action="adminLogin.do" method="post" name="loginInfo" onsubmit="return loginCheck()">
		<fieldset id="container">
			<legend class="center">관리자 로그인</legend>
			<div class="form-group">
				<%-- 아이디 입력 --%>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" name="id"
						placeholder="ID">
				</div>
				<%-- 패스워드 입력 --%>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="password"
						placeholder="PASSWORD">
				</div>
				<%-- 로그인 버튼 --%>
				<div class="center">
					<input type="submit" class="btn btn-primary" value="로그인">
					<input type="button" class="btn btn-primary" value="취소" onclick="history.back()">
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>