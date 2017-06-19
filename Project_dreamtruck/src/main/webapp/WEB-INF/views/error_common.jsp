<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/references.jsp"%>
<style type="text/css">
  html{
  }
  body{
      margin: 0;
      padding: 0;
      background: #fcdce0;
      font-family: Arial, Helvetica, sans-serif;
  }
  *{
      margin: 0;
      padding: 0;
  }
  p{
      font-size: 12px;
      color: #373737;
      font-family: Arial, Helvetica, sans-serif;
      line-height: 18px;
  }
  p a{
      color: #218bdc;
      font-size: 12px;
      text-decoration: none;
  }
  a{
      outline: none;
  }
  .f-left{
      float:left;
  }
  .f-right{
      float:right;
  }
  .clear{
      clear: both;
      overflow: hidden;
  }
  #block_error{
      width: 845px;
      height: 384px;
      border: 1px solid #cccccc;
      margin: 72px auto 0;
      -moz-border-radius: 4px;
      -webkit-border-radius: 4px;
      border-radius: 4px;
      background: #fff url(/resources/images/block.gif) no-repeat 0 51px;
  }
  #block_error div{
      padding: 100px 40px 0 186px;
  }
  #block_error div h2{
      color: #218bdc;
      font-size: 24px;
      display: block;
      padding: 0 0 14px 0;
      border-bottom: 1px solid #cccccc;
      margin-bottom: 12px;
      font-weight: normal;
  }
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#viewError").on("click", function() {
		$("#block_error").html("<p class='error'>${exception.getMessage() }" +
		"<br />" +
		"</p>"+
		"<ul class='error'>"+
			"<c:forEach items='${exception.getStackTrace() }' var='stack'>"+
				"<li class='error'>${stack.toString() }</li>"+
			"</c:forEach>"+
		"</ul>");
	});
});
</script>
</head>
<body marginwidth="0" marginheight="0">
	<div id="block_error">
		<div>
			<h2>시스템 오류</h2>
			<p>
				시스템 문제로 요청하신 페이지를 표시할 수 없습니다. <br /> 죄송합니다. 요청하신 페이지를 실행하는 데 문제가
				발생했습니다. 관리자에게 문의하세요.
			</p>
			<p>
				자세한 오류 메세지를 보시려면 <a id="viewError">여기</a> 를 클릭하세요
			</p>
		</div>
	</div>
</html>