<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header id="header" style="background: #ffffff;">
      <div class="container"> 
        <div class="row">
          <div class="col-sm-12 overflow">
          <c:if test="${empty login}">
            <div class="social-icons pull-right">
              <ul class="nav nav-pills">
                <li><a href="/user/login" style="color: #fd9691">로그인</a></li>
                <li><a href="/user/registertype" style="color: #fd9691">회원가입</a></li>
              </ul>
            </div>
            </c:if>
            
            <c:if test="${not empty login}">
            <div class="social-icons pull-right">
              <ul class="nav nav-pills">
                <li><a style="color: #fd9691">${login.id} 님 환영합니다 </a></li>
                <li><a href="#primary" data-toggle="modal" style="color: #fd9691">로그아웃</a></li>
                <li><a href="/user/mypage?type=${login.type }" style="color: #fd9691">내 정보</a></li>
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

            <a class="navbar-brand" href="/"> <img
              src="/resources/images/logo1.png" alt="logo">
            </a>

          </div>
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="/" style="color: #fd9691">홈</a></li>
              <li><a href="#" style="color: #fd9691">회사소개</a></li>
              <li><a href="#" style="color: #fd9691">이용안내</a></li>
              <li><a href="/truck/list" style="color: #fd9691">트럭소개</a></li>
              <li class="dropdown"><a href="#" style="color: #fd9691">행사 <i
                  class="fa fa-angle-down"></i></a>
                <ul role="menu" class="sub-menu">
                  <li><a href="/event/list" style="color: #fd9691">목록</a></li>
                  <li><a href="/event/upload" style="color: #fd9691">등록</a></li>
                </ul></li>
              <li><a href="#" style="color: #fd9691">트럭지도</a></li>
            </ul>
          </div>
          <div class="search">
                    <form role="form">
                        <i class="fa fa-search" style="color: #fd9691"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
        </div>
      </div>
    </header>
