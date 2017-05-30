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

<!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
  href="resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
  href="resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
  href="resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
  href="resources/images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>
  <div style="background: url(resources/images/h2.png) 0 100% repeat-x, url(resources/images/home/slider-bg4.png) 0 100% repeat-x, linear-gradient( to bottom, #fc7972, #ffffff );">
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

  <section id="services" style="margin-top: 70px">
    <div class="container">
      <div class="row">
        <div class="col-sm-4 text-center padding wow fadeIn"
          data-wow-duration="1000ms" data-wow-delay="300ms">
          <div class="single-service">
            <div class="wow scaleIn" data-wow-duration="500ms"
              data-wow-delay="300ms">
              <img src="resources/images/home/icon1.png" alt="">
            </div>
            <h2>Incredibly Responsive</h2>
            <p>Ground round tenderloin flank shank ribeye. Hamkevin
              meatball swine. Cow shankle beef sirloin chicken ground
              round.</p>
          </div>
        </div>
        <div class="col-sm-4 text-center padding wow fadeIn"
          data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="single-service">
            <div class="wow scaleIn" data-wow-duration="500ms"
              data-wow-delay="600ms">
              <img src="resources/images/home/icon2.png" alt="">
            </div>
            <h2>Superior Typography</h2>
            <p>Hamburger ribeye drumstick turkey, strip steak
              sausage ground round shank pastrami beef brisket pancetta
              venison.</p>
          </div>
        </div>
        <div class="col-sm-4 text-center padding wow fadeIn"
          data-wow-duration="1000ms" data-wow-delay="900ms">
          <div class="single-service">
            <div class="wow scaleIn" data-wow-duration="500ms"
              data-wow-delay="900ms">
              <img src="resources/images/home/icon3.png" alt="">
            </div>
            <h2>Swift Page Builder</h2>
            <p>Venison tongue, salami corned beef ball tip meatloaf
              bacon. Fatback pork belly bresaola tenderloin bone pork
              kevin shankle.</p>
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
        <div class="single-features">
          <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms"
            data-wow-delay="300ms">
            <img src="resources/images/home/image1.png"
              class="img-responsive" alt="">
          </div>
          <div class="col-sm-6 wow fadeInRight"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <h2>Experienced and Enthusiastic</h2>
            <P>Pork belly leberkas cow short ribs capicola pork
              loin. Doner fatback frankfurter jerky meatball pastrami
              bacon tail sausage. Turkey fatback ball tip, tri-tip
              tenderloin drumstick salami strip steak.</P>
          </div>
        </div>
        <div class="single-features">
          <div
            class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <h2>Built for the Responsive Web</h2>
            <P>Mollit eiusmod id chuck turducken laboris meatloaf
              pork loin tenderloin swine. Pancetta excepteur fugiat
              strip steak tri-tip. Swine salami eiusmod sint, ex id
              venison non. Fugiat ea jowl cillum meatloaf.</P>
          </div>
          <div class="col-sm-5 wow fadeInRight"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <img src="resources/images/home/image2.png"
              class="img-responsive" alt="">
          </div>
        </div>
        <div class="single-features">
          <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms"
            data-wow-delay="300ms">
            <img src="resources/images/home/image3.png"
              class="img-responsive" alt="">
          </div>
          <div class="col-sm-6 wow fadeInRight"
            data-wow-duration="500ms" data-wow-delay="300ms">
            <h2>Experienced and Enthusiastic</h2>
            <P>Ut officia cupidatat anim excepteur fugiat cillum ea
              occaecat rump pork chop tempor. Ut tenderloin veniam
              commodo. Shankle aliquip short ribs, chicken eiusmod
              exercitation shank landjaeger spare ribs corned beef.</P>
          </div>
        </div>
      </div>
    </div>

  </section>
  <!--/#features-->

  <%@include file="include/footer.jsp"%>
  <!--/#footer-->

  <script type="text/javascript" src="resources/js/jquery.js"></script>
  <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="resources/js/wow.min.js"></script>
  <script type="text/javascript" src="resources/js/main.js"></script>
</body>
</html>
