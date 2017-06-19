<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/references.jsp"%>
<script >
//지도생성
$(document).ready(function() {
	var map;
	var marker = [];
	 var latlng = new google.maps.LatLng(37.478873,126.881313);
	 var myOptions = {
	   zoom: 16,
	   center:latlng,
	   mapTypeId: google.maps.MapTypeId.ROADMAP   
	};
	 latlng = new google.maps.LatLng(37.478873,126.881313);
	 marker.push(new google.maps.Marker({
		   position: latlng,
		   map: map
		  } ));
	    
	map = new google.maps.Map(document.getElementById("map"), myOptions);
});

</script>

</head>
<body>
<%@include file="include/header.jsp"%>
<!-- 배너 -->
  <br>
  <br>
  <section id="services" style="margin-top: 0px">
    <div class="container">
      <div class="row">

        <section id="page-breadcrumb">
          <div class="vertical-center sun">
            <div class="container">
              <div class="row">
                <div class="action">
                  <div class="col-sm-12">
                    <h1 class="title">회사소개</h1>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </section>
        <br>
      </div>
    </div>
  </section>
  <!-- 배너 -->

    <section id="about-company" class="padding-top wow fadeInUp" data-wow-duration="400ms" data-wow-delay="400ms">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <img src="resources/images/aboutus/abbo.png" class="margin-bottom" alt="">
                    <h1 class="margin-bottom">ABBO</h1>
                    <p>ABBO는 푸드트럭의 대중화를 위해 드림트럭을 운영하고 있습니다. </p>
                    <p>매년 겨울, 타코야끼 트럭이 어디 있을 지 몰라 항상 현금 3천원을 지니고 다닌 경험에서 시작되어 저희는 고객들의 행복한 푸드트럭 문화를 위해 나아가고 있습니다. </p>
                    <p>지금 이 마음 간직해, 국내 푸드트럭 문화 증진에 앞장서 고객이 간편하게 이용할 수 있는 푸드트럭 시스템을 위해 발전하겠습니다.</p>
                </div>
            </div>
        </div>
    </section>
    <!--/#about-company-->
    
    <section id="company-information" class="padding-top">
        <div class="container">
            <div class="row">
                <div class="about-us">
                    <div class="col-sm-7 wow fadeInLeft" data-wow-duration="1000ms" data-wow-delay="300ms">
                        <div class="row">
                            <div class="col-sm-5">
                                <img src="resources/images/aboutus/kosta.png" class="img-responsive" alt="">
                            </div>
                            <div class="col-sm-7">
                                <h3 class="top-zero">드림트럭 본사</h3>
                                <p>회사명 : Team ABBO</p>
                                <p>주소 : 서울시 금천구 가산디지털1로 151-0 이노플렉스1차 </p>
                                <p>2층 한국소프트웨어기술진흥협회</p>
                                <p>대표이사 : 윤현재 外 5인</p>
                                <p>설립일: 2017년 5월 29일</p>
                                <p>사업장 : 가산디지털단지</p>
                                <p>임직원수 : 6명</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#company-information--> 
    
    
    <section id="map-section">
        <div class="container">
            <div id="map" style="height: 440px"></div>
            <div class="contact-info">
                <h2>연락처</h2>
                <address>
                E-mail: <a href="mailto:someone@example.com">dreamtruck146@gmail.com</a> <br> 
                Phone: +82 (010) 9263 7153 <br> 
                </address>

                <h2>주소</h2>
                <address>
                서울시 금천구 가산디지털1로 151-0  <br> 
                이노플렉스1차 2층 <br> 
                한국소프트웨어기술진흥협회 <br> 
                </address>
            </div>
        </div>
    </section> <!--/#map-section-->
        
    <br>
    <br>
    <br>
    
    
<%@include file="include/footer.jsp"%>
</body>
</html>