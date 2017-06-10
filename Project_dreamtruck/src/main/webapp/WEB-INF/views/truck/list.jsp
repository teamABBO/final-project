<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript"
  src="/resources/js/jquery.scrollfollow.js"></script>

<link rel="shortcut icon" href="/resources/images/ico/5.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
  href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
  href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
  href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
  href="/resources/images/ico/apple-touch-icon-57-precomposed.png">

<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">

<script>
	$(document)
			.ready(
					function() {

						if ($('#searchType option:selected').val() == "truckFood") {
							var food = "${param.keyword}";
							$('#foodName').show();
							$('#' + food).attr('selected', 'selected');
							$('#keywordInput').hide();
							$('#trucksearchBtn').hide();
						} else {
							$('#foodName').hide();
							$('#keywordInput').show();
							$('#trucksearchBtn').show();
						}

						$('#trucksearchBtn').on(
								"click",
								function(event) {

									self.location = "list"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($(
													'#keywordInput').val());

								});

						$('#searchType')
								.change(
										function() {
											if ($('#searchType option:selected')
													.val() == 'truckName') {
												$('#foodName').hide();
												$('#keywordInput').show();
												$('#keywordInput').attr(
														"value", "");
												$('#trucksearchBtn').show();

											} else {
												$('#foodName').show();
												$('#keywordInput').hide();
												$('#trucksearchBtn').hide();
											}
										});

						$('#foodName')
								.change(
										function(event) {

											self.location = "list"
													+ '${pageMaker.makeQuery(1)}'
													+ "&searchType="
													+ $(
															"select option:selected")
															.val()
													+ "&keyword="
													+ encodeURIComponent($(
															'#foodName option:selected')
															.val());

										});

						$('.infoName').each(
								function() {
									console.log($(this).text().length);
									if (($(this).text().length) > 6) {
										var minText = $(this).text().substring(
												0, 5)
												+ "..";
										$(this).text(minText);
									}
								});

						$("#favourite").scrollFollow({
							speed : 800,
							offset : 200
						});

					});
</script>

</head>
<!--/head-->

<body>

  <%@include file="../include/header.jsp"%>


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
                    <p>푸드트럭 목록</p>
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

  <section id="projects" class="padding-top">
    <div class="container">
      <div class="row">
        <section id="page-searchcrumb">
          <div class="search-center">
            <div class="container">
              <div class="row"">
                <div class="col-sm-12 form-group">
                  <select id="searchType" name="searchType"
                    class="form-control1">

                    <option value="truckName" selected="selected"
                      <c:out value="${cri.searchType eq 'truckName'?'selected':''}" />>트럭
                      이름</option>
                    <option value="truckFood"
                      <c:out value="${cri.searchType eq 'truckFood'?'selected':''}" />>트럭
                      음식 종류</option>
                  </select> <input type="text" name="keyword" id="keywordInput"
                    value="${cri.keyword }" class="form-control1">
                  <select id="foodName" name="foodName"
                    class="form-control1">
                    <option value="" id="">전체</option>
                    <option value="한식" id="한식">한식</option>
                    <option value="일식" id="일식">일식</option>
                    <option value="중식" id="중식">중식</option>
                    <option value="아프리카" id="아프리카">아프리카</option>
                    <option value="동남아" id="동남아">동남아</option>
                    <option value="남미" id="남미">남미</option>
                    <option value="북미" id="북미">북미</option>
                    <option value="이탈리아" id="이탈리아">이탈리아</option>
                    <option value="스페인" id="스페인">스페인</option>
                    <option value="오세아니아" id="오세아니아">오세아니아</option>
                    <option value="유럽식" id="유럽식">유럽식</option>
                    <option value="디저트" id="디저트">디저트</option>
                    <option value="음료" id="음료">음료</option>
                    <option value="주류" id="주류">주류</option>
                    <option value="퓨전" id="퓨전">퓨전</option>
                  </select>
                  <button id="trucksearchBtn"
                    class="btn btn-common btn-sm">검색</button>
                </div>
              </div>
            </div>
          </div>
        </section>
        <div class="col-md-10 col-sm-8">
          <div class="row" id="listAll">
            <c:forEach items="${list}" var="truckUser">

              <div
                class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded mobile">
                <div class="portfolio-wrapper">
                  <div class="portfolio-single">
                    <div class="portfolio-thumb">
					  <c:if test="${empty truckUser.truckImg}">
					  <img id='img-upload' class="img-responsive" src="/displayFile?fileName=/user/noimage.png" />
					  </c:if>
					  <c:if test="${not empty truckUser.truckImg}">
					  <img
                        src="/displayFile?fileName=/user/${truckUser.id}/${truckUser.truckImg }"
                        class="img-responsive" alt="">
					  </c:if>
                      
                    </div>
                    <div class="portfolio-view">
                      <ul class="nav nav-pills">
                        <h2>

                          <a href="read?userId=${truckUser.userId }"
                            style="color: white" class="infoName">${truckUser.truckName }</a>
                        </h2>

                        <li><a
                          href="read${pageMaker.makeSearch(pageMaker.cri.page)}&userId=${truckUser.userId }"><i
                            class="fa fa-link"></i></a></li>
                        <li><a
                          href="/displayFile?fileName=/user/${truckUser.id}/${truckUser.truckImg }" 
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
                  <c:out value="${pageMaker.cri.page == idx?'class=active':'' }" />>
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


        <div class="col-md-2 col-sm-4" id="favourite">
          <div class="sidebar portfolio-sidebar">


            <div class="sidebar-item categories">
              <h3 style="font-weight: bold;">나의 관심트럭</h3>
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