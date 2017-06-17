<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/references.jsp"%>
</head>
<!--/head-->


<body>
  <div style="background: url(/resources/images/h2.png) 0 100% repeat-x, linear-gradient( to bottom, #fc7972, #ffffff );">
    <%@include file="include/homeHeader.jsp"%>
    <!--/#header--> 
    <section id="home-slider">
	
      <div class="container">
        <div class="main-slider">
          <div class="slide-text">
            <h1>
              푸드트럭 영업<br>어디서 해야하죠?
            </h1>
            <p>
              불법영업과 축제행사에만 전전긍긍하고있나요?<br>푸드트럭 영업이 허용된 장소와<br>내가
              원했던 장소에 대한 상담을 해보세요.
            </p>
            <a href="#" class="btn btn-common">영업허용 구역에 대한 정보 보러가기</a>
          </div>
          <img src="/resources/images/truck.png" class="slider-house"
            alt="">
        </div>
      </div>
      <div class="preloader">
        <i class="fa fa-sun-o fa-spin"></i>
      </div>
    </section>
  </div>

  <div>
    <img src="/resources/images/m1.png"
      style="margin-left: 20px; margin-top: 20px">
  </div>
  <!--/#home-slider-->

  <br><br>
  


<!--   <hr style="color: #fc978f"> -->
  <section id="features">
    <div class="container">
      <div class="row">
      <br>
        <div class="single-features">
          <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms"
            data-wow-delay="300ms">
            <img src="/resources/images/home/image1.png" class="img-responsive" alt="">
          </div>
           <div class="col-sm-6 wow fadeInRight"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <h2>푸드트럭 연동 서비스</h2>
            <P>푸드트럭 영업구역이 한정적이기에 항상 제자리만 반복하며 다니고있나요?
            다양한 손님들을 만나고 싶은 푸드트럭을 위한 연동 서비스! 서울시에서 진행되는 행사에 참여해보세요.
            드림트럭이 행사의 정보를 제공해드립니다. 
             </P>
          </div>
        </div>
        <div class="single-features">
          <div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <h2>푸드트럭 운영신청 원클릭 서비스</h2>
            <P>번거로운 푸드트럭 운영 신청. 매번 바쁜 시간을 쪼개어 신청하느라 힘드셨죠?
            드림트럭에서 원클릭 신청 서비스로 빠르고 쉽게 신청해보세요!
            필수 서류만 업로드 해놓는다면 한 번의 클릭으로 손쉽게 운영신청을 할 수 있습니다.  
         </P>
          </div>
          <div class="col-sm-5 wow fadeInRight"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <img src="/resources/images/home/image2.png" class="img-responsive" alt="">
          </div>
        </div>
        <div class="single-features">
          <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms"
            data-wow-delay="300ms">
            <img src="/resources/images/home/image3.png" class="img-responsive" alt="">
          </div>
          <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
            <h2> 주변 트럭 검색 서비스</h2>
            <P>오늘도 먹고 싶은 푸드트럭 음식! 언제 올까 노심초사 하지마세요. 
            드림트럭 회원인 푸드트럭이라면 드림트럭에서 위치 검색이 가능하답니다. 
            나와 가까운 푸드트럭은 어디 있는지 찾아보세요! </P>
          </div>
        </div>
        <div class="single-features">
          <div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <h2>관심트럭 알림서비스</h2>
            <P>관심 트럭이 영업을 시작하거나 나의 근처에 있다면 휴대폰 알림서비스 어쩌고 저쩌고 !!  
         </P>
          </div>
          <div class="col-sm-5 wow fadeInRight"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <img src="/resources/images/home/image4.png" class="img-responsive" alt="">
          </div>
        </div>
        
        
      </div>
    </div>

  </section>
  <!--/#features-->
 	

  <%@include file="include/footer.jsp"%>
  <!--/#footer-->
 
  
</body>
</html>
