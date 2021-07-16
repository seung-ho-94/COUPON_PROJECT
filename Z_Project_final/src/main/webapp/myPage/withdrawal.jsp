<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

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
			        url : "/Z_Project_final/member/password_check",   			// 컨트롤러에서 대기중인 URL 주소 			   
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
<div class="container pt-3"> 
	<div class="row"> 
		<!-- 왼쪽 사이드 바 --> 
		<div class="col-sm-3"> 
			<h3>마이페이지</h3> 
			<ul class="list-group"> 
			<li class="list-group-item list-group-item-action">
			<a href="#">구매/취소 내역</a></li> 
			<li class="list-group-item list-group-item-action">
			<a href="selectCartList.do">찜 목록</a></li> 
			<li class="list-group-item list-group-item-action">
			<a href="updateMember.do">회원 정보 수정</a></li> 
			</ul> 
		</div> 
		<div class="col-sm-8"> 
	<h2>회원탈퇴</h2>
	<form action="../withdrawal.do" method="post" name="withdrawalInfo" onsubmit="return withdrawal_check()">
			<ul>
				<li> 회원으로서의 모든 권리 및 모든 정보가 삭제되기 때문에 한 번 더 유의해주시기 바랍니다. </li>
				<li> 최종적으로 탈퇴 준비가 되셨으면 하단의 '회원 탈퇴' 버튼을 클릭합니다 </li>
			</ul>
		<div><input type="radio" name="agree" value="true"> 회원탈퇴 관련사항을 확인 했습니다.</div>
		<div>비밀번호 : <input type="password" name="password_check" placeholder="비밀번호" id="userPassword">
			<div id="password_check"></div>
		</div>
		<input type="submit" value="회원탈퇴">
		<input type="button" value="취소" onclick="history.back()">
	</form>
	</div></div>
</div>
</body>
</html>