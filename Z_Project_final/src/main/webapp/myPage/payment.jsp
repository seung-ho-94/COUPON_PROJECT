<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 데이터를 화면 출력 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<%@ include file="header.jsp" %>
<style>
input{
   height: 40px;
   width: 200px;
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;

}
select{
   height: 40px;
   width: 200px;
   border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
</style>
</head>
<body>
<br><br><br><br>
<div align="center">
<form>
   <h3><b>결제 정보</b></h3>
   <br>
   <table border="1" class="table table-hover" style="width: 30%; align-content: center;">
      <tr>
         <th>ID</th>
         <td>
            <input type="text" value="${list.member_id }" name="id" id="id" readonly="readonly">
         </td>
      </tr>
      <%-- <tr>
         <th>이름</th>
         <td>
            <input type="text" value="${list.member_name }" name="name" id="name" readonly="readonly">
         </td>
      </tr> --%>
      <tr>
         <th>E-mail</th>
         <td>
            <input type="text" value="${list.member_email }" name="email" id="email">
         </td>
      </tr>
      <tr>
         <th>결제수단</th>
         <td>
         <select name="mop" id="mop" onchange="selec(this)">
            <option value="카카오페이" selected>카카오페이</option>
         </select>
         </td>   
      </tr>
      <tr>
         <th>결제금액</th>   
         <td>
            <input type="text" value="${list.total_price }" name="total_price" id="total_price" readonly="readonly">원
         </td>
      </tr>
      <td colspan="2" style="text-align: center;">
         <br>
         <input type="submit" class="genric-btn primary" value="결제하기" onclick="javascript: form.action='kakaopay.do';" style="height: 40px;">
         <input type="hidden" value="${list.coupon_key }" name="coupon_key" id="coupon_key">
         <input type="hidden" value="${list.quantity }" name="quantity" id="quantity">
      </td>
   </table>

    <script>
       function selec(){
          var a = $("select[name=mop]").val();
          console.log($("select[name=mop]").val());
          
          let dispHtml = "<p>결제수단 : "+ a +" ";
/*           dispHtml += "<input type='text' value="+ a + " name='mop'></p></div>"; */
          dispHtml += " </p></div>";
          
          $("#result").html(dispHtml);
       }
    </script>
</form>   
</div>
</body>
<%@ include file="footer.jsp" %>
</html>