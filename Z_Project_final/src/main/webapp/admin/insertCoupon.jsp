<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 등록</title>
   
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   
   <style>
      #main-css {
         position: relative;
         margin:0 25% 0 25%;
      }
      
      .grid {
         text-align: center;
      }
      
      .img-content {
          outline: 2px dashed #4B89DC;
          transition: all .15s ease-in-out;
          width: 200px;
          height: 200px;
      }
      
      .label-scope {
         width: 200px;
          height: 225px;
      }
      
      .label-scope.second {
         margin: 0 5% 0 5%;
      }
      
      .img-content:hover {
         filter: brightness(70%);
         outline-offset: -20px;
         cursor: pointer;
      }
      
      .center {
         text-align: center;
      }
      
   </style>

   <script>
      <%-- 입력 예외처리 --%>
      function insertCheck() {
         if (document.couponInsertInfo.name.value.trim() == "") {
            alert("제목을 입력해주세요.");
            document.couponInsertInfo.name.value = "";
            document.couponInsertInfo.name.focus();
                return false;
         }
         if (document.couponInsertInfo.price.value.trim() == "") {
            alert("가격을 입력해주세요.");
            document.couponInsertInfo.price.value = "";
            document.couponInsertInfo.price.focus();
                return false;
         }
         if (document.couponInsertInfo.upload_count.value.trim() == "") {
            alert("수량을 입력해주세요.");
            document.couponInsertInfo.upload_count.value = "";
            document.couponInsertInfo.upload_count.focus();
                return false;
         }
         if (document.couponInsertInfo.first_date.value.trim() == "") {
            alert("판매 시작날짜를 정해주세요.");
            document.couponInsertInfo.first_date.value = "";
            document.couponInsertInfo.first_date.focus();
                return false;
         }
         if (document.couponInsertInfo.last_date.value.trim() == "") {
            alert("판매 종료날짜를 정해주세요.");
            document.couponInsertInfo.last_date.value = "";
            document.couponInsertInfo.last_date.focus();
                return false;
         }
         if (document.couponInsertInfo.first_date.value > document.couponInsertInfo.last_date.value) {
            alert("종료날짜가 시작날짜보다 작을 수 없습니다.");
            document.couponInsertInfo.last_date.value = "";
            document.couponInsertInfo.last_date.focus();
            return false;
         }
         if (document.couponInsertInfo.local_category.value.trim() == "") {
            alert("지역을 정해주세요.");
            document.couponInsertInfo.local_category.value = "";
            document.couponInsertInfo.local_category.focus();
                return false;
         }
         if (document.couponInsertInfo.coupon_category.value.trim() == "") {
            alert("쿠폰 종류를 정해주세요.");
            document.couponInsertInfo.coupon_category.value = "";
            document.couponInsertInfo.coupon_category.focus();
                return false;
         }
         if (document.couponInsertInfo.content.value.trim() == "") {
            alert("내용을 입력해주세요.");
            document.couponInsertInfo.content.value = "";
            document.couponInsertInfo.content.focus();
                return false;
         }
      }
      
      <%-- 이미지 미리보기 --%>
       function preview(file, id) {
           let img = document.querySelector("#" + id);

           let reader = new FileReader();
           
           reader.onload = function(e) {
               img.setAttribute("src", e.target.result.toString());
           }
           reader.readAsDataURL(file.files[0]);
       }
       
	   	<%-- 상품 가격, 쿠폰 수량에 ,(콤마) 넣기 빼기 --%>
		function inputNumberFormat(obj) {
			obj.value = comma(uncomma(obj.value));
		}
		function comma(str) {
		    	str = String(str);
		    	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		function uncomma(str) {
		    	str = String(str);
		    	return str.replace(/[^\d]+/g, '');
		}
		    
		<%-- submit할 때 상품 가격, 쿠폰 수량에 ,(콤마) 빼서 DB저장  --%>
		 $(function() {
		    	$("#btn-submit").click(function() {
				$("#inputPrice").val(uncomma($("#inputPrice").val()));
				$("#inputUploadCount").val(uncomma($("#inputUploadCount").val()));
		   	});
		 });
      
   </script>
   
</head>
<body>
   
   <header>
      <%@include file = "adminHeader.jsp" %>
   </header>
   
   <main>
   <br><br><br>
      <form action="insertCoupon.do" method="post" name="couponInsertInfo" enctype="multipart/form-data" onsubmit="return insertCheck()">
         <div id="main-css">
            <h3 class="center">상품 등록</h3>
            <hr>
            
            <%-- 상품 이름(제목) --%>
            <div class="form-group">
               <label class="col-form-label mt-4" for="inputName">상품 이름(제목)</label>
               <input type="text" class="form-control" name="name" placeholder="NAME" id="inputName">
            </div>
            
            <%-- 상품 가격 --%>
            <div class="form-group">
               <label class="col-form-label mt-4" for="inputPrice">상품 가격</label>
               <div class="form-group">
                  <div class="input-group mb-3">
                     <input type="text" class="form-control" name="price" placeholder="PRICE" id="inputPrice" onkeyup="inputNumberFormat(this)">
                     <span class="input-group-text">원</span>
                  </div>
               </div>
            </div>
            
            <%-- 쿠폰 갯수 --%>
            <div class="form-group">
               <label class="col-form-label mt-4" for="inputUploadCount">쿠폰 수량</label>
               <div class="form-group">
                  <div class="input-group mb-3">
                     <input type="text" class="form-control" name="upload_count" placeholder="UPLOAD COUNT" id="inputUploadCount" onkeyup="inputNumberFormat(this)">
                     <span class="input-group-text">장</span>
                  </div>
               </div>
            </div>
            
            <%-- 판매기간 --%>
            <div class="form-group">
               <label class="col-form-label mt-4">판매기간</label>
               <input type="date" class="form-control" name="first_date" data-placeholder="FIRST DATE">
               <input type="date" class="form-control" name="last_date" data-placeholder="LAST DATE">
            </div>
            
            <%-- 카테고리 --%>
            <div class="form-group">
               <label class="col-form-label mt-4">카테고리</label>
               <select class="form-control" name="local_category">
                  <option value="">지역선택</option>
                  <option value="서울">서울</option>
                  <option value="부산">부산</option>
                  <option value="경기도">경기도</option>
                  <option value="강원도">강원도</option>
                  <option value="충청도">충청도</option>
                  <option value="전라도">전라도</option>
                  <option value="경상도">경상도</option>
                  <option value="제주도">제주도</option>
               </select>
               <select class="form-control" name="coupon_category">
                  <option value="">종류선택</option>
                  <option value="수상레저">수상레저</option>
                  <option value="아웃도어/스포츠">아웃도어/스포츠</option>
                  <option value="티켓/투어">티켓/투어</option>
               </select>
            </div>
            
            <%-- 이미지 업로드 --%>
            <div class="form-group">
               <label class="col-form-label mt-4">상품 메인이미지</label>
               <div class="grid">
                  <label class="label-scope" for="file1">대표 이미지
                     <img class="img-content" src="/img/default-img.png" id="img1"/>
                  </label>
                  <input type="file" name="file1" accept="image/*" id="file1" style="display: none;" onchange="preview(this, 'img1')">
                   
                  <label class="label-scope second" for="file2">서브 이미지
                     <img class="img-content" src="/img/default-img.png" id="img2"/>
                  </label>
                  <input type="file" name="file2" accept="image/*" id="file2" style="display: none;" onchange="preview(this, 'img2')">
                  
                  <label class="label-scope" for="file3">서브 이미지
                     <img class="img-content" src="/img/default-img.png" id="img3"/>
                  </label>
                  <input type="file" name="file3" accept="image/*" id="file3" style="display: none;" onchange="preview(this, 'img3')">
               </div>
            </div>
            
            <%-- 게시글 에디터 --%>
            <div class="form-group">
               <label class="col-form-label mt-4">상세내용</label>
               <%@include file = "textEditor.jsp" %>
            </div>
            <br><br><br>
            
            <div class="center">
               <input type="submit" class="btn btn-primary" value="등록" id="btn-submit">
               <input type="button" class="btn btn-primary" value="취소" onclick="location.href='insertCoupon.do'">
            </div>
         </div>
      </form>
      <br><br><br><br><br><br><br><br><br><br>
      
   </main>
   
   <footer>
   
   </footer>
   
</body>
</html>