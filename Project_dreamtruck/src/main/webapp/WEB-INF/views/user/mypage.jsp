<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드림트럭</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
</head>
<script type="text/javascript">
var result = '${msg}';
if (result == 'success') {
   alert("수정이 완료되었습니다..");
   self.location = "login";
}else{
}
</script>
<body>
<%@include file="../include/header.jsp"%>
		<!-- 배너 -->
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
              <h1 class="title">마이페이지</h1>
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
    <form method="post" role="form"  class="form-horizontal" >
    <input type="hidden" id="userId" name="userId" value="${login.userId}">
    </form>
			<section id="services">
			<div class="container">
				<div class="row">
        <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="single-service2" >
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                <a href="modify"><img src="/resources/images/regist/modify.png" alt=""></a>
              </div>
              <h2>정보수정</h2>
            </div>
          </div>
          
          <!-- 관심트럭 목록 -->
          <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
            <div class="single-service2">
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                <a href="/liketruck/list?userId=${login.userId}"><img src="/resources/images/regist/trucklist.png" alt=""></a>
              </div>
              <h2>관심트럭 목록</h2>
            </div>
          </div>
          
          <!-- 내가 쓴 글 -->
          <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
            <div class="single-service2">
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                <a href="#"><img src="/resources/images/regist/myboard.png" alt=""></a>
              </div>
              <h2>내가 쓴글</h2>
            </div>
          </div>
					<c:if test="${login.type == 'truck' }">
					<!-- 스케쥴 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms" style="margin-left: 200px;">
						<div class="single-service2">
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
								<a href="/plan/schedule"><img src="/resources/images/regist/schedule.png" alt=""></a>
							</div>
							<h2>스케쥴</h2>
						</div>
					</div>
					
					<!-- 서류 관리 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
						<div class="single-service2">
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
								<a href="/docu/list"><img src="/resources/images/regist/docu.png" alt=""></a>
							</div>
							<h2>서류 관리</h2>
						</div>
					</div>
          </c:if>
				</div>
			</div>
		</section>
		<%@include file="../include/footer.jsp"%>
</body>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/js/wow.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
</html>
