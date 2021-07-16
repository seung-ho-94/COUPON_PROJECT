<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<title>쿠폰 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
   <%@ include file="header.jsp" %>
<body onload="init();">
<script>

var sell_price;
var quantity;

function init () {
   sell_price = document.form.sell_price.value;
   quantity = document.form.quantity.value;
   document.form.total_price.value = sell_price;
   change();

   console.log(sell_price)
}

function add () {
   hm = document.form.quantity;
   total_price = document.form.total_price;
   hm.value ++ ;

   total_price.value = parseInt(hm.value) * parseInt(sell_price);
   
   console.log(total_price.value)
}

function del () {
   hm = document.form.quantity;
   total_price = document.form.total_price;
      if (hm.value > 1) {
         hm.value -- ;
         total_price.value = parseInt(hm.value) * parseInt(sell_price);
      }
}

function change () {
   hm = document.form.quantity;
   total_price = document.form.total_price;

      if (hm.value < 0) {
         hm.value = 0;
      }
      total_price.value = parseInt(hm.value) * parseInt(sell_price);
}  

/* 찜하기 예외처리 및 submmit*/
 function insert_cart(){
	if (document.form.select_date.value.trim() == ""){
		alert("예약일을 선택하세요.");
		docuemt.form.select_date.value = "";
		return false;
	}
	alert("찜하기 완료!");
	document.form.submit('mycart.do');
} 
 
</script>
</head>
<body>

 <!--event_part start-->
<section class="event_part section_padding">
   <div class="container">
      <div class="event_slider_content">
           <!-- div를 반으로 나눔 왼쪽 이미지 -->
           <div class="div_left">
             <img src="/img/${listDetail.attach_file1 }" alt="detail_img" style="height: 430px;">
           </div> 
           
           <!-- div를 반으로 나눔 오른쪽 텍스트 -->
          <div class="div_right" style="display: inline; ">
           <form action="mycart.do" name="form" method="get">
              <div class="fs py-0 my-1">
                  <span class="item-name">${listDetail.coupon_category }</span><br>
               </div>
               
               <span class="subheader"></span>
               <h2>${listDetail.name } </h2>
               
               <div class="fs py-3 my-2">
                   <span class="text-heading">${listDetail.price }원</span>
               </div>
   
<%--                 <div class="fs py-2 my-4">
                  <span style="color: blue;">${listDetail.local_category }</span>에서 만나요!
               </div>  --%>
   
               <div class="fs-19 mb-4">
                   <div class="row mb-4">
                       <label for="requestDate" class="col-3 fw-500 pt-2">예약일</label>
                       <div class="col-9">
                       <input type="date" name="select_date" class="datepicker col-12 p-2 ps-3 fs-6" style="padding-left: 20px; padding-right: 20px;">
                       </div>
                   </div>
   
                   <!-- 수량 선택 옵션 -->
                   <div class="row mb-4">
                       <div class="col-3 fw-500">수량</div>
                       <div class="col-9 count d-flex justify-content-start align-items-center">
                           <button type="button" class="border-0 bg-transparent" onclick="del();">
                               <i class="fas fa-minus-circle" style="color: #ff7e5f;"></i>
                           </button>
                           
                           <input type=hidden id="sell_price" value="${listDetail.price }" >
                     <input type="text" name="quantity" value="1" size="6" onchange="change();" readonly style="border: none; text-align: center;">
                           
                           <button type="button" class="border-0 bg-transparent" onclick="add();">
                               <i class="fas fa-plus-circle" style="color: #ff7e5f;"></i>
                           </button>
                       </div>
                   </div>
      
                  <!-- 총 주문금액 -->
                  <div class="d-flex justify-content-end align-items-baseline me-2 mb-6" style="padding-top: 10px;">
                      <span class="me-3">총 주문금액</span>
                      <span id="totalPrice" class="fw-bold fs-3">
                          <input type="text" name="total_price" size="6" readonly style="border: none; outline: none;">원</span>
                  </div>
                  
                  <div style="padding-top: 30px;" class="d-grid gap-2 d-md-flex justify-content-md-end">
                  <c:choose>
                       <c:when test="${sessionScope.loginId == null}">

                  <button type="button" class="btn btn-outline-secondary btn-lg" id="modal_show">장바구니</button>
                  <button type="button" class="btn btn-outline-secondary btn-lg" id="modal_show2">구매하기</button>
                   <!-- Modal -->
                   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                       <div class="modal-dialog modal-dialog-centered" role="document">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <h3 class="modal-title" id="exampleModalLabel">Bestrip에 오신것을 환영합니다!</h3>
                                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                   </button>
                               </div>
                               <div class="modal-body">
                                  <p>로그인 이후 이용 가능한 서비스입니다.</p>
                              <p>로그인 화면으로 이동하시려면</p>
                              <p>'로그인 페이지로 이동'을 눌러주세요.</p>
                               </div>
                               <div class="modal-footer">
                                   <a type="button" class="btn btn-primary" href="login.do">로그인 페이지로 이동</a>
                                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                               </div>
                           </div>
                       </div>
                   </div>
                   <script>
                       $(document).ready(function() {
                           $("#modal_show").click(function() {
                               $("#exampleModal").modal("show");
                               
                           });
                           $("#modal_show2").click(function() {
                               $("#exampleModal").modal("show");
                           });
                           $("#close_modal").click(function() {
                               $("#exampleModal").modal("hide");
                           });
                       });
                   </script>

                       </c:when>
                       <c:otherwise> 
                          <input type="button" value="찜하기" onclick="insert_cart(this.form)" class="btn btn-outline-secondary btn-lg"><!-- a태그로 필요한 값들만 보내기 do? 로 -->
                          <input type="button" value="구매하기" id="modal_show3" class="btn btn-outline-secondary btn-lg">
                          <input type="hidden" value="${sessionScope.loginId }" name="id">
                          <input type="hidden" value="${listDetail.coupon_key }" name="coupon_key">
                          <input type="hidden" value="${listDetail.name }" name="name">
                          <input type="hidden" value="${listDetail.price }" name="price">
                          <input type="hidden" value="${listDetail.first_date }" name="first_date">
                          <input type="hidden" value="${listDetail.last_date }" name="last_date">
                          
                   <!-- 구매하기 버튼 클릭시-->
                   <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                       <div class="modal-dialog modal-dialog-centered" role="document">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <h3 class="modal-title" id="exampleModalLabel">Bestrip</h3>
                                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                   </button>
                               </div>
                               <div class="modal-body">
                                  <p>결제 페이지로 이동하시겠습니까?</p>
                               </div>
                               <div class="modal-footer">
                               <!-- 결제 요청 -->
                                   <input type="submit" value="결제하기" class="btn btn-primary" onclick="javascript: form.action='payment.do';"/>
                                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                               </div>
                           </div>
                       </div>
                   </div>
                   <script>
                       $(document).ready(function() {
                           $("#modal_show3").click(function() {
                        	   if (document.form.select_date.value.trim() == ""){
                        			alert("예약일을 선택하세요.");
                        			docuemt.form.select_date.value = "";
                        			return false;
                        		}
                               $("#exampleModal2").modal("show");
                           });
                           $("#close_modal").click(function() {
                               $("#exampleModal").modal("hide");
                           });
                       });
                   </script>
                          
                       </c:otherwise>
                    </c:choose>    
                  </div>
                 </div>
         </form>
           </div>
      </div>
   </div>
</section>
    <hr style="margin-top: -50px;">
    <!--event_part end-->
    
     <!-- tour details content css start-->
    <section class="tour_details_content section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="content_iner">
                       ${listDetail.content }

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- tour details content css end-->
    

</body>
<%@ include file="footer.jsp" %>
</html>