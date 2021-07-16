<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bestrip Travel!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<%@ include file="header.jsp" %>
<script>
	function insert_check(){
		if (document.qna_insert.category.value.trim() == ""){
			alert("문의유형을 선택하세요.");
			docuemt.qna_insert.category.value = "";
			docuemt.qna_insert.category.focus();
			return false;
		}
		if (document.qna_insert.title.value.trim() == ""){
			alert("제목을 입력하세요.");
			docuemt.qna_insert.title.value = "";
			docuemt.qna_insert.title.focus();
			return false;
		}		
		if (document.qna_insert.content.value.trim() == ""){
			alert("내용을 입력하세요.");
			docuemt.qna_insert.content.value = "";
			docuemt.qna_insert.content.focus();
			return false;
		}	
		if (document.qna_insert.email01.value.trim() == ""){
			alert("이메일을 입력하세요.");
			docuemt.qna_insert.email01.value = "";
			docuemt.qna_insert.email01.focus();
			return false;
		}	
		if (document.qna_insert.email02.value.trim() == ""){
			alert("이메일 주소를 선택하세요.");
			docuemt.qna_insert.email02.value = "";
			docuemt.qna_insert.email02.focus();
			return false;
		}
		document.qna_insert.submit();
	}
	
</script>
<style>
	textarea {
	  width: 100%;
	  height: 150px;
	  padding: 12px 20px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	  resize: none;
	}
	select {
	  width: 100%;
	  padding: 2px 20px;
	  height: 30px;
	  border: none;
	  border-radius: 4px;
	  background-color: #f1f1f1;
	}
	input {
	  padding: 2px 20px;
	  height: 30px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  background-color: #f8f8f8;
	}
</style>
</head>
<body>
    <h3 align="center" class="contact-title" style="padding-top: 80px;">1:1문의</h3>
	<div class="inquire_q" align="center">
		<ul class="inquire_main">
			<li> 1:1 문의를 이용하시기 전에 자주하는질문(FAQ)를 통해 좀 더 빠른 해결방법을 찾으실 수 있습니다.</li>
			<li> 문의하신 내용에 대한 답변은 마이페이지 문의내역에서 확인 가능합니다.</li>
		</ul>
	</div>
	<div class="height40"></div>
	<hr class="line_gray" />
	<div class="height40"></div>
	
<!-------------- 1:1문의 작성 시작 ----------------->
	<form action="setQna.do" method="post" name="qna_insert" >
	<div align="center">
		<table class="inquire_tb" align="center">
			<tr>
				<td>
				<label align="right">
					<select name="category" id="category" style="margin-top: 40px;">
					<option value="" selected="selected">문의 유형 선택</option>
					<option value="구매/결제문의"> 구매/결제문의</option>
					<option value="취소/환불문의"> 취소/환불문의</option>
					<option value="기타"> 기타</option>
					</select>
				</label>
				</td>
			</tr>
			<tr>
				<td>
				<label>
					<input name="title" type="text" class="tb_left_text" maxlength="150" id="ContactTitle" placeholder="제목" style="width:500px;"/>									</label>
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="content" class="tb_left_textarea" cols="60" rows="10" id="ContactContext" placeholder="내용을 작성해주세요."></textarea>									</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="email01" id="email01" style="width:150px;" placeholder="email"> @
					<input type="text" name="email02" id="email02" style="width:150px;" value="naver.com" method="post">
					<select style="width:150px;margin-right:10px" name="selectEmail" id="selectEmail" method="post">
					<option value="">-- 선택 --</option>
					<option value="naver.com" method="post">naver.com</option>
					<option value="nate.com" method="post">nate.com</option>
					<option value="hanmail.net" method="post">hanmail.com</option>
					<option value="gmail.com" method="post">gmail.com</option>
					<option value="input" >직접입력</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<br>
					<input type="button" class="genric-btn primary" value="문의하기" onclick="insert_check(this.form)" style="height: 40px;">
				</td>
			</tr>
		</table>
		</div>
		<br><br>
</form>
<!-------------- JSP시작----------------->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> <script type="text/javascript">

//이메일 입력 방식 선택
$('#selectEmail').change(function(){
   $("#selectEmail option:selected").each(function () {
		
		if($(this).val()== 'input'){ //직접입력일 경우
			 $("#email02").val('');  //값 초기화
			 $("#email02").attr(false); //활성화
		}else{ 						 //직접입력이 아닐경우
			 $("#email02").val($(this).text()); //선택값 입력
			 $("#email02").attr(true); //비활성화
		}
   });
});
</script>
<br>
</body>
 <%@ include file="footer.jsp" %>
</html>