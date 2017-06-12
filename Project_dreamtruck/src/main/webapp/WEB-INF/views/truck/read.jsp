<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


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
<script type="text/javascript" src="/resources/js/jquery.starr.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!--[if lt IE 9]>
       <script src="js/html5shiv.js"></script>
       <script src="js/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	var switchTo5x = true;
</script>
<script type="text/javascript"
		src="http://w.sharethis.com/button/buttons.js"></script>
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
				
				$(function(){


					  var ratingsField = $('#ratings-hidden');

					  $('.starrr').on('starrr:change', function(e, value){
					    ratingsField.val(value);
					  });
					});
				 
				 $("#reviewDiv").on("click", function(){
						
						if ($(".timeline li").size() > 1) {
							return;
						}
						getPage("/review/"+targetId+"/1");
						
					});


					$(".pagination").on("click", "li a", function(event){
						
						event.preventDefault();
						
						replyPage = $(this).attr("href");
						
						getPage("/review/"+targetId+"/"+reviewPage);
					});

					$("#reviewAddBtn").on("click", function(){
						var reviewerObj = $("#newReviewWriter");
						var reviewtextObj = $("#newReviewText");
						var reviewer = reviewerObj.val();
						var reviewText = reviewtextObj.val();
						
						$.ajax({
							type: 'post',
							url: '/review/register',
							data: {
								writerId : '174',
								content : reviewText,
								targetId: targetId
							},
							success: function(result){
								console.log("result: "+result);
								if (result == 'SUCCESS') {
									alert("등록되었습니다.");
									reviewPage=1;
									getPage("/review/"+targetId+"/"+reviewPage);
									reviewerObj.val("");
									reviewtextObj.val("");
								}
							}
						});
						

					});
					
					$(".timeline").on("click", ".reviewLi", function(event){
						console.log("수정창 뜬다!!");
						var review = $(this);
						
						$("#reviewtext").val(review.find('.timeline-body').text());
						$(".modal-title").html(review.attr("data-reviewId"));
						console.log(review.attr("data-reviewId"));
					});
					
					$("#reviewModBtn").on("click", function(){
						console.log("수정버튼 눌림!!");
						var reviewId = $(".modal-title").html();
						var reviewtext = $("#reviewtext").val();
						console.log(reviewtext);

						console.log(reviewId);
						$.ajax({
							type: 'post',
							url: '/review/'+reviewId,
							data: { content: reviewtext },
							dataType: 'text',
							success: function(result){
								console.log("result: "+result);
								if (result=='SUCCESS') {
									alert("수정되었습니다.");
									getPage("/review/"+targetId+"/"+reviewPage);
								}
							}
						});
					}); 
					
					$("#reviewDelBtn").on("click", function(){
						var reviewId = $(".modal-title").html();
						var reviewtext = $("#reviewtext").val();
						
						$.ajax({
							type: 'delete',
							url: '/review/'+reviewId,
							dataType: 'text',
							success:function(result){
								console.log("result: "+result);
								if (result =='SUCCESS') {
									alert("삭제 되었습니다.");
									getPage("/review/"+targetId+"/"+reviewPage);
								}
								
							}
							
						});
						
					});

			});
		</script>
		<script id="template" type="text/x-handlebars-template">
			{{#each .}}
			<li class="reviewLi" data-reviewId={{reviewId}}>{{reviewId}}
			<i class="fa fa-comments"></i>
				<div class="timeline-item">
					<span class="time">
						<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
					</span>
					<h4 class="timeline-header">{{writerId}}</h4>
					<div class="timeline-body">{{content}}</div>
						<div class="timeline-footer">
							<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">수정</a>
						</div>
				</div>
			</li>
			{{/each}}
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
										<input type="hidden" name="userId" value="${truckUser.userId}">
										<input type="hidden" name="page" value="${cri.page }">
										<input type="hidden" name="perPageNum"
												value="${cri.perPageNum }"> <input type="hidden"
												name="searchType" value="${cri.searchType }"> <input
												type="hidden" name="keyword" value="${cri.keyword }">
								</form>

								<div class="col-md-12 col-sm-12">
										<div class="row">
												<div class="col-md-12 col-sm-12">
														<div class="single-blog blog-details two-column">
																<div class="post-thumb">
																		<a href="#"> <c:if
																						test="${empty truckUser.truckImg}">
																						<img id='img-upload' class="img-responsive"
																								src="/displayFile?fileName=/user/noimage.png" />
																				</c:if> <c:if test="${not empty truckUser.truckImg}">
																						<img
																								src="/displayFile?fileName=/user/${truckUser.id}/${truckUser.truckImg }"
																								class="img-responsive" alt="">
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
																						<li><a href="#"><i class="fa fa-heart"></i>${truckUser.truckLikecnt }
																										Love</a></li>
																						<li><a href="#"><i class="fa fa-comments"></i>3
																										Comments</a></li>
																				</ul>
																				<button id="listBtn" class="btn btn-primary"
																						style="float: right;">목록</button>
																		</div>

																		<div class="col-md-12">
																			<div class="box box-success">
																				<div class="box-header">
																					<h2 class="bold box-title">Comments</h2>
																				</div>
																				<div class="box-body">
																					<input id="ratings-hidden" name="rating" type="hidden">
																					<label for="newReviewWriter">${login.name}</label>
																					<textarea class="form-control" cols="50"
																								id="newReviewText" name="comment"
																								placeholder="Enter your review here..." rows="5"></textarea>
																				</div>
																				
																				<div class="box-footer text-right">
																					<div class="stars starrr" data-rating="0"></div>
																					<button type="submit" class="btn btn-success btn-sm" id="reviewAddBtn">등록</button>
																				</div>
																			</div>
																			
																			<!-- TimeLine -->
																			<ul class="timeline">
																				<li class="time-label" id="reviewDiv"><span>댓글 보기</span>																			
																				</li>
																			</ul>
																			<div class="text-center">
																				<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
																			</div>
																			
																			<!-- modal -->
																			<div id="modifyModal" class="modal modal-primary fade" role="dialog">
																				<div class="modal-dialog">
																					<!-- Modal Content -->
																					<div class="modal-content">
																						<div class="modal-header">
																							<button type="button" class="close" data-dismiss="modal">&times;</button>
																							<h4 class="modal-title"></h4>
																						</div>
																						<div class="modal-body" data-reviewId>
																							<p><input type="text" id="reviewtext" class="form-control"> </p>
																						</div>
																						<div class="modal-footer">
																							<button type="button" class="btn btn-info" id="reviewModBtn">수정</button>
																							<button type="button" class="btn btn-danger" id="reviewDelBtn">삭제</button>
																							<button type="button" class="btn btn-default" data-dismiss="modal" >닫기</button>
																						</div>
																					</div>
																				</div>
																			</div>
																			
																		</div>


																	<!-- 	<div class="response-area">
																				<h2 class="bold">Comments</h2>
																				<ul class="media-list">
																						<li class="media">
																								<div class="post-comment">
																										<div class="media-body">
																												<span><i class="fa fa-user"></i> <a
																														href="#">Endure</a></span>
																												<p>Lorem ipsum dolor sit amet,
																														consectetur adipisicing elit, sed do
																														eiusmod tempor incididunt ut labore et
																														dolore magna aliq Ut enim ad minim veniam,
																														quis nostrud exercitation ullamco laboris
																														nisi.</p>
																												<ul class="nav navbar-nav post-nav">
																														<li><a href="#"><i
																																		class="fa fa-clock-o"></i>February
																																		11,2014</a></li>
																												</ul>
																										</div>
																								</div>
																						</li>
																				</ul>
																		</div> -->
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

<script>
var targetId = ${truckUser.userId};
var reviewPage = 1;

Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() +1;
	var date = dateObj.getDate();
	return year+"/"+month+"/"+date;
	
});

var printData = function(reviewArr, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(reviewArr);
	$(".reviewLi").remove();
	target.after(html);
}

function getPage(pageInfo){
	
	$.getJSON(pageInfo, function(data){
		
		printData(data.list, $("#reviewDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));
	});
}
var printPaging = function(pageMaker, target){
	var str = "";
	
	if (pageMaker.prev) {
		str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for (var i = pageMaker.startPage, len=pageMaker.endPage; i <=len; i++) {
		var strClass = pageMaker.cri.page == i?'class=active':'';
		str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	if (pageMaker.next) {
		str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	}
	target.html(str);
};


</script>


		<%@include file="../include/footer.jsp"%>

</body>
</html>


