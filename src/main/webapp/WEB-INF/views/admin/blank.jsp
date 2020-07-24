<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="linkResource"
	value="${pageContext.request.contextPath}/resources/admin" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PageAdmin</title>
<jsp:include page="/WEB-INF/views/layouts/admin/head_css.jsp" />
</head>

<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/layouts/admin/sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<jsp:include page="/WEB-INF/views/layouts/admin/topbar.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid"></div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<jsp:include page="/WEB-INF/views/layouts/admin/footer.jsp" />
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
	</div>
	<jsp:include
		page="/WEB-INF/views/layouts/admin/LogoutModel_ScrolltoTopButton_MapJS.jsp" />

</body>
</html>