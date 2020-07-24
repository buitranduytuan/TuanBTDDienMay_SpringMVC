<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!-- Pagination -->
<!-- active -->
	<c:if test="${check==1}">
		<c:set var="link" value="${contextPath}/productByCategory/${sp.loaiSanPham.tenLoai}/" />
	</c:if>
	<c:if test="${check==2}">
		<c:set var="link" value="${contextPath}/product/${sp.loaiSanPham.tenLoai}/${sp.nhaSanXuat.tenNSX}/" />
	</c:if>
	<c:if test="${check==3}">
		<c:set var="link" value="${contextPath}/findProductByName?productName=${productName}&page=" />
	</c:if>
	
	<div>
		<ul class="pagination" style="justify-content: center;">
			<c:if test="${pageCurrent>1}">
				<li class="page-item"><a class="page-link" href="${link}${pageCurrent-1}">Previous</a></li>
			</c:if>
			<c:forEach var="page" begin="1" end="${totalPage}">
				<li class="page-item" id="page${page}"><a class="page-link" href="${link}${page}">${page}</a></li>
			</c:forEach>
			
			<c:if test="${pageCurrent < totalPage}">
				<li class="page-item"><a class="page-link" href="${link}${pageCurrent+1}">Next</a></li>
			</c:if>
		</ul>
	</div>

<script>
	$(document).ready(function() {
/* 		$('.page-item').on('click', function() {
			$(this).addClass("active");
		}); */
		$('#page${pageCurrent}').addClass("active");
		
	});
</script>
</body>