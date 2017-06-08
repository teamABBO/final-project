<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드림트럭</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet"> 
<link href="/resources/css/lightbox.css" rel="stylesheet"> 
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
</head>

<body>
<script type="text/javascript">
var result = '${msg}';
if (result == 'success') {
   alert("회원정보를 확인 해 주세요.");
   self.location = "login";
}else{
   self.location = "../";
}


</script>
</body>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
		<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
		<script type="text/javascript" src="../resources/js/wow.min.js"></script>
		<script type="text/javascript" src="../resources/js/main.js"></script>  
		
</html>