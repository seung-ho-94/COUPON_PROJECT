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

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-colorschemes@0.4.0/dist/chartjs-plugin-colorschemes.min.js"></script>

<title>Bestrip Travel!</title>
<%@ include file="header.jsp" %>
<style>
.black_overlay{
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.80;
	filter: alpha(opacity=80);
}

.white_content {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	padding: 16px;
	border: 16px solid #eaefff;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
</style>
</head>
<body>

   <!-- Search Category part start -->
   <section class="booking_part" style="height: 10px; ">
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
<!-- Button trigger modal -->

<!-- 검색바 -->
<form action ="searchkeywordall.do" style="margin-top: 40px;">
 <div class="container">      
    <div class="row justify-content-center">
       <div class="col-12 col-md-10 col-lg-8">
          <div class="card-body row no-gutters align-items-center">
             <div class="col">
                <input class="form-control form-control-lg form-control-borderless"
                type="search" name="searchkeyword"placeholder="내가 찾는 쿠폰을 검색해보세요" style="font-size: 17px;">
             </div>
             <div class="col-auto">
                <button type="submit" class="genric-btn primary"  style="font-size: 17px;" >검색</button>
             </div>
          </div>
       </div>
    </div>
 </div>
 </form>
<!-- 검색바 끝 -->
<!-- 정렬 -->
<div class="col-lg-30">
	<div class="tab-content" id="myTabContent">
		<div class="booking_form">
         	<div class="form-row" style="margin-top: 20px;">
	             <div class="form_colum" style="width: 210px;">
	             <form action="/alllocal.do" method="get"  >
	                  <select class="nc_select" name="local_category" onchange="this.form.submit()">
 	                  	 <option value="지역" selected disabled hidden>지역</option>
						 <option value="서울">서울</option>
	                     <option value="부산">부산</option>
	                     <option value="제주도">제주도</option>
	                     <option value="강원도">강원도</option>
	                     <option value="경기도">경기도</option>
	                     <option value="경상도">경상도</option>
	                     <option value="충청도">충청도</option>
	                     <option value="전라도">전라도</option>
	                 </select> 
                  </form>
                  </div>
                  <div class="form_colum" style="width: 210px;">
                  <form action="allcategory.do" method="get" >
						<select class="nc_select" name="coupon_category" onchange="this.form.submit()">
					    	<option value="카테고리" selected disabled hidden>카테고리</option>
					        <option value="수상/레저">수상/레저</option>
					        <option value="아웃도어/스포츠">아웃도어/스포츠</option>
					        <option value="티켓/투어">티켓/투어</option>
					    </select> 
				  </form>
				  <!-- 지역 정렬  -->
                      </div>
                  <div class="form_colum" style="width: 210px;">
                  <form action="sortallcoupon.do" method="get" >
						<select class="nc_select" name="sortname" onchange="this.form.submit()">
						    <option value="조회순" selected>조회순</option>
						    <option value="인기순">인기순</option>
						    <option value="낮은가격순">낮은가격순</option>
						    <option value="높은가격순">높은가격순</option>
						    <option value="신상품순">신상품순</option>
						</select>
				  </form>
                      </div>
                      <div class="form_colum" style="width: 210px;">
                      <form action="datego3.do" method="get" >
                          <input type="date" name="sortname" 
                          onchange="this.form.submit()" class="gj-datepicker" style="padding-left: 20px; padding-right: 20px;">
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
<section class="hotel_list" id="=section_padding" style="margin-top: 240px;">
        <div class="container">
<!-- 데이터 시각화 -->
 <p> <a href = "javascript:void(0)" style="width:1130px;" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" class="genric-btn success-border circle">Hot한 키워드 보기</a></p>
<div id="light" class="white_content">
	<a href = "javascript:void(0)" class="genric-btn success-border circle" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">닫기</a>
		<div class="chart-container" style="position: relative; height:95vh; width:95vw;">
		<canvas id="myChart"></canvas>
		<script>
		$.ajax({
		    url : "searchKey.do",
		    type : "post",
		     dataType : "json",
		    success : function(data){
		       console.log(data);
		       console.log(data[0].C);
		
		var ctx = document.getElementById('myChart');
			
			var data = {
			    labels: [data[0].KEYWORD, data[1].KEYWORD, data[2].KEYWORD, data[3].KEYWORD, data[4].KEYWORD],
			    datasets: [{
			        label: '# of household',
			        data: [data[0].C, data[1].C, data[2].C, data[3].C, data[4].C],
			        borderWidth: 1
			    }]
			};
			
		
		var myChart = new Chart(ctx, {
		    type: 'pie',
		    data: data,
		    options: {
		        title: {
		            display: true,
		            text: '키워드 TOP5!',
		            position: 'top',
		            fontSize: 20,
		            fontColor: '#000'
		        },
		        plugins: {
		            labels: [
		                {
		                    render: function (options) {
		                        var value = options.value;
		                        return value + "번";
		                    },
		                    fontSize: 20,
		                    fontStyle: 'bold',
		                    fontColor: '#000',
		                    position: 'outside',
		                    outsidePadding: 40,
		                    textMargin: 10
		                },
		                {
		                    render: 'label',
		                    fontSize: 20,
		                    fontStyle: 'bold',
		                    fontColor: '#000'
		                }
		            ],
		            colorschemes: {
		                scheme: 'tableau.Tableau20'
		            }
		        }
		    }
		});
		
		    }
		});
		</script> 
		</div>       
	</div>
<div id="fade" class="black_overlay"></div>
<!-- 데이터 시각화 -->
         </div>
    </section>	
	<br>
    <section class="hotel_list" id="=section_padding">
        <div class="container">
        <c:choose>
        <c:when test="${sort == null}">
           <br>
        </c:when>
        <c:otherwise> 
			<h4 align="right"><b>[${sort } 검색]</b></h4>
        </c:otherwise>
        </c:choose>
            <div class="row">
            <c:forEach var="list" items="${list }" >
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list" style="height: 500px;">
					<br>
                        <a href="couponDetail.do?coupon_key=${list.coupon_key }"><img src="/img/${list.attach_file1 }" alt="상품사진" style="height: 200px;"></a>
                        <div class="hotel_text_iner">
                        
                            <h3> <a href="couponDetail.do?coupon_key=${list.coupon_key }"> ${list.name }</a></h3>
                            <div class="place_review">
                                <i class="fas fa-heart" style="color: red;"></i>
                                <span>(${list.like_count })</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <i class="fas fa-search" style="color: black;"></i>
                                <span>(${list.hit })</span>
                            </div>
                            <p><span>${list.first_date } ~ ${list.last_date }</span></p>
                            <br>
                            <h5>가격 : <span>${list.price }원</span></h5>
                        </div>
                    </div>
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