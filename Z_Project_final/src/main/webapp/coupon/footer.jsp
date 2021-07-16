<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title></title>
<link rel="icon" href="../Resources/img/favicon.png">
<link rel="stylesheet" href="../Resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../Resources/css/animate.css">
<link rel="stylesheet" href="../Resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../Resources/css/themify-icons.css">
<link rel="stylesheet" href="../Resources/css/flaticon.css">
<link rel="stylesheet" href="../Resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../Resources/css/magnific-popup.css">
<link rel="stylesheet" href="../Resources/css/gijgo.min.css">
<link rel="stylesheet" href="../Resources/css/nice-select.css">
<link rel="stylesheet" href="../Resources/css/slick.css">
<link rel="stylesheet" href="../Resources/css/style.css">
<br><br>

  <!-- footer part start-->
    <footer class="footer-area">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6 col-md-5">
                    <div class="single-footer-widget">
                        <h4>전국 유명지를 한번에 볼 수 있어요!</h4>
                        <ul>
                            <li><a href="localcoupon.do?local_category=서울">서울</a></li>
                            <li><a href="localcoupon.do?local_category=부산">부산</a></li>
                            <li><a href="localcoupon.do?local_category=제주도">제주</a></li>
                            <li><a href="localcoupon.do?local_category=강원도">강원도</a></li>
                            <li><a href="localcoupon.do?local_category=경기도">경기도</a></li>
                            <li><a href="localcoupon.do?local_category=경상도">경상도</a></li>
                            <li><a href="localcoupon.do?local_category=충청도">충청도</a></li>
                            <li><a href="localcoupon.do?local_category=전라도">전라도</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="single-footer-widget">
                        <h4>고객센터 운영 안내</h4>
                        <div class="form-wrap" id="mc_embed_signup">
                        <ul>
                        	<li style="color:white;">평일(채팅/유선) : 09:00-18:00 (12시~13시 제외)</li>
                        	<li style="color:white;">주말/공휴일 : 이메일 상담만 가능</li>
                        	<li style="color:white;">유선상담 : 1689-0452</li>
                        	<a href="goFaq.do">자주묻는 질문</a><br>
                        	<c:choose>
                              <c:when test="${sessionScope.loginId == null}">
                                 <a href="login.do">1대1문의</a>
                              </c:when>
                              <c:otherwise> 
                                         <a href="setQna.do">1대1문의</a>
                              </c:otherwise>
                           </c:choose>    
                        </ul>
                        </div>
                        <p>제휴문의<a href="setcontact.do"> xlqmdl123@naver.com</a></p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="single-footer-widget footer_icon">
                        <h4>회사소개</h4>
                        <p> 서울특별시 마포구 신수동 63-14</p>
                        <span>xlqmdl123@naver.com</span>
                        <div class="social-icons">
                            <a href="adminLogin.do"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                            <a href="https://www.instagram.com/sh.dla_/"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0">
                        <p>상호명 베스트립 bestrip | 대표 베스트립 | 개인정보보호책임자 베스트립 | 사업자등록번호 259-9045-21</p>
                       	<p>사업자정보확인 | 통신판매업신고번호 2019-서울특별시 마포구 백범로 23지번서울특별시 마포구 신수동 63-14 |</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer part end-->
    
<script src="../Resources/js/jquery-1.12.1.min.js"></script>
<script src="../Resources/js/popper.min.js"></script>
<script src="../Resources/js/bootstrap.min.js"></script>
<script src="../Resources/js/jquery.magnific-popup.js"></script>
<script src="../Resources/js/owl.carousel.min.js"></script>
<script src="../Resources/js/masonry.pkgd.js"></script>
<script src="../Resources/js/jquery.nice-select.min.js"></script>
<script src="../Resources/js/gijgo.min.js"></script>
<script src="../Resources/js/jquery.ajaxchimp.min.js"></script>
<script src="../Resources/js/jquery.form.js"></script>
<script src="../Resources/js/jquery.validate.min.js"></script>
<script src="../Resources/js/mail-script.js"></script>
<script src="../Resources/js/contact.js"></script>
<script src="../Resources/js/custom.js"></script>
</body>
</html>