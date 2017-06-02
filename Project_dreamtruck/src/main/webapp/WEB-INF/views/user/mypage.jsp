<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/font-awesome.min.css" rel="stylesheet">
<link href="../resources/css/animate.min.css" rel="stylesheet">
<link href="../resources/css/lightbox.css" rel="stylesheet">
<link href="../resources/css/main.css" rel="stylesheet">
<link href="../resources/css/responsive.css" rel="stylesheet">
</head>
<body>
<%@include file="../include/header.jsp"%>
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
   		
			<section id="services">
			<div class="container">
				<div class="row">
					<!-- 정보수정 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
						<div class="single-service2" >
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
								<img src="../resources/images/regist/normal.png" alt="">
							</div>
							<h2>정보수정</h2>
							<br>
							<form action="modify" method="post">
								<input type="hidden" id="type" name="type" value="normal">
								<button type="submit" class="btn btn-common" >클릭</button>
							</form>
						</div>
					</div>
					
					<!-- 스케쥴 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="single-service2">
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
								<img src="../resources/images/regist/truck.png" alt="">
							</div>
							<h2>스케쥴</h2>
							<br>
							<form action="register" method="post">
								<input type="hidden" id="type" name="type" value="truck">
								<button type="submit" class="btn btn-common" >클릭</button>
							</form>
						</div>
					</div>
					
					<!-- 관심트럭 목록 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
						<div class="single-service2">
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
								<img src="../resources/images/regist/event.png" alt="">
							</div>
							<h2>관심트럭 목록</h2>
							<br>
							<form action="../liketruck/list" method="post">
								<input type="hidden" id="type" name="type" value="event">
								<button type="submit" class="btn btn-common" >클릭</button>
							</form>
						</div>
					</div>
					
					<!-- 서류 관리 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms" style="margin-left: 200px;">
						<div class="single-service2">
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
								<img src="../resources/images/regist/event.png" alt="">
							</div>
							<h2>서류 관리</h2>
							<br>
							<form action="register" method="post">
								<input type="hidden" id="type" name="type" value="event">
								<button type="submit" class="btn btn-common" >클릭</button>
							</form>
						</div>
					</div>
					
					<!-- 내가 쓴 글 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
						<div class="single-service2">
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
								<img src="../resources/images/regist/event.png" alt="">
							</div>
							<h2>내가 쓴글</h2>
							<br>
							<form action="register" method="post">
								<input type="hidden" id="type" name="type" value="event">
								<button type="submit" class="btn btn-common" >클릭</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<%@include file="../include/footer.jsp"%>
</body>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="../resources/js/wow.min.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
</html>
