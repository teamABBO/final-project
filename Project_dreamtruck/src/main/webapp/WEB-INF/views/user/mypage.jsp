<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
</head>
<script >
var modify = '${modify}';

if (modify == 'modify') {
	swal("완료!","회원정보가 수정되었습니다.","success");
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
    
		<section id="services">
		<div class="container">
			<div class="row">
		 <c:if test="${login.type == 'normal'}">
		 	<!-- 회원정보 수정 -->
        	<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms" style="margin-left: 200px;">
            <div class="single-service2" >
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
              <form action="">
      			<input type="hidden" id="type" name="type" value="${login.type}">        
              </form>
                <a href="modify"><img src="/resources/images/regist/modify.png" alt=""></a>
              </div>
              <h2>정보수정</h2>
            </div>
          </div>
          
          <!-- 관심트럭 목록 -->
          <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
            <div class="single-service2">
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                <a href="/liketruck/list"><img src="/resources/images/regist/trucklist.png" alt=""></a>
              </div>
              <h2>관심트럭 목록</h2>
            </div>
          </div>
          
          </c:if>
          
          <c:if test="${login.type == 'event'}">
          
          <!-- 회원정보 수정 -->
        	<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="single-service2" >
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
              <form action="">
      			<input type="hidden" id="type" name="type" value="${login.type}">        
              </form>
                <a href="modify"><img src="/resources/images/regist/modify.png" alt=""></a>
              </div>
              <h2>정보수정</h2>
            </div>
          </div>
          
          <!-- 관심트럭 목록 -->
          <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
            <div class="single-service2">
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                <a href="/liketruck/list"><img src="/resources/images/regist/trucklist.png" alt=""></a>
              </div>
              <h2>관심트럭 목록</h2>
            </div>
          </div>
          
          
          <!-- 내가 쓴 글 -->
          <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
            <div class="single-service2">
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                <a href="myboard"><img src="/resources/images/regist/myboard.png" alt=""></a>
              </div>
              <h2>나의 행사 목록</h2>
            </div>
          </div>
          
          </c:if>
          
			<c:if test="${login.type == 'truck' }">
			<!-- 회원정보 수정 -->
        	<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="single-service2" >
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
              <form action="">
      			<input type="hidden" id="type" name="type" value="${login.type}">        
              </form>
                <a href="modify"><img src="/resources/images/regist/modify.png" alt=""></a>
              </div>
              <h2>정보수정</h2>
            </div>
          </div>
          
          <!-- 관심트럭 목록 -->
          <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
            <div class="single-service2">
              <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                <a href="/liketruck/list"><img src="/resources/images/regist/trucklist.png" alt=""></a>
              </div>
              <h2>관심트럭 목록</h2>
            </div>
          </div>
					
		  <!-- 스케쥴 -->
		  <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
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
		  
		  <!-- 내가 신청한 행사 -->
		  <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
			<div class="single-service2">
			 <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
			 	<a href="/applier/event"><img src="/resources/images/regist/myevent.png" alt=""></a>
			 </div>
			 <h2>내가 신청한 행사</h2>
			</div>
		  </div>
		  
		  <!-- 원클릭 신청 -->
		  <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
			<div class="single-service2">
			 <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
			 	<a href="/docu/apply"><img src="/resources/images/regist/onclick.png" alt=""></a>
			 </div>
			 <h2>원 클릭 신청</h2>
			</div>
		  </div>
		  
          </c:if>
				</div>
			</div>
		</section>
		<%@include file="../include/footer.jsp"%>
</body>
</html>