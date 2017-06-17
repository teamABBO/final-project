<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
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
              <div class="row">
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
                        <img id='img-upload' class="img-responsive"
                          src="/displayFile?fileName=/user/noimage.png" />
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

                          <a
                            href="read${pageMaker.makeSearch(pageMaker.cri.page)}&userId=${truckUser.userId }"
                            style="color: white" class="infoName">${truckUser.truckName }</a>
                        </h2>

                        <li><a
                          href="read${pageMaker.makeSearch(pageMaker.cri.page)}&userId=${truckUser.userId }"><i
                            class="fa fa-link"></i></a></li>
                        <li><a
                          href="/displayFile?fileName=/user/${truckUser.id}/${truckUser.truckImg}"
                          data-lightbox="example-set" id="img"><i
                            class="fa fa-eye"></i></a></li>
                        <li><a><i class="fa fa-heart" id="like"></i>${truckUser.truckLikecnt }
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

            <c:choose>
              <c:when test="${empty login.userId}">
                <div class="sidebar-item categories">
                  <h3 style="font-weight: bold;">나의 관심트럭</h3>
                  <ul class="nav navbar-stacked">
                    <li>로그인해주세요<span class="pull-right"></span></li>
                  </ul>
                </div>
              </c:when>
              <c:otherwise>
                <div class="sidebar-item categories">
                  <h3 style="font-weight: bold;">나의 관심트럭</h3>
                  <ul class="nav navbar-stacked">
                    <c:forEach items="${likeList}" var="liketruck">
                      <li><a
                        href="/truck/read?userId=${liketruck.truckId }">${liketruck.truckName}</a></li>
                    </c:forEach>
                    <li></li>
                    <li><a href="/liketruck/list">더보기</a></li>
                  </ul>
                </div>
              </c:otherwise>
            </c:choose>






          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/#projects-->


  <%@include file="../include/footer.jsp"%>



</body>
</html>