<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Bestrip Travel!</title>
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
</head>
<body>    
<script>
var searchField = $('.search');
var searchInput = $("input[type='search']");

var checkSearch = function(){
    var contents = searchInput.val();
    if(contents.length !== 0){
       searchField.addClass('full');
    } else {
       searchField.removeClass('full');
    }
};

$("input[type='search']").focus(function(){
    searchField.addClass('isActive');
  }).blur(function(){
  	searchField.removeClass('isActive');
    checkSearch();
});
</script>

   <!-- 최상단 메뉴 -->
   <header class="main_menu">
   <!-- 로그인 전후 확인 -->
   <c:choose >
      <c:when test="${sessionScope.loginId == null}">
        <div class="sub_menu">
            <div class="container">
                <div class="row">
                    <!-- <div class="flex-grow: 1;"> -->
                        <div class="sub_menu_social_icon">
                           <%-- 43번째줄 --%>
                           <a href="login.do" >로그인</a>
                           <a href="signup.do" >회원가입</a>
                           <a href="setcontact.do" >제휴문의</a>
                           <c:choose>
                                 <c:when test="${empty adminInfo }">
                                 <a href="adminLogin.do">관리자</a>
                                 </c:when>
                                 <c:otherwise>
                                  <a href="adminMain.do">관리자</a>
                                 </c:otherwise>
                           </c:choose>                           
                       </div>
                    <!-- </div> -->
                </div>
            </div>
        </div>
      </c:when>
   <c:otherwise>   
              <div class="sub_menu">
            <div class="container">
                <div class="row">
                    <div class="flex-grow: 1;">
                        <div class="sub_menu_social_icon">
                           <%-- 43번째줄 --%>
                            <a href="member/logout.jsp">로그아웃</a>
                            <a href="buyCartList.do">마이페이지</a>
                            <a href="setcontact.do" >제휴문의</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:otherwise>
   </c:choose>    
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="main.jsp"> <img src="./Resources/img/logo.png" alt="logo" style="height: 60px; width: 150px;"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                     <!-- 상단 메뉴 -->
                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="categorycoupon.do?coupon_category=수상레저">수상레저</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="categorycoupon.do?coupon_category=아웃도어/스포츠">아웃도어/스포츠</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="categorycoupon.do?coupon_category=티켓/투어">티켓/투어</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                                                                                  커뮤니티
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="selectFreeBoardList.do">자유 게시판</a>
                                            <a class="dropdown-item" href="selectTripInfoBoardList.do">여행 정보</a>
                                            <a class="dropdown-item" href="community/list_all?category=review">리뷰 게시판</a>             
                                        </div>
                                    </li>
                                <li class="nav-item dropdown">
                                   <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                   role="button" data-toggle="dropdown" aria-haspopup="true"
                                   aria-expanded="false">
                                                                              고객센터
                               </a>
                               <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                  <%-- 82번줄 --%>
                                   <a class="dropdown-item" href="getBoardListNotice.do">공지사항</a>
                           <c:choose>
                              <c:when test="${sessionScope.loginId == null}">
                                 <a class="dropdown-item" href="login.do">1대1문의</a>
                              </c:when>
                              <c:otherwise> 
                                         <a class="dropdown-item" href="setQna.do">1대1문의</a>
                              </c:otherwise>
                           </c:choose>    
                                   <a class="dropdown-item" href="goFaq.do">자주하는 질문</a>
                               </div>
                                     </li>
                                </ul>
                            </div>
                           <p><a href="mapListInfo.do" class="fas fa-map-marker-alt">&nbsp;지도 둘러보기</a></p>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->
    
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
    
    
    