<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Form Upload</title>
</head>

<body>
	<form method="post" action="${contextPath}/admin/upload" enctype="multipart/form-data">
		<input type="file" name = "file">
		<button type="submit" class="btn btn-success">Register</button>
	</form>
</body>
</html>