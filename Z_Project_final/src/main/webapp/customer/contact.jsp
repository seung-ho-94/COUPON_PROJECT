<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 데이터를 화면 출력 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bestrip Travel!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<%@ include file="header.jsp" %>

   <script>
   function contact_Check() {

   	console.log("진입");
   	
   	if (document.conatactInfo.content.value.trim() == "") {
           alert("내용을 입력하세요.");
           document.conatactInfo.content.value = "";
           document.conatactInfo.content.focus();
              return false;
   	   }
   	
   	if (document.conatactInfo.name.value.trim() == "") {
           alert("이름을 입력하세요.");
           document.conatactInfo.name.value = "";
           document.conatactInfo.name.focus();
              return false;
   	   }
   
   	if (document.conatactInfo.email.value.trim() == "") {
           alert("이메일을 입력하세요.");
           document.conatactInfo.email.value = "";
           document.conatactInfo.email.focus();
              return false;
   	   }
   	
   	if (document.conatactInfo.title.value.trim() == "") {
           alert("제목을 입력하세요.");
           document.conatactInfo.title.value = "";
           document.conatactInfo.title.focus();
              return false;
   	   }
   	
           document.conatactInfo.submit();
   }            

</script>
</head>
<body>
<section><br><br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="contact-title">제휴문의</h2>
                </div>
                <div class="col-lg-8">
                    <form action="setcontact.do" method="post" class="form-contact contact_form"
                    id="contactForm" novalidate="novalidate" name="conatactInfo">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">

                                    <textarea class="form-control w-100" name="content" id="content"
                                    cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = '문의 내역을 입력해주세요'"
                                    placeholder='문의 내역을 입력해주세요'></textarea>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control" name="name" id="name" type="text"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" placeholder='이름'>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control" name="email" id="email" type="email"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'" placeholder='이메일'>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <input class="form-control" name="title" id="title" type="text"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = '제목'" placeholder='제목'>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <input type="button" value="문의하기" class="button button-contactForm btn_1" onclick="contact_Check(this.form)">
                        </div>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-home"></i></span>
                        <div class="media-body">
                            <h3>Bestrip</h3>
                            <p>서울특별시 마포구 신수동 63-14</p>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                        <div class="media-body">
                            <h3>00 (440) 2589 0452</h3>
                            <p>평일 09:00 ~ 18:00(12~13시 제외)</p>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <h3>xlqmdl123@naver.com</h3>
                            <p>이메일 문의</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ contact section end ================= -->
</body>
<%@ include file="footer.jsp" %>
</html>