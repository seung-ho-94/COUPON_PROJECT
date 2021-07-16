<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bestrip Travel!</title>
<%-- <%@ include file="memberHeader.jsp" %> --%>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		var password_check_flag = false;
		
		function withdrawal_check() {
			if ($("input:radio[name='agree']").is(":checked") == false) {
				alert("회원탈퇴 관련사항에 동의해주세요.");
                return false;
			}
			if (document.withdrawalInfo.password.value.trim() == "") {
				alert("비밀번호를 입력하세요.");
				document.withdrawalInfo.password.value = "";
				document.withdrawalInfo.password.focus();
                return false;
			}
			if (!password_check_flag) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			return true;
		}
		
		$(document).ready(function() {
			$("#userPassword").blur(function() {
				if (document.withdrawalInfo.password.value.trim() == "") {
					$("#password_check").text("비밀번호를 입력하세요.");
					document.withdrawalInfo.password.value = "";
	                return false;
				}
				
				//ajax통신
			    $.ajax({
			        type : "POST",            	   								// HTTP method type(GET, POST) 형식
			        url : "/bit_project_demo/member/password_check",   			// 컨트롤러에서 대기중인 URL 주소 			   
			        data : {password : userPassword},            	   			// Json 형식의 데이터
			        success : function(response) { 								// 비동기 통신이 성공할 경우 success 콜백으로 들어온다.
			        															// response은 응답받은 데이터
			            var result = JSON.parse(response)
			            
			            if (result) {
							password_check_flag = true;
							$("#password_check").text("비밀번호 일치");
			            } else {
							password_check_flag = false;
							$("#password_check").text("비밀번호가 일치하지 않습니다.");
			            }
			        },
			        error : function(XMLHttpRequest, textStatus, errorThrown) {  // 비동기 통신이 실패할 경우 error 콜백으로 들어온다.
						alert("응답 실패");
			        }
			    });
			});
		});
	</script>
</head>
<body>
	<h2>회원탈퇴</h2>
	<form action="withdrawal" method="post" name="withdrawalInfo" onsubmit="return withdrawal_check()">
		<p>회원탈퇴 관련사항 - 준비중</p>
		<div><input type="radio" name="agree" value="true"> 회원탈퇴 관련사항을 확인 했습니다.</div>
		<div>비밀번호 : <input type="password" name="password_check" placeholder="비밀번호" id="userPassword">
			<div id="password_check"></div>
		</div>
		<input type="submit" value="회원탈퇴">
		<input type="button" value="취소" onclick="history.back()">
	</form>
</body>
</html>