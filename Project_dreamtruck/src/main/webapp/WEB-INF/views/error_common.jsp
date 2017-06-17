<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/references.jsp"%>
</head>
<body>
  <h4>${exception.getMessage() }</h4>
  
  <ul>
  <c:forEach items="${exception.getStackTrace() }" var="stack">
    <li>${stack.toString() }</li>
  </c:forEach>
  </ul>
</body>
</html>