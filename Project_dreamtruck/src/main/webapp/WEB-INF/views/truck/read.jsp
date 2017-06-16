<%@ page language="java" contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>드림트럭</title>
<style type="text/css">
    
    ul {
        list-style: none;
    }
    .timeline li {
       margin-bottom: 20px;
    }
    
    #user i, #time i{
      
       margin-left: 10px;
      margin-right: 5px;
    }
    .timeline-header{
    font-weight: 500;
     color: #ff6262;
    }
    .timeline-body {
    font-style: bold;
    margin-left: 10px;
    font-size: 20px;
    
    
    }
    .timeline-footer{
    margin-right: 5px;
    margin-bottom: 5px;
    }
    
</style>

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
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/alertify.core.css" />
<link rel="stylesheet" href="/resources/css/alertify.default.css"
		id="toggleCSS" />
<script src="/resources/js/alertify.min.js"></script>

<body>
		<script>
(function(e){var t,o={className:"autosizejs",append:"",callback:!1,resizeDelay:10},i='<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>',n=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],s=e(i).data("autosize",!0)[0];s.style.lineHeight="99px","99px"===e(s).css("lineHeight")&&n.push("lineHeight"),s.style.lineHeight="",e.fn.autosize=function(i){return this.length?(i=e.extend({},o,i||{}),s.parentNode!==document.body&&e(document.body).append(s),this.each(function(){function o(){var t,o;"getComputedStyle"in window?(t=window.getComputedStyle(u,null),o=u.getBoundingClientRect().width,e.each(["paddingLeft","paddingRight","borderLeftWidth","borderRightWidth"],function(e,i){o-=parseInt(t[i],10)}),s.style.width=o+"px"):s.style.width=Math.max(p.width(),0)+"px"}function a(){var a={};if(t=u,s.className=i.className,d=parseInt(p.css("maxHeight"),10),e.each(n,function(e,t){a[t]=p.css(t)}),e(s).css(a),o(),window.chrome){var r=u.style.width;u.style.width="0px",u.offsetWidth,u.style.width=r}}function r(){var e,n;t!==u?a():o(),s.value=u.value+i.append,s.style.overflowY=u.style.overflowY,n=parseInt(u.style.height,10),s.scrollTop=0,s.scrollTop=9e4,e=s.scrollTop,d&&e>d?(u.style.overflowY="scroll",e=d):(u.style.overflowY="hidden",c>e&&(e=c)),e+=w,n!==e&&(u.style.height=e+"px",f&&i.callback.call(u,u))}function l(){clearTimeout(h),h=setTimeout(function(){var e=p.width();e!==g&&(g=e,r())},parseInt(i.resizeDelay,10))}var d,c,h,u=this,p=e(u),w=0,f=e.isFunction(i.callback),z={height:u.style.height,overflow:u.style.overflow,overflowY:u.style.overflowY,wordWrap:u.style.wordWrap,resize:u.style.resize},g=p.width();p.data("autosize")||(p.data("autosize",!0),("border-box"===p.css("box-sizing")||"border-box"===p.css("-moz-box-sizing")||"border-box"===p.css("-webkit-box-sizing"))&&(w=p.outerHeight()-p.height()),c=Math.max(parseInt(p.css("minHeight"),10)-w||0,p.height()),p.css({overflow:"hidden",overflowY:"hidden",wordWrap:"break-word",resize:"none"===p.css("resize")||"vertical"===p.css("resize")?"none":"horizontal"}),"onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize",r):p.on("propertychange.autosize",function(){"value"===event.propertyName&&r()}):p.on("input.autosize",r),i.resizeDelay!==!1&&e(window).on("resize.autosize",l),p.on("autosize.resize",r),p.on("autosize.resizeIncludeStyle",function(){t=null,r()}),p.on("autosize.destroy",function(){t=null,clearTimeout(h),e(window).off("resize",l),p.off("autosize").off(".autosize").css(z).removeData("autosize")}),r())})):this}})(window.jQuery||window.$);

var __slice=[].slice;(function(e,t){var n;n=function(){function t(t,n){var r,i,s,o=this;this.options=e.extend({},this.defaults,n);this.$el=t;s=this.defaults;for(r in s){i=s[r];if(this.$el.data(r)!=null){this.options[r]=this.$el.data(r)}}this.createStars();this.syncRating();this.$el.on("mouseover.starrr","span",function(e){return o.syncRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("mouseout.starrr",function(){return o.syncRating()});this.$el.on("click.starrr","span",function(e){return o.setRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("starrr:change",this.options.change)}t.prototype.defaults={rating:void 0,numStars:5,change:function(e,t){}};t.prototype.createStars=function(){var e,t,n;n=[];for(e=1,t=this.options.numStars;1<=t?e<=t:e>=t;1<=t?e++:e--){n.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"))}return n};t.prototype.setRating=function(e){if(this.options.rating===e){e=void 0}this.options.rating=e;this.syncRating();return this.$el.trigger("starrr:change",e)};t.prototype.syncRating=function(e){var t,n,r,i;e||(e=this.options.rating);if(e){for(t=n=0,i=e-1;0<=i?n<=i:n>=i;t=0<=i?++n:--n){this.$el.find("span").eq(t).removeClass("glyphicon-star-empty").addClass("glyphicon-star")}}if(e&&e<5){for(t=r=e;e<=4?r<=4:r>=4;t=e<=4?++r:--r){this.$el.find("span").eq(t).removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}if(!e){return this.$el.find("span").removeClass("glyphicon-star").addClass("glyphicon-star-empty")}};return t}();return e.fn.extend({starrr:function(){var t,r;r=arguments[0],t=2<=arguments.length?__slice.call(arguments,1):[];return this.each(function(){var i;i=e(this).data("star-rating");if(!i){e(this).data("star-rating",i=new n(e(this),r))}if(typeof r==="string"){return i[r].apply(i,t)}})}})})(window.jQuery,window);$(function(){return $(".starrr").starrr()})

$(function(){


  var ratingsField = $('#ratings-hidden');

  $('.starrr').on('starrr:change', function(e, value){
    ratingsField = ratingsField.val(value);
    console.log(ratingsField);
  });
});

</script>

		<%@include file="../include/header.jsp"%>
		<script>
			$(document).ready(function(){
				var formObj = $("form[role='form']");
				
				$('#listBtn').on("click", function(){

					formObj.attr("method", "get");
					formObj.attr("action", "list");
					formObj.submit();
				});
				
				$("#reviewDiv").on("click", function(){
					if ($(".timeline li").size() > 1) {
						return;
					}
				
					getPage("/review/"+targetId+"/1");
					console.log("reviewDiv실행");
				});
				
				$(".pagination").on("click","a", function(){
					event.preventDefault();
					reviewPage = $(this).attr("data-src");
					targetId=${truckUser.userId};
					getPage("/review/"+targetId+"/"+reviewPage);
				});
				
				$("#reviewAddBtn").on("click", function(){
					if ("${login.userId}"=="") {
						var writerId = "";
					 	alertify.alert("로그인 후 사용 가능합니다");
					}else if("${login.userId}"!=""){
						var writerId ="${login.userId}";
						var reviewtextObj = $("#newReviewText");
						var reviewText = reviewtextObj.val();
						var starObj = $("#ratings-hidden");
						var star = starObj.val();
						$.ajax({
							type: 'post',
							url: '/review/register',
							data: {
								writerId :writerId ,
								star : star,
								content : reviewText,
								targetId: targetId
								},
							success: function(result){
								console.log("result: "+result);
									if (result == 'SUCCESS') {
										alertify.alert("등록되었습니다!");
										reviewPage=1;
										getPage("/review/"+targetId+"/"+reviewPage);
										reviewtextObj.val("");
										}
								}
						});
					}
					
				});
				$(".timeline").on("click", ".reviewLi", function(event){
					console.log("수정창 뜬다!!");
					var review = $(this);
					var star = $("#ratings-hidden").val();
					$("#reviewtext").val(review.find('.timeline-body').text());
					$(".modal-title").html(review.attr("data-reviewId"));
					
				});
				
				$("#reviewModBtn").on("click", function(){
					console.log("수정버튼 눌림!!");
					var reviewId = $(".modal-title").html();
					var reviewtext = $("#reviewtext").val();
					var time = $("#time").val();
					var star = $("#ratings-hidden").val();

					$.ajax({
					type: 'post',
						url: '/review/'+reviewId,
						data: { star : star, content: reviewtext, regdate:time },
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
<script>
$(document).ready(function(){
	
	if ("${login.userId}" == "") {
		
		$('#like').hide();
		$('#unlike').show();
		
		$('#liketruck').click(function(){
			alertify.alert("로그인 후 사용 가능합니다");
		});
		
	} else if("${login.userId}" != ""){
		
		var userId = "${login.userId}";
		var truckId = "${truckUser.userId}";
		var truckLikecnt = "${truckUser.truckLikecnt}";
		
		
		if ("${isLike}"=="true") {
			$('#like').show();
			$('#unlike').hide();
			
		} else {
			$('#like').hide();
			$('#unlike').show();
		}
		
		$("#like").on("click", function(){
			
			$.ajax({
				type: 'post',
				url: '/liketruck/delete',
				data: {
					userId :truckId
					},
				success: function(result){
					console.log("result: "+result);
						if (result == 'SUCCESS') {
							$('#like').hide();
							$('#unlike').show();
							alertify.alert("관심트럭 목록에서 삭제되었습니다!");
							reviewPage=1;
							getPage("/truck/read?userId="+targetId);
							}
					}
				
			});  
		});
		
		$("#unlike").on("click", function(){
			
			$.ajax({
				type: 'post',
				url: '/liketruck/register',
				data: {
					userId :truckId
					},
				success: function(result){
					console.log("result: "+result);
						if (result == 'SUCCESS') {
							$('#like').show();
							$('#unlike').hide();
							alertify.alert("관심트럭으로 등록되었습니다!");
							reviewPage=1;
							getPage("/truck/read?userId="+targetId);
							}
					}
				
			});  
		});
		
	} 
});


</script>
		<script id="template" type="text/x-handlebars-template">
		{{#each .}}
			<li class="reviewLi" data-reviewId={{reviewId}}>
			<h4 class="timeline-header" ><span id="user"><i class="fa fa-user" style="color: #ff6262" id="user"></i>{{writerName}}</span></h4>
				<div class="timeline-item">
					<div class="timeline-body1 text-right" id="star" style="color: #ff6565; font-size: 20px">{{showstar star}}</div>
					<div class="timeline-body" >{{content}}</div>
					<span class="time text-right" id="time" style="color: #fd9483">
						<i class="fa fa-clock-o" id="time"></i>{{prettifyDate regdate}}
					</span>
					<div class="timeline-footer text-right" id="modifyDiv">
						<input type="{{checkUser writerId}}" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal" id="writerId" value="수정">
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
																						<span><li id="liketruck"><a href="#"><i class="fa fa-heart" id="like"></i>
																										<i class="fa fa-heart-o" id="unlike"></i></a><a>${truckUser.truckLikecnt }
																										Love</a></li></span>

																				</ul>
																				<button id="listBtn" class="btn btn-primary"
																						style="float: right;">목록</button>
																		</div>
																		<div class="col-md-12">
																				<div class="box box-success">
																						<div class="box-header">
																								<h2 class="bold box-title">Comments</h2>
																						</div>
																						<c:choose>
																								<c:when test="${empty login.userId}">
																										<div class="box-body">
																												<input id="ratings-hidden" name="rating"
																														type="hidden" disabled="disabled">

																												<textarea class="form-control" cols="50"
																														id="newReviewText" name="comment"
																														placeholder="로그인 후 사용 가능합니다" rows="5"
																														disabled="disabled"></textarea>
																												<div class="box-footer text-right">
																														<div class="stars starrr" data-rating="0"
																																id="star" disabled="disabled"></div>

																														<button type="submit"
																																class="btn btn-success btn-sm"
																																id="reviewAddBtn">등록</button>
																												</div>
																										</div>
																								</c:when>
																								<c:otherwise>
																										<div class="box-body">

																												<input id="ratings-hidden" name="rating"
																														type="hidden" >

																												<textarea class="form-control" cols="50"
																														id="newReviewText" name="comment"
																														placeholder="Enter your review here..."
																														rows="5"></textarea>
																												<div class="box-footer text-right">
																														<div class="stars starrr" data-rating="0"
																																id="star"></div>

																														<button type="submit"
																																class="btn btn-success btn-sm"
																																id="reviewAddBtn">등록</button>
																												</div>
																										</div>
																								</c:otherwise>
																						</c:choose>
																				</div>
																		</div>
																</div>



																<div class="col-md-12">
																		<!-- TimeLine -->
																		<div>
																				<ul class="timeline">
																						<li class="time-label" id="reviewDiv" style="border: 2px"><span><i
																										class="fa fa-comments" style="color: #fd9483">트럭
																												리뷰</i></span></li>
																				</ul>
																				<div class="text-center">
																				<ul id="pagination"
																						class="pagination pagination-sm no-margin"></ul>
																			</div>
																		</div>
																		

																		<!-- modal -->
																		<div id="modifyModal" class="modal modal-primary fade"
																				role="dialog">
																				<div class="modal-dialog">
																						<!-- Modal Content -->
																						<div class="modal-content">
																								<div class="modal-header">
																										<button type="button" class="close"
																												data-dismiss="modal">&times;</button>
																										<h4 class="modal-title"></h4>
																								</div>
																								<div class="modal-body" data-reviewId>
																										<p>
																										<div class="stars starrr" data-rating="0"
																												id="star">
																												<input id="ratings-hidden" name="rating"
																														type="hidden">
																										</div>
																										<input type="text" id="reviewtext"
																												class="form-control">
																										</p>
																								</div>
																								<div class="modal-footer">
																										<button type="button" class="btn btn-info"
																												id="reviewModBtn">수정</button>
																										<button type="button" class="btn btn-danger"
																												id="reviewDelBtn">삭제</button>
																										<button type="button" class="btn btn-default"
																												data-dismiss="modal">닫기</button>
																								</div>
																						</div>
																				</div>
																		</div>
																		
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
	var hour = dateObj.getHours();
	var min = dateObj.getMinutes();
	
	return year+"/"+month+"/"+date+" "+hour+":"+min;
	
});
 
Handlebars.registerHelper("showstar", function(star){
	if (star==1) {
		return "★☆☆☆☆";
	}else if(star==2){
		return "★★☆☆☆";
	}else if(star==3){
		return "★★★☆☆";
	}else if(star==4){
		return "★★★★☆";
	}else if(star==5){
		return "★★★★★";
	}else{
		return "☆☆☆☆☆";
	}
}); 

Handlebars.registerHelper("checkUser", function(writerId){
	var user = "${login.userId}";
	if (user == writerId) {
		return 'button';
	}else {
		return 'hidden';
	}
	
}); 


var printData = function(reviewArr, target, templateObject){
	
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(reviewArr);
	$(".reviewLi").remove();
	target.after(html);
	console.log("printData실행");
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
		str += "<li><a data-src='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for (var i = pageMaker.startPage, len=pageMaker.endPage; i <=len; i++) {
		var strClass = pageMaker.cri.page == i?'class=active':'';
		str += "<li "+strClass+"><a data-src='"+i+"'>"+i+"</a></li>";
	}
	if (pageMaker.next) {
		str += "<li><a data-src='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	}
	target.html(str);
	
	console.log("getPage실행");
	console.log("총합:"+i+"Page실행");
};


</script>


		<%@include file="../include/footer.jsp"%>

</body>
</html>


