<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="linkResource" value="${pageContext.request.contextPath}/resources/admin" />
<c:set var="linkImages" value="${pageContext.request.contextPath}/resources/HinhAnh" />
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
				<div class="container-fluid">
				
				<!-- DataTales Example -->
		        <div class="card shadow mb-4">
		            <div class="card-header py-3">
		              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
		            </div>
		            <div class="card-body">
		              <div class="table-responsive">
		                <table class="table table-bordered dataTable" width="100%" cellspacing="0">
		                  <thead>
		                    <tr>
		                      <th>Tên SP</th>
		                      <th>Hình Ảnh</th>
		                      <th>Loại SP</th>
		                      <th>Đơn Giá</th>
		                      <th>NSX</th>
		                      <th>Options</th>
		                    </tr>
		                  </thead>
		                  <tfoot>
		                    <tr>
		                      <th>Tên SP</th>
		                      <th>Hình Ảnh</th>
		                      <th>Loại SP</th>
		                      <th>Đơn Giá</th>
		                      <th>NSX</th>
		                      <th>Options</th>
		                    </tr>
		                  </tfoot>
		                  <tbody>
			                  <c:forEach items="${listAdminProduct}" var="sp">
			                  	<tr>
			                      <td>${sp.tenSP}</td>
			                      <td><img src="${linkImages}/${sp.hinhAnh}" style="height:80px; width:80px"></td>
			                      <td>${sp.loaiSanPham.tenLoai}</td>
			                      <td>${sp.donGia}</td>
			                      <td>${sp.nhaSanXuat.tenNSX}</td>
			                      <td>
				                      <div style="padding: 0 10px">
					                      <a href="${contextPath}"><i class="fas fa-info-circle" style="color: blue"></i></a>
					                      <a href="${contextPath}/admin/deleteProduct/${sp.maSP}"><i class="fas fa-trash-alt" style="color: red; padding: 0 10px"></i></a>
					                      <a href="${contextPath}/admin/editProduct?maSP=${sp.maSP}"><i class="far fa-edit" style="color: gray"></i></a>
				                      </div>
			                      	
								  </td>
			                    </tr>
			                  </c:forEach>
		                  </tbody>
		                </table>
		              </div>
		            </div>
		        </div>
				
				</div>
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