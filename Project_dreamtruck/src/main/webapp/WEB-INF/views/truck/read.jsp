<%@ page language="java" contentType="text/html; charset=utf-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>드림트럭</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">

<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/js/wow.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	var switchTo5x = true;
</script>
<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">
	stLight.options({
		publisher : "7e8eb33b-fbe0-4915-9b93-09490e3d10df",
		doNotHash : false,
		doNotCopy : false,
		hashAddressBar : false
	});
</script>
<body>

	<%@include file="../include/header.jsp"%>

	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			$('#listBtn').on("click", function() {

				formObj.attr("method", "get");
				formObj.attr("action", "list");
				formObj.submit();

			});

		});
	</script>

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
										<h1 class="title">푸드트럭</h1>
										<p>푸드트럭 보기</p>
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

	<section id="blog-details" class="padding-top">
		<div class="container">
			<div class="row">

				<form role="form" method="post">
					<input type="hidden" name="userId" value="${truckUser.userId}"> <input type="hidden" name="page" value="${cri.page }"> <input type="hidden" name="perPageNum" value="${cri.perPageNum }"> <input type="hidden" name="searchType" value="${cri.searchType }"> <input type="hidden" name="keyword" value="${cri.keyword }">
				</form>

				<div class="col-md-12 col-sm-12">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="single-blog blog-details two-column">
								<div class="post-thumb">
									<a href="#"> 
										<c:if test="${empty truckUser.truckImg}">
											<img id='img-upload' class="img-responsive" src="/displayFile?fileName=/user/noimage.png" />
										</c:if> <c:if test="${not empty truckUser.truckImg}">
											<img src="/displayFile?fileName=/user/${truckUser.id}/${truckUser.truckImg }" class="img-responsive" alt="">
										</c:if>
								</div>
								<div class="post-content overflow">
									<h2 class="post-title bold">
										<a href="#">${truckUser.truckName }</a>
									</h2>
									<h3 class="post-author">
										<a href="#">${truckUser.name }</a>
									</h3>

									<p>${truckUser.truckInfo }</p>
									<div class="post-bottom overflow">
										<ul class="nav navbar-nav post-nav">
											<li><a href="#"><i class="fa fa-heart"></i>${truckUser.truckLikecnt } Love</a></li>
											<li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>
										</ul>
										<button id="listBtn" class="btn btn-primary" style="float: right;">목록</button>
									</div>


									<div class="col-md-12" style="margin-top: 40px;">
										<form accept-charset="UTF-8" action="" method="post">
											<input id="ratings-hidden" name="rating" type="hidden">
											<textarea class="form-control" cols="50" id="comment" name="comment" placeholder="Enter your review here..." rows="5"></textarea>
											<div class="text-right">
												<div class="stars starrr" data-rating="0"></div>
												<a class="btn btn-danger btn-sm" href="#" id="cancel" style="margin-right: 10px;">Cancel</a>
												<button class="btn btn-success btn-md" type="submit">Save</button>
											</div>
										</form>
									</div>




									<div class="response-area">
										<h2 class="bold">Comments</h2>
										<ul class="media-list">
											<li class="media">
												<div class="post-comment">
													<a class="pull-left" href="#"> </a>
													<div class="media-body">
														<span><i class="fa fa-user"></i>Posted by <a href="#">Endure</a></span>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliq Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.</p>
														<ul class="nav navbar-nav post-nav">
															<li><a href="#"><i class="fa fa-clock-o"></i>February 11,2014</a></li>
															<li><a href="#"><i class="fa fa-reply"></i>Reply</a></li>
														</ul>
													</div>
												</div>
												<div class="parrent">
													<ul class="media-list">
														<li class="post-comment reply"><a class="pull-left" href="#"> </a>
															<div class="media-body">
																<span><i class="fa fa-user"></i>Posted by <a href="#">Endure</a></span>
																<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut</p>
																<ul class="nav navbar-nav post-nav">
																	<li><a href="#"><i class="fa fa-clock-o"></i>February 11,2014</a></li>
																</ul>
															</div></li>
													</ul>
												</div>
											</li>
											<li class="media">
												<div class="post-comment">
													<a class="pull-left" href="#"> </a>
													<div class="media-body">
														<span><i class="fa fa-user"></i>Posted by <a href="#">Endure</a></span>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliq Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.</p>
														<ul class="nav navbar-nav post-nav">
															<li><a href="#"><i class="fa fa-clock-o"></i>February 11,2014</a></li>
															<li><a href="#"><i class="fa fa-reply"></i>Reply</a></li>
														</ul>
													</div>
												</div>
											</li>

										</ul>
									</div>
									<!--/Response-area-->
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!--/#blog-->

	<%@include file="../include/footer.jsp"%>

</body>
</html>



