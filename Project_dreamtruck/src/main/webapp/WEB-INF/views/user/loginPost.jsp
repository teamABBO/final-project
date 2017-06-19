<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
</head>

<body>
<script type="text/javascript">
var result = '${msg}';
if (result == 'success') {
	swal("실패!","회원 정보를 확인 해 주세요.", "error");
    self.location = "login";
}else{
   self.location = "../";
}


</script>
</body>

</html>