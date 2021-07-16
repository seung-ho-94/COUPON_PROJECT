<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bestrip Travel!</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<style>
.btn-secondary {
    color: #fff;
    background-color: #6c757d;
    border-color: #6c757d
}
</style>
<%@ include file="header.jsp" %>
</head>
<body>
<div class="d-flex justify-content-center" style="padding-top: 50px;">
    <div id="container">
        <div class="py-3">
                <h2 class="contact-title" align="center">무엇을 도와드릴까요?</h2>
        </div>
        <br><br>
        <div>

            <div class="d-flex align-items-baseline review-category col-12 justify-content-around mt-0 pt-0 pb-3">
                <c:forEach var="category" items="${category}">
                    <label class="" id="list-${category}">
                        <a class="d-block text-center btn btn-dark py-2 px-5 btn-rev cate" id="${category}" href="#" onclick="goFaqList(this)">${category}</a>
                    </label>
                </c:forEach>
            </div>
            <br>
            <div class="accordion accordion-flush" id="accordionFlushExample">

            </div>

        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<br><br><br><br>
</body>
<script>
async function goFaqList(faqType) {
	//.cate의 btn-dark 클래스를 지운다 (버튼을 흰색으로 만든다) */
    $(".cate").removeClass("btn-dark");
	/* btn-dark 클래스를 추가한다(선택한 버튼을 검은색으로 만든다) */
    $(faqType).addClass("btn-dark");
	/*  사용자가 선택한 버튼의 id값을 받아와서 category에 담는다 (id="상품" 이런거) */	
    let category = {
        category : faqType.getAttribute("id")
    };
	console.log(faqType.getAttribute("id"))
	/* URL, 주소창의 현재 파라미터를 다른 값으로 바꾸기 */
    let options = {
        method : 'POST',
        body: new URLSearchParams(category)
    };
	/* 기본 URL에 options붙이기 URL 뒤에 #이 붙는다.*/
    let response = await fetch("/gogoFaq.do", options);
	/* response를 json형태로 받기 */
    let result = await response.json();
    console.log(result);
    let dispHtml = "";
    for (let data of result) {
        dispHtml += '<div class="accordion-item">';
        dispHtml += '<h3 class="accordion-header" id="flushHead'+ data.no +'">';
        dispHtml += '<button class="accordion-button collapsed btn-secondary"  style="background-color: #162b45;" type="button" data-bs-toggle="collapse" data-bs-target="#flushColl'+ data.no +'" aria-expanded="false" aria-controls="flushColl'+ data.no +'">';
        dispHtml += data.question;
        dispHtml += '</button>';
        dispHtml += '</h3>'
        dispHtml += '<div id="flushColl'+ data.no +'" class="accordion-collapse collapse" aria-labelledby="flushHead'+ data.no +'" data-bs-parent="#accordionFlushExample">';
        dispHtml += '<div class="accordion-body">';
        dispHtml += data.answer;
        dispHtml += "</div>";
        dispHtml += "</div>";
        dispHtml += "</div>";

    }
    document.querySelector("#accordionFlushExample").innerHTML = dispHtml;


}

$(function () {

    let startFaqType = document.querySelector("#쿠폰문의");
    $(".cate").removeClass("btn-dark");
    $("#쿠폰문의").addClass("btn-dark");
    goFaqList(startFaqType);
});
</script>
 <%@ include file="footer.jsp" %>
</html>