<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAP</title>
<%@ include file="header.jsp" %>
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 400px;height: 132px;margin-left: -180px;margin-top:-80px; text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 400px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>
<div id="map" style="width:100%;height:700px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f80edf3ad380bca22b700c818e1f71db"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(37.6539777086657, 126.86796876971258), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//--------------------> 마커표시를 위해 list에서 정보 뽑아오기

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다 
var mapTypeControl = new kakao.maps.MapTypeControl(); 
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 

// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다 
var zoomControl = new kakao.maps.ZoomControl(); 
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

var positions = [
<c:forEach var="list" items="${list }" >
    {
        title:  '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
        '            ${list.name }' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="/img/${list.attach_file1 }" width="73" height="70">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div class="ellipsis">${list.name }</div>' + 
        '                <div><a href="couponDetail.do?coupon_key=${list.coupon_key}" target="_blank" class="link">상세보기</a></div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>',
        latlng: new kakao.maps.LatLng(${list.address})
    },
    
</c:forEach>
];
for(let i=0; i < positions.length; i++){
    var data = positions[i];
    displayMarker(data);
}

// 지도에 마커를 표시하는 함수입니다    
function displayMarker(data) { 
    var marker = new kakao.maps.Marker({
        map: map,
        position: data.latlng
    });
    var overlay = new kakao.maps.CustomOverlay({
        yAnchor: 3,
        position: marker.getPosition()
    });
    
    var content = document.createElement('div');
    content.innerHTML =  data.title;
    content.style.cssText = 'background: white; border: 1px solid black';
    
    var closeBtn = document.createElement('button');
    closeBtn.innerHTML = 'x';
    closeBtn.style.cssText = "position: absolute;top: -90px;right: -200px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png')"; 
    closeBtn.onclick = function () {
        overlay.setMap(null);
    };
    content.appendChild(closeBtn);
    overlay.setContent(content);

    kakao.maps.event.addListener(marker, 'click', function() {
        overlay.setMap(map);
    });
}
</script>
</body>
<%@ include file="footer.jsp" %>
</html>