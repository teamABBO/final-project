<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
		src="/resources/js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/js/wow.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Truck List | Dream Truck</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">

<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
<script>
	$(document).ready(
		function () {
			
			$('#trucksearchBtn').on(
				"click",
				function (event) {
					
					self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
					
				});
			
			$('#searchType').change(function(){
				if ('#truckNmae'.checked) {
					$('#');
				}
				
			});
		
		});
</script>
</head>
<!--/head-->

<body>

		<%@include file="../include/header.jsp"%>


		<section id="page-breadcrumb">
				<div class="vertical-center sun">
						<div class="container">
								<div class="row">
										<div class="action">
												<div class="col-sm-12">
														<h1 class="title">푸드트럭</h1>
														<p>드림트럭과 함께 하는 푸드트럭! 관심트럭 등록하고 스케줄 받아보세요</p>
												</div>
										</div>
								</div>
						</div>
				</div>
		</section>
		<!--/#action-->

		<section id="projects" class="padding-top">
				<div class="container">
						<div class="row">
								<section id="page-searchcrumb">
										<div class="search-center">
												<div class="container">
														<div class="row">
																<div class="col-sm-12">
																		<select id="searchType" name="searchType">

																				<option  value="truckName"
																						<c:out value="${cri.searchType eq 'truckName'?'selected':''}" />>트럭
																						이름</option>
																				<option value="truckFood"
																						<c:out value="${cri.searchType eq 'truckFood'?'selected':''}" />>트럭
																						음식 종류</option>
																		</select> 
																		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
																		<select id="foodName" name="foodName">
																			<option value="korean">한식</option>
																		</select>
																		
																		<button id="trucksearchBtn">검색</button>
																</div>
														</div>
												</div>
										</div>
								</section>

								<div class="col-md-10 col-sm-8">
										<div class="row">
												<c:forEach items="${list}" var="truckUser">

														<div
																class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded mobile">
																<div class="portfolio-wrapper">
																		<div class="portfolio-single">
																				<div class="portfolio-thumb">
																						<img
																								src="../resources/images/portfolio/${truckUser.truckImg }"
																								class="img-responsive" alt="">
																				</div>
																				<div class="portfolio-view">
																						<ul class="nav nav-pills">
																								<h2>
																										<a href="read?userId=${truckUser.userId }"
																												style="color: white">${truckUser.truckName }</a>
																								</h2>

																								<li><a
																										href="read${pageMaker.makeSearch(pageMaker.cri.page)}&userId=${truckUser.userId }"><i
																												class="fa fa-link"></i></a></li>
																								<li><a
																										href="../resources/images/portfolio/${truckUser.truckImg }"
																										data-lightbox="example-set"><i
																												class="fa fa-eye"></i></a></li>
																								<li><a><i class="fa fa-heart"></i>${truckUser.truckLikecnt }
																								</a></li>
																								<h4 style="color: white">${truckUser.truckFood}</h4>
																						</ul>
																				</div>
																		</div>
																		<div class="portfolio-info">
																				<div></div>
																		</div>
																</div>
														</div>

												</c:forEach>



										</div>
										<div class="text-center">
												<ul class="pagination">
														<c:if test="${pageMaker.prev }">
																<li><a
																		href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
														</c:if>

														<c:forEach begin="${pageMaker.startPage}"
																end="${pageMaker.endPage }" var="idx">
																<li
																		<c:out value="${pageMkaer.cri.page == idx?'class=active':'' }" />>
																		<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
																</li>

														</c:forEach>
														<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
																<li><a
																		href="list${pageMaker.makeSearch(pageMaker.endPage+1) }">&raquo;</a></li>
														</c:if>

												</ul>
										</div>


								</div>
								<div class="col-md-2 col-sm-4">
										<div class="sidebar portfolio-sidebar">


												<div class="sidebar-item categories">
														<h3>나의 관심트럭</h3>
														<ul class="nav navbar-stacked">
																<li><a href="#">준서네 군만두<span class="pull-right">(1)</span></a></li>
																<li class="active"><a href="#">제주도 삼겹덮밥<span
																				class="pull-right">(8)</span></a></li>
																<li><a href="#">짱구! 타코야끼<span
																				class="pull-right">(4)</span></a></li>
																<li><a href="#">호이호이 찹쌀떡<span
																				class="pull-right">(9)</span></a></li>

														</ul>
												</div>
										</div>
								</div>
						</div>
				</div>
		</section>
		<!--/#projects-->


		<%@include file="../include/footer.jsp"%>




</body>
</html>