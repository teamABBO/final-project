<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | DreamTruck</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/lightbox.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="resources/images/ico/apple-touch-icon-57-precomposed.png">
  <script type="text/javascript" src="resources/js/jquery.js"></script>
  <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="resources/js/wow.min.js"></script>
  <script type="text/javascript" src="resources/js/main.js"></script>
</head>
<!--/head-->


<body>
  <div style="background: url(resources/images/h2.png) 0 100% repeat-x, linear-gradient( to bottom, #fc7972, #ffffff );">
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
              불법영업과 축제행사만 전전긍긍하고있나요?<br>푸드트럭 영업이 허용된 장소와<br>내가
              원했던 장소에 대한 상담을 해보세요.
            </p>
            <a href="#" class="btn btn-common">영업허용 구역에 대한 정보 보러가기</a>
          </div>
          <img src="resources/images/truck.png" class="slider-house"
            alt="">
        </div>
      </div>
      <div class="preloader">
        <i class="fa fa-sun-o fa-spin"></i>
      </div>
    </section>
  </div>

  <div>
    <img src="resources/images/m1.png"
      style="margin-left: 20px; margin-top: 20px">
  </div>
  <!--/#home-slider-->

  <br><br>
  <section id="services" style="margin-top: 0px">
    <div class="container">
      <div class="row">
        <div class="col-sm-4 text-center padding wow fadeIn"
          data-wow-duration="1000ms" data-wow-delay="300ms">
          <div class="single-service">
            <div class="wow scaleIn" data-wow-duration="500ms"
              data-wow-delay="300ms">
              <img src="resources/images/home/icon1.png" alt="">
            </div>
            <h2>원클릭 서비스</h2>
            <p>기관마다 다른 서류와 방문해야하는 면접제출 시스템 등의 복잡한 푸드트럭 영업신고 절차를 클릭 한번으로 해결할 수 있습니다.</p>
          </div>
        </div>
        <div class="col-sm-4 text-center padding wow fadeIn"
          data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="single-service">
            <div class="wow scaleIn" data-wow-duration="500ms"
              data-wow-delay="600ms">
              <img src="resources/images/home/icon2.png" alt="">
            </div>
            <h2>영업 허용구역 규제</h2>
            <p>푸드트럭 합법 영업 구역이 생겨날 때 마다 드림트럭에서 새로운 정보를 확인해 볼 수 있습니다. </p>
          </div>
        </div>
        <div class="col-sm-4 text-center padding wow fadeIn"
          data-wow-duration="1000ms" data-wow-delay="900ms">
          <div class="single-service">
            <div class="wow scaleIn" data-wow-duration="500ms"
              data-wow-delay="900ms">
              <img src="resources/images/home/icon3.png" alt="">
            </div>
            <h2>위생,청결 관리</h2>
            <p>위생 관리와 청결 유지를 위해 필요한 노하우와 정보들을 제공 받아 나의 트럭을  
            스스로 관리 하는 방법을 알수있습니다.</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/#services-->


  <hr style="color: #fc978f">
  <section id="features">
    <div class="container">
      <div class="row">
      <br>
        <div class="single-features">
          <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms"
            data-wow-delay="300ms">
            <img src="resources/images/home/image1.png" class="img-responsive" alt="">
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
            <img src="resources/images/home/image2.png" class="img-responsive" alt="">
          </div>
        </div>
        <div class="single-features">
          <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms"
            data-wow-delay="300ms">
            <img src="resources/images/home/image3.png" class="img-responsive" alt="">
          </div>
          <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
            <h2> 주변 트럭 검색 서비스</h2>
            <P>오늘도 먹고 싶은 푸드트럭 음식! 언제 올까 노심초사 하지마세요. 
            드림트럭 회원인 푸드트럭이라면 드림트럭에서 위치 검색이 가능하답니다. 
            나와 가까운 푸드트럭은 어디 있는지 찾아보세요! </P>
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
