<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

<head>
<meta charset="utf-8">
<!-- <script src="./Resources/js/jquery.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Bestrip Travel!</title>
<link rel="icon" href="./Resources/img/favicon.png">
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./Resources/css/animate.css">
<link rel="stylesheet" href="./Resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="./Resources/css/themify-icons.css">
<link rel="stylesheet" href="./Resources/css/flaticon.css">
<link rel="stylesheet" href="./Resources/fontawesome/css/all.min.css">
<link rel="stylesheet" href="./Resources/css/magnific-popup.css">
<link rel="stylesheet" href="./Resources/css/gijgo.min.css">
<link rel="stylesheet" href="./Resources/css/nice-select.css">
<link rel="stylesheet" href="./Resources/css/slick.css">
<link rel="stylesheet" href="./Resources/css/style.css">

<style>

/* 메인 지역 카테고리 이미지 크기 맞추기 */
.imgSize{
   height: 450px; width: 550px;
   position: relative;
   background-repeat: no-repeat;
   background-size: cover;
}

.astyle:hover img {
  transition: transform 1s;
  filter: brightness(40%);
  transform: scale(1.03);
}

.carousel-content {
  position: absolute;
  bottom: 10%;
  left: 5%;
  z-index: 20;
  color: white;
  text-shadow: 0 1px 2px rgba(0,0,0,.6);
}
</style>
<script>

   $.ajax({
      url : "mainbest.do",
      type : "get",
       dataType : "json",
      success : function(data){
         console.log(data);
         let dispHtml = "<div class='single_ihotel_list' style='height: 500px;'>";
         dispHtml = "<a href='couponDetail.do?coupon_key="+ data[0].coupon_key +"'><img src='/img/" + data[0].attach_file1 +"' alt='상품사진'style='height:250px;'></a>";
         dispHtml +=  "<div>";
         dispHtml +=  "<br>";
         dispHtml += "<h3>" + data[0].name + "</h3>";
         dispHtml += "<h5><span>" + data[0].price + " 원 </span></h5>";
         dispHtml += "<br>";
         dispHtml += "<div>";
         dispHtml += "<i class='fas fa-heart' style='color: red;'></i> <span>" + "(" + data[0].like_count + ")" + "</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"; 
         dispHtml += "<i class='fas fa-search' style='color: black;'></i> <span>" + "(" + data[0].hit + ")" + "</span>";
         dispHtml += "</div>";
         dispHtml += "</div>";
         dispHtml += "</div>";
         $("#listDisp").html(dispHtml);
          
         let dispHtml2 = "<div class='single_ihotel_list' style='height: 500px;'>";
         dispHtml2 = "<a href='couponDetail.do?coupon_key="+ data[1].coupon_key +"'><img src='/img/" + data[1].attach_file1 +"' alt='상품사진' style='height:250px;'></a>";
         dispHtml2 +=  "<div>";
         dispHtml2 +=  "<br>";
         dispHtml2 += "<h3>" + data[1].name + "</h3>";
         dispHtml2 += "<h5><span>" + data[1].price + " 원 </span></h5>";
         dispHtml2 += "<br>";
         dispHtml2 += "<div>";
         dispHtml2 += "<i class='fas fa-heart' style='color: red;'></i> <span>" + "(" + data[1].like_count + ")" + "</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"; 
         dispHtml2 += "<i class='fas fa-search' style='color: black;'></i> <span>" + "(" + data[1].hit + ")" + "</span>";
         dispHtml2 += "</div>";
         dispHtml2 += "</div>";
         dispHtml2 += "</div>";
         $("#listDisp2").html(dispHtml2);
           
         let dispHtml3 = "<div class='single_ihotel_list' style='height: 500px;'>";
         dispHtml3 = "<a href='couponDetail.do?coupon_key="+ data[2].coupon_key +"'><img src='/img/" + data[2].attach_file1 +"' alt='상품사진' style='height:250px;'></a>";
         dispHtml3 +=  "<div>";
         dispHtml3 +=  "<br>";
         dispHtml3 += "<h3>" + data[2].name + "</h3>";
         dispHtml3 += "<h5><span>" + data[2].price + " 원 </span></h5>";
         dispHtml3 += "<br>";
         dispHtml3 += "<div>";
         dispHtml3 += "<i class='fas fa-heart' style='color: red;'></i> <span>" + "(" + data[2].like_count + ")" + "</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"; 
         dispHtml3 += "<i class='fas fa-search' style='color: black;'></i> <span>" + "(" + data[2].hit + ")" + "</span>";
         dispHtml3 += "</div>";
         dispHtml3 += "</div>";
         dispHtml3 += "</div>";
         $("#listDisp3").html(dispHtml3);  
          
      },

   });

</script>
</head>
<body>

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
                             <p><a href="mapListInfo.do" class="nav-link fas fa-map-marker-alt" >&nbsp;지도 둘러보기</a></p>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->

    <!-- banner part start-->
     <!-- banner part start-->
    <section class="banner_part" style="background-image: url(../Resources/img/banner_bg.png)">
        <div class="container" style="margin-top: -120px;">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <h1 style="font-size: 80px;"> Things to do in Bestrip</h1>
                            <p>BookNow Deals, Fun things to do</p>
                            <p>Activities, Attractions, & Tours await...</p>
                            <a href="allcoupon.do" class="btn_1" style="font-size: 18px;">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->
<!--     <section class="banner_part">              
        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 700px; z-index: -5;">
            Indicators
            
            <ul class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ul>
            
            The slideshow
            <div class="carousel-inner">
                <div class="carousel-item active" style="position: relative;">
                    <img src="/img/banner_bg.png" alt="메인배너" width="800" height="700px">
                </div>
                <div class="carousel-item">
                    <img src="/img/제주도사진.png" alt="메인배너" width="1100" height="700px">
                </div>
                <div class="carousel-item">
                    <img src="/img/충청도배너.png" alt="메인배너" width="1100" height="700px">
                </div>
                <div class="carousel-item">
                    <img src="/img/경상도배너.png" alt="메인배너" width="1100" height="700px">
                </div>
                <div class="carousel-item">
                    <img src="/img/강원도배너.png" alt="메인배너" width="1100" height="700px">
                </div>
            </div>
            Left and right controls
            
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next"> 
                <span class="carousel-control-next-icon"></span>
            </a>
            
        </div>
    </section> -->
    <!-- banner part end-->
    
    <!-- 검색바 -->
<form action ="searchkeywordall.do">
<div class="container">      
   <div class="row justify-content-center">
      <div class="col-12 col-md-10 col-lg-8">
         <div class="card-body row no-gutters align-items-center" style="z-index: 4;">
            <div class="col">
                  <input class="form-control form-control-lg form-control-borderless"
                  name="searchkeyword" type="search" placeholder="내가 찾는 쿠폰을 검색해보세요" style="margin-top: 28px;">
               </div>
            <div class="col-auto">
               <button class="btn btn-lg btn-success" type="submit" style="margin-top: 28px;">검색</button>
            </div>
         </div>
      </div>
   </div>
</div>
</form>
<!-- 검색바 끝 -->

<!--::industries start::-->
<!-- 전체 메인 베스트 쿠폰 3개  -->
<section class="hotel_list section_padding" style="background-color: #f8f8f8; margin-top: 25px;">
     <div class="container" style="margin-bottom: -40px;">
         <div class="row justify-content-center">
            <div class="col-xl-6">
                    <div class="section_tittle text-center" style="margin-top: -30px;">
                        <h2>실시간 베스트 쿠폰  <i class='fas fa-search' style='color: #0c3e72;'></i> </h2>
                        <h2 style="font-size: 15px;">더 넓은 세상을 경험하고, 잊지 못할 순간을 예약하세요!</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-6"  style="margin-top: -50px;">
                    <div class="single_ihotel_list">
                        <div class="hover_text">
                            <div class="hotel_social_icon">
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                           <div id="listDisp">
                            <h3>   </h3>
                            </div>
                            <div id="listDisp">
                            </div>
                                <div id="listDisp">
                                <span>  </span>
                                </div>
                           <div id="listDisp">
                            <h5><span>  </span></h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6" style="margin-top: -50px;">
                    <div class="single_ihotel_list">
                        <div class="hover_text">
                            <div class="hotel_social_icon">
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                           <div id="listDisp2">
                            <h3>   </h3>
                            </div>
                     <div id="listDisp2">
                            </div>
                                <div id="listDisp2">
                                <span>  </span>
                                </div>

                           <div id="listDisp2">
                            <h5><span>  </span></h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6" style="margin-top: -50px;">
                    <div class="single_ihotel_list">
                        <div class="hover_text">
                            <div class="hotel_social_icon">
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                           <div id="listDisp3">
                            <h3>   </h3>
                            </div>
                     <div id="listDisp3">
                            </div>
                                <div id="listDisp3">
                                <span>  </span>
                                </div>

                           <div id="listDisp3">
                            <h5><span>  </span></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::industries end::-->

    <!--top place start-->
    <section class="top_place section_padding" style="margin-top: -100px;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single_place" >
                    <a href="localcoupon.do?local_category=서울" class="astyle"><img src="/img/서울.png" alt="" class="imgSize"></a>
                       <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner" style="margin-left: 40px;">
                                <h3>서울</h3>
                                <p>Seoul</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <!-- <i class="ti-share"></i> -->
                            </div>
                        </div>
                    </div>
                </div>
                    
               <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                    <a href="localcoupon.do?local_category=부산"  class="astyle"><img src="/img/qntks.png" alt="" class="imgSize"></a>
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner" style="margin-left: 40px;">
                                <h3>부산</h3>
                                <p>Busan</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <!-- <i class="ti-share"></i> -->
                            </div>
                        </div>
                    </div>
                </div>
               <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                    <a href="localcoupon.do?local_category=제주도"  class="astyle"><img src="/img/jejudo1.png" alt="" class="imgSize"></a>
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner" style="margin-left: 40px;">
                                <h3>제주도</h3>
                                <p>Jeju Island</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                    <a href="localcoupon.do?local_category=강원도"  class="astyle"><img src="/img/gangwon.png" alt="" class="imgSize"></a>
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner" style="margin-left: 40px;">
                                <h3>강원도</h3>
                                <p>Gangwondo</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                    <a href="localcoupon.do?local_category=경기도"  class="astyle"><img src="/img/수원.png" alt="" class="imgSize"></a>
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner" style="margin-left: 40px;">
                                <h3>경기도</h3>
                                <p>Gyeonggido</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                    <a href="localcoupon.do?local_category=경상도"  class="astyle"><img src="/img/wlsgo.png" alt="" class="imgSize"></a>
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner" style="margin-left: 40px;">
                                <h3>경상도</h3>
                                <p>Gyeongsangdo</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                    <a href="localcoupon.do?local_category=충청도"  class="astyle"><img src="/img/충청도.png" alt="" class="imgSize"></a>
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner" style="margin-left: 40px;">
                                <h3>충청도</h3>
                                <p>Chungcheongdo</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                    <a href="localcoupon.do?local_category=전라도"  class="astyle"><img src="/img/전라도.png" alt="" class="imgSize"></a>
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner" style="margin-left: 40px;">
                                <h3>전라도</h3>
                                <p>Jeollado</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--top place end-->

    <!--::industries start::-->
    <section class="best_services section_padding" style="margin-top: -145px; margin-bottom: -26px;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    
                </div>
            </div>
            <div class="row">
            <a href="categorycoupon.do?coupon_category=수상레저">
            <img src="./Resources/img/main_bottom_banner.png" style="width: 1325px; height: 252px;">
            </a>    
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        
                    </div>
                </div>
            </div>
            </div>
    </section>
    <!--::industries end::-->

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
                          <p>사업자정보확인 | 통신판매업신고번호 2019-서울특별시 마포구 신수동 63-14 |</p>
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