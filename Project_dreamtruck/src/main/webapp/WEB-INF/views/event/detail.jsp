<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript" src="/resources/js/jquery.js"></script>

<link rel="shortcut icon" href="../resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
  href="../resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
  href="../resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
  href="../resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
  href="../resources/images/ico/apple-touch-icon-57-precomposed.png">
</head>
<script>

	// 수정 리스트로돌아가기
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);

		$("#modify").on("click", function() {
			formObj.attr("action", "/event/modify?");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#list").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/event/list");
			formObj.submit();
		});
		
		$("#one").on("click", function() {
  			$.ajax({
                  url: "apply",
                  type: "POST",
                  data : {
      				eventId : "${event.eventId}"
      			},
                dataType: "text",
                success: function(result) {
                	if (result == "success") {
  					alert("${event.title}에 성공적으로 영업신청하였습니다.");
    				}
                },
    			error: function(result) {
    				if (result == "fail") {
    					if(alert("필요 서류가 부족합니다! 서류를 등록/수정해주세요. 확인을 누르시면 서류관리 페이지로 이동합니다.") == true) {
    						self.location = "/docu/list";
    					} else {
    						return;
    					}
					} else if (result == "dup") {
						alert("이미 신청한 행사입니다.");
					} else {
						return;
					}
				}
            });
		});
		var login = "${login.userId}";
			if(login == ${event.userId}){
				$('#modify').attr("type","button");
			}else{
				$('#modify').attr("type","hidden");
			}
		

	});
</script>
<body>
  <%@include file="../include/header.jsp"%>
  <!--/#header-->


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
                    <h1 class="title">행사</h1>
                    <p>행사 보기</p>
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

  <!-- 행사등록 -->
<form method="post" role="form"  class="form-horizontal" action="modify" >
<input type="hidden" name="eventId" value="${event.eventId }">
<input type="hidden" name="page" value="${cri.page }">
<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
<input type="hidden" name="searchType" value="${cri.searchType}">
<input type="hidden" name="keyword" value="${cri.searchType}">
</form>


  <section id="portfolio-information" class="padding-top">
  
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <c:if test="${!empty event.img }">
            <img src="/displayFile?fileName=/event${event.img}" alt=""
              class="img-rounded"/>
          </c:if>
          <c:if test="${empty event.img }">
            <img src="/displayFile?fileName=/event/noimage.png" alt=""
              class="img-rounded" />
          </c:if>
        </div>
        <div class="col-sm-6">
          <div class="skills overflow">
          <table class="table " >
          <tr>
            <td><h3><strong><i class="glyphicon glyphicon-triangle-right" ></i>행사기간 :</strong> ${event.startDate }부터 ${event.duration }일</h3></td>
          </tr>
          <tr>
            <td><h3><strong><i class="glyphicon glyphicon-triangle-right"></i>모집트럭 수 :</strong> ${event.recruit }</h3></td>
            </tr>
          <tr>
            <td><h3><strong><i class="glyphicon glyphicon-triangle-right"></i>신청한 트럭 수 :</strong> ${event.applierCnt }</h3></td>
            </tr>
          <tr>
            <td><h3><strong><i class="glyphicon glyphicon-triangle-right"></i>영업장소 :</strong> 
                서울시
                <c:choose>
                  <c:when test="${event.guId  eq '1'}">
                     강남구
                    </c:when>
                  <c:when test="${event.guId  eq '2'}">
                    강동구
                    </c:when>
                  <c:when test="${event.guId  eq '3'}">
                    강북구
                    </c:when>
                  <c:when test="${event.guId  eq '4'}">
                    강서구
                    </c:when>
                  <c:when test="${event.guId  eq '5'}">
                    관악구
                    </c:when>
                  <c:when test="${event.guId  eq '6'}">
                    광진구
                    </c:when>
                  <c:when test="${event.guId  eq '7'}">
                    구로구
                    </c:when>
                  <c:when test="${event.guId  eq '8'}">
                      금천구
                    </c:when>
                  <c:when test="${event.guId  eq '9'}">
                    노원구
                    </c:when>
                  <c:when test="${event.guId  eq '10'}">
                    도봉구
                    </c:when>
                  <c:when test="${event.guId  eq '11'}">
                    동대문구
                    </c:when>
                  <c:when test="${event.guId  eq '12'}">
                    동작구
                    </c:when>
                  <c:when test="${event.guId  eq '13'}">
                      마포구
                    </c:when>
                  <c:when test="${event.guId  eq '14'}">
                    서대문구
                    </c:when>
                  <c:when test="${event.guId  eq '15'}">
                    서초구
                    </c:when>
                  <c:when test="${event.guId  eq '16'}">
                    성동구
                    </c:when>
                  <c:when test="${event.guId  eq '17'}">
                    성북구
                    </c:when>
                  <c:when test="${event.guId  eq '18'}">
                    송파구
                    </c:when>
                  <c:when test="${event.guId  eq '19'}">
                    양천구
                    </c:when>
                  <c:when test="${event.guId  eq '20'}">
                    영등포구
                    </c:when>
                  <c:when test="${event.guId  eq '21'}">
                    용산구
                    </c:when>
                  <c:when test="${event.guId  eq '22'}">
                    은평구
                    </c:when>
                  <c:when test="${event.guId  eq '23'}">
                    종로구
                    </c:when>
                  <c:when test="${event.guId  eq '24'}">
                    중구
                    </c:when>
                  <c:when test="${event.guId  eq '25'}">
                    중랑구
                    </c:when>
                </c:choose>
                </h3></td>
                </tr>
                </table>
          </div>
           <c:choose>
            <c:when test="${login.type=='truck'}">
            <button type="button" id="one" name="one"
            class="btn btn-common">원클릭 신청</button>
            </c:when>
       </c:choose>
          
        </div>
    </div>
    <div>
     <hr style="background-color: #fd8c86;"/>
            <div class="col-md-12 ">
              <textarea class="form-control col-md-12" name="content"  rows="20" readonly="readonly" style="background-color: #ffffff; border: none; font-size: large;"> ${event.content }</textarea>
            </div>
             <!-- 버튼 -->
            <div class="form-group" >
               <label class="col-md-12 control-label" for="save"></label>
          <div class="col-md-12">
            <hr style="background-color: #fd8c86;"/>
          <button type="submit" id="list" name="list" class="btn btn-common pull-right" >목록</button>
            <input type="hidden" id="modify" name="modify" class="btn btn-common pull-right" value="수정"  style="margin-right: 5px">
            
          </div>
        </div>
      </div>
    </div>
  </section>

  <br>
  <br>
  <br>
  <br>












  <%@include file="../include/footer.jsp"%>
  <!--/#footer-->

  <script type="text/javascript" src="../resources/js/jquery.js"></script>
  <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="../resources/js/wow.min.js"></script>
  <script type="text/javascript" src="../resources/js/main.js"></script>
</body>
</html>