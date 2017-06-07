<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header id="header">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 overflow">
          	<c:if test="${empty login}">
            <div class="social-icons pull-right">
              <ul class="nav nav-pills">
                <li><a href="/user/login">로그인</a></li>
                <li><a href="/user/registertype">회원가입</a></li>
              </ul>
            </div>
            </c:if>
            
            <c:if test="${not empty login}">
            <div class="social-icons pull-right">
              <ul class="nav nav-pills">
                <li><a href="#">${login.name} 님 환영합니다 </a></li>
                <li><a href="#primary" data-toggle="modal">로그아웃</a></li>
                <li><a href="/user/mypage?type=${login.type}">내 정보</a></li>
              </ul>
            </div>
            </c:if>
          </div>
        </div>
      </div>
      <div class="navbar navbar-inverse" role="banner">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle"
              data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span> <span
                class="icon-bar"></span> <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="index.html"> <img
              src="/resources/images/logo.png" alt="logo">
            </a>

          </div>
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="#">홈</a></li>
              <li><a href="#">회사소개</a></li>
              <li><a href="#">이용안내</a></li>
              <li><a href="/truck/list">트럭소개</a></li>
              <li class="dropdown"><a>행사 <i
                  class="fa fa-angle-down"></i></a>
                <ul role="menu" class="sub-menu">
                  <li><a href="/event/list">목록</a></li>
                  <li><a href="/event/upload">등록</a></li>
                </ul></li>
              <li><a href="#">트럭지도</a></li>
            </ul>
          </div>
          <div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
        </div>
      </div>
    </header>
    
    
    <!-- Modal -->
    <div class="modal fade" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 4px solid #a94442; background-color: #f2dede; color: #a94446;">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
              <h4 class="modal-title" id="myModalLabel" style="font-size: 9pt;"><i class="fa fa-warning"></i> 경고</h4>
          		</div>
          <div style="margin-top: 1px; background-color: #a94442; height: 1px; width: 100%;"></div>
          <div class="modal-body">
              <div class="row">

                  <div class="col-xs-12">
                      <div class="alert alert-danger" role="alert" style="text-align: center;"><i class="fa fa-warning"></i> 로그아웃 하시겠습니까?</div>
                      <div style="text-align: center; font-size: 10pt; margin: 16px;"><span style="color: #2e77bc;"><i class="fa fa-info-circle"></i></span>로그아웃하시면 서비스에 제한이 될 수 있습니다.</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
                    <a class="btn btn-default" href="/user/logout" >확인</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- Modal -->
    </div>
    </div>
    </div>