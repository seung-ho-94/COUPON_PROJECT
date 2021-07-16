<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaopay</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
	    function goGet(){
	        location.href="insertPurchaseList.do?id=${list.member_id }"
	              + "&email=${list.member_email }"
	              + "&total_price=${list.total_price }"
	              + "&payment_option=${list.mop }"
	              + "&coupon_key=${list.coupon_key }"
	              + "&quantity=${list.quantity }";
	     }
	    
	    $(function(){
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp45251234'); // 부여받은 "가맹점 식별코드"를 사용
	        
	        IMP.request_pay({
	            pg : 'kakaopay', // 결제수단 (version 1.1.0부터 지원)
	            pay_method : 'card', // 결제방식??
	            merchant_uid : 'merchant_' + new Date().getTime(), // 결제일시 (알림톡)
	            name : 'Bestrip 상품(쿠폰) 결제',	// 상품명 (알림톡)
	            amount : '${list.total_price }', // 결제금액 (알림톡)
	            buyer_email : '${list.member_email }' // 이메일 (어디에 쓰이는지 모르겠음)
	        }, function(rsp) {
	            if ( rsp.success ) {
					// 결제 성공시 데이터를 전달해서 구매내역 테이블 (PURCHASE_LIST)에 insert
					alert('결제가 완료되었습니다.');
					goGet()
	            } else {
	            	// 결제 실패시 실패했다고 띄어주고 페이지 이동
	            	alert('결제실패');
	            	location.href="couponDetail.do?coupon_key=${list.coupon_key }"
	            }
	        });
	    });
    </script>
</body>
</html>