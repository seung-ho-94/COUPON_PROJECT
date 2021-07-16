<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="./Resources/js/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<title>Bestrip Travel!</title>
<%@ include file="header.jsp" %>
<style>

.astyle:hover img {
  transition: transform 1s;
  filter: brightness(90%);
  transform: scale(1.03);
}

</style>
</head>
<body>
   <!-- Search Category part start -->
   <section class="booking_part" style="height: 380px;">
    <!-- <section class="booking_part"> -->
      <div class="container">
          <div class="row">
              <div class="col-lg-12">
                  <div class="booking_menu">
                      <ul class="nav nav-tabs" id="myTab" role="tablist">
                          <li class="nav-item">
                          </li>
                      </ul>
                  </div>
              </div>       
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 380px;">
            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
                <li data-target="#myCarousel" data-slide-to="6"></li>
                <li data-target="#myCarousel" data-slide-to="7"></li>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner" class="image">
                <div class="carousel-item active">
                    <a href="localcoupon.do?local_category=서울"><img src="/img/지역_서울.png" width="1100" height="380px"></a>
                </div>
                <div class="carousel-item">
                    <a href="localcoupon.do?local_category=부산"><img src="/img/지역_부산.png" width="1100" height="380px"></a>
                </div>
                <div class="carousel-item">
                    <a href="localcoupon.do?local_category=제주도"><img src="/img/지역_제주도.png" width="1100" height="380px"></a>
                </div>
                <div class="carousel-item">
                    <a href="localcoupon.do?local_category=강원도"><img src="/img/지역_강원도.png" width="1100" height="380px"></a>
                </div>
                <div class="carousel-item">
                    <a href="localcoupon.do?local_category=경기도"><img src="/img/지역_경기도.png" width="1100" height="380px"></a>
                </div>
                <div class="carousel-item">
                    <a href="localcoupon.do?local_category=경상도"><img src="/img/지역_경상도.png" width="1100" height="380px"></a>
                </div>
                <div class="carousel-item">
                    <a href="localcoupon.do?local_category=충청도"><img src="/img/지역_충청도.png" width="1100" height="380px"></a>
                </div>
                <div class="carousel-item">
                    <a href="localcoupon.do?local_category=전라도"><img src="/img/지역_전라도.png" width="1100" height="380px"></a>
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next"> 
                <span class="carousel-control-next-icon"></span>
            </a>
            
        </div>                  
<!-- 지역 슬라이드 배너 part end -->

<!-- 검색바 -->
<form action ="getsearchcoupon_Category.do" style="margin-top: 40px;">
 <div class="container">      
    <div class="row justify-content-center">
       <div class="col-12 col-md-10 col-lg-8">
          <div class="card-body row no-gutters align-items-center">
             <div class="col">
                <input class="form-control form-control-lg form-control-borderless"
                name="searchkeyword" type="search" placeholder="내가 찾는 쿠폰을 검색해보세요" style="font-size: 17px;">
             </div>
             <div class="col-auto">
                <button class="genric-btn primary" type="submit"  style="font-size: 17px;" >Search</button>
             </div>
          </div>
       </div>
    </div>
 </div>
  <input type="hidden" value="${cate }" name="coupon_category">
 </form>
<!-- 검색바 끝 -->
    
   <!-- 정렬 -->
<div class="col-lg-12">
   <div class="tab-content" id="myTabContent">
      <div class="booking_form">
            <div class="form-row" style="margin-top: 20px;">
                <div class="form_colum">
                <form action="categorycouponselectlocal.do" method="get"  >
                     <select class="nc_select" name="local_category" onchange="this.form.submit()">
                     	<option value="" selected disabled hidden>지역</option>
                        <option value="서울">서울</option>
                        <option value="부산">부산</option>
                        <option value="제주도">제주도</option>
                        <option value="강원도">강원도</option>
                        <option value="경기도">경기도</option>
                        <option value="경상도">경상도</option>
                        <option value="충청도">충청도</option>
                        <option value="전라도">전라도</option>
                    </select> 
                    <input type="hidden" value="${cate }" name="coupon_category">
                  </form>    
                  </div>
                  <div class="form_colum">
                  <form action="sortcategory.do" method="get" >
                  <select class="nc_select" name="sortname" onchange="this.form.submit()">
                      <option value="조회순" selected>조회순</option>
                      <option value="인기순">인기순</option>
                      <option value="낮은가격순">낮은가격순</option>
                      <option value="높은가격순">높은가격순</option>
                      <option value="신상품순">신상품순</option>
                  </select>
                  <input type="hidden" value="${cate }" name="coupon_category">
              </form>
                      </div>
                      <div class="form_colum">
                      <form action="datego.do" method="get" >
                          <input type="date" name="sortname" 
                          onchange="this.form.submit()" class="gj-datepicker" style="padding-left: 20px; padding-right: 20px;">
                          <input type="hidden" value="${cate }" name="coupon_category">
                  </form>
                      </div>
                      <div class="form_colum" style="width: 210px;">
                          <a type="button" href="mapListInfo.do" class="gj-datepicker" style="padding-left: 20px; padding-right: 20px;">지도로 보러가기</a>
                      </div>
                  </div>
               </div>
              </div>
          </div>
      </div>
  </div>
</section> 
    <!-- 정렬 끝 -->

    <!-- 추천상품 -->
 <br>
 <section class="hotel_list" id="=section_padding" style="margin-top: 250px;">
        <div class="container">
        <h3><b>추천상품</b></h3>
            <div class="row">
            <c:forEach var="bestlist" items="${bestlist }" >
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list" style="height: 500px;">
               <br>
                        <a href="couponDetail.do?coupon_key=${bestlist.coupon_key }" class="astyle"><img src="/img/${bestlist.attach_file1 }" alt="상품사진" style="height: 200px;"></a>
                        <div class="hotel_text_iner">
                        
                            <h3> <a href="couponDetail.do?coupon_key=${bestlist.coupon_key }" class="astyle"> ${bestlist.name }</a></h3>
                            <div class="place_review">                              
                             <i class="fas fa-heart" style="color: red;"></i>
                                <span>(${bestlist.like_count })</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <i class="fas fa-search" style="color: black;"></i>
                                <span>(${bestlist.hit })</span>
                            </div>
                            <p><span>${bestlist.first_date } ~ ${bestlist.last_date }</span></p>
                            <br>
                            <h5><span>${bestlist.price }원</span></h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
         </div>
    </section>   
<br>
<!-- 추천상품 끝 -->
    <section class="hotel_list" id="=section_padding">
        <div class="container">
        <c:choose>
        <c:when test="${sort == null}">
           <br>
        </c:when>
        <c:otherwise> 
        <br>
         <h4 align="right"><b>[${sort } 검색]</b></h4>
        </c:otherwise>
        </c:choose>
            <div class="row">
            <c:forEach var="list" items="${list }" >
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list" style="height: 500px;">
               <br>
                        <a href="couponDetail.do?coupon_key=${list.coupon_key }" class="astyle"><img src="/img/${list.attach_file1 }" alt="상품사진" style="height: 200px;"></a>
                        <div class="hotel_text_iner">
                        
                            <h3> <a href="couponDetail.do?coupon_key=${list.coupon_key }" class="astyle"> ${list.name }</a></h3>
                            <div class="place_review">
                                <i class="fas fa-heart" style="color: red;"></i>
                                <span>(${list.like_count })</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <i class="fas fa-search" style="color: black;"></i>
                                <span>(${list.hit })</span>
                            </div>
                            <p><span>${list.first_date } ~ ${list.last_date }</span></p>
                            <br>
                            <h5><span>${list.price }원</span></h5>
                        </div>
                    </div>
                    <br>
                    <br>
                </div>
            </c:forEach>
            </div>
         </div>
    </section>  
    <br><br><br><br>   
   <!-- Local Coupon part end -->
</body>
<%@ include file="footer.jsp" %>
</html>