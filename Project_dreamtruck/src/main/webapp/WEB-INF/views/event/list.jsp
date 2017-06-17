<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
</head>
<style type="text/css">
th {
    text-align: center;
}
</style>
<script >

var result = '${msg}';
if (result == 'success') {
	swal("처리완료");
}

$(document).ready(
		function() {
			$('#searchB').on(
					"click", function (event) {
						self.location = "list"
						
						+ '${pageMaker.makeQuery(1)}'
						+"&searchType="
						+$("select option:selected").val()
						+"&keyword="+encodeURIComponent($('#keywordInput').val());
					});
			$('#newB').on("click", function(evt) {
				self.location = "upload";
			});
		});
	

</script>
<body>
  <%@include file="../include/header.jsp"%> <!--/#header-->
  
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
                    <p>행사목록</p>
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


<div class="container">
    <div class="row">
      <div class="single-features">
      <div class="col-md-12">
      
       <c:choose>
            <c:when test="${login.type=='event'}">
              <input type="button" class="btn btn-common" id="newB" value="등록" style="float: right; margin-bottom: 20px">
            </c:when>
       </c:choose>
    
        <table class="table table-hover" style="text-align: center" >
          <tr >
            <th style="width: 10px">No.</th>
            <th>행사제목</th>
            <th>작성자</th>
            <th style="width: 180px">모집트럭수</th>
            <th style="width: 180px">신청트럭수</th>
            <th style="width: 60px">조회수</th>
          </tr>
          
          <c:forEach items="${list }" var="event" varStatus="status">
            <tr>
              <td>${event.eventId}</td>
              <td><a href='/event/detail${pageMaker.makeSearch(pageMaker.cri.page)}&eventId=${event.eventId }'>${event.title }</a></td>
              <td >${event.writer}</td>
              <td>${event.recruit}</td>
              <td>${event.applierCnt }</td>
              <td>${event.hit }</td>
            </tr>

          </c:forEach>
        </table>
        <form class="form-inline" >
        <div class="text-center">
        <div class="form-group"  >
          <select class="form-control " name="searchType">
            <option value="t"
              <c:out value="${cri.searchType eq 't'?'selected':'' }"/>>
              제목</option>

            <option value="c"
              <c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>
              내용</option>

            <option value="w"
              <c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>
              작성자</option>
              
             <option value="n" hidden="true"
              <c:out value="${cri.searchType == null?'':'' }"/>>
               </option>
          </select> 
          <input type="text" class="form-control " name="keyword" id="keywordInput" value="${cri.keyword }" />
          <input type="submit" class="btn btn-common" id="searchB"value="검색">
          
        </div>
        </div>
        </form>

<div class="text-center">
  <ul class="pagination">
    <c:if test="${pageMaker.prev }">
      <li><a href="list${pageMaker.makeSearch(pageMakekr.startPage-1 )}">&laquo;</a></li>
    </c:if>
    
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
      <li 
        <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
        <a href="list${pageMaker.makeSearch(idx) }">${idx}</a>
        </li>
    </c:forEach>
    
    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
      <li><a href = "list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
    </c:if>
  </ul>
</div>
        
      </div>
    </div>
  </div>
  </div>



<%@include file="../include/footer.jsp"%> <!--/#footer-->
</body>
</html>