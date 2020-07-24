<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="linkResource" value="${pageContext.request.contextPath}/resources/admin" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
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
					<form:form action="${contextPath}/admin/editProductAction" method="post" modelAttribute="sanPham">
						<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
							<div>
								<div class="row">
									<div class="col-12">
										<h2>Edit Product</h2>
										<c:if test="${check != null}">
											<c:if test="${check}">
												<p style="color: #1fed0a; font-size: 20px">Edit product success!</p>
											</c:if>
											<c:if test="${!check}">
												<p>Edit product fail!</p>
											</c:if>
										</c:if>
									</div>
								</div>
								
								<div class="row">
									<div class="col-xl-7 col-lg-7 col-md-12">
									
										<div class="form-group mb-3">
											<label for="name">Product ID </label>
											<form:input type="text" path="maSP" class="form-control validate" readonly="true"/>
										</div>

										<div class="form-group mb-3">
											<label for="tenSP">Product Name </label>
											<form:input type="text" path="tenSP" class="form-control validate" />
										</div>
										
										<div class="form-group mb-3">
											<label for="loaiSanPham.maLoaiSP">Loại Sản Phẩm </label>
											<form:select path="loaiSanPham.maLoaiSP" type="text" class="form-control">
												<c:forEach items="${listLoaiSP}" var = "loaiSP">
													<form:option value="${loaiSP.maLoaiSP}">${loaiSP.tenLoai}</form:option>
												</c:forEach>
											</form:select>
										</div>
										
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="nhaSanXuat.maNSX">Nhà Sản Xuất </label>
												<form:select path="nhaSanXuat.maNSX" type="text" class="form-control">
													<c:forEach items="${listNSX}" var = "nsx">
														<form:option value="${nsx.maNSX}">${nsx.tenNSX}</form:option>
													</c:forEach>
												</form:select>
											</div>
											
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="nhaCungCap.maNCC">Nhà Cung Cấp </label>
												<form:select path="nhaCungCap.maNCC" type="text" class="form-control">
													<c:forEach items="${listNCC}" var = "ncc">
														<form:option value="${ncc.maNCC}">${ncc.tenNCC}</form:option>
													</c:forEach>
												</form:select>
											</div>
										</div>
										
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="donGia">Đơn Giá</label>
												<form:input path="donGia" class="form-control" />
											</div>
											
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="soTienGiamGia">Số Tiền Giảm Giá</label>
												<form:input path="soTienGiamGia" class="form-control" />
											</div>
										</div>
										
										<div class="form-group mb-3">
											<label for="ngapCapNhat">Ngày Cập Nhật</label>
											<form:input path ="ngapCapNhat" class="form-control datepicker" value="${ngapCapNhat}" />
											<input type="text" class="form-control" id="alternate" readonly style="color: blue">
										</div>
										
										<form:input path ="hinhAnh" style="display: none" />
										
										

									</div>

									<div class="col-xl-5 col-lg-5 col-md-12 mx-auto mb-4">
										<div>
											<img src="${contextPath}/resources/HinhAnh/${sanPham.hinhAnh}" alt="Product image" class="img-fluid d-block mx-auto">
										</div>
										
										<div class="custom-file mt-3 mb-3">
											<input id="fileInput" type="file" style="display: none;">
											<input type="button" class="btn btn-primary btn-block mx-auto" value="CHANGE IMAGE NOW"
												onclick="document.getElementById('fileInput').click();">
										</div>
										
										<div class="form-group mb-3">
											<label for="cauHinh">Cấu Hình</label>
											<form:textarea path="cauHinh" class="form-control validate" rows="3" />
										</div>
										
									</div>
									<div class="col-12">
										<div class="form-group mb-3">
											<label for="moTa">Mô tả</label>
											<form:textarea path="moTa" class="form-control validate" rows="5" />
										</div>
										<button type="submit" class="btn btn-primary btn-block text-uppercase" style="margin-bottom: 30px">Update Now</button>
									</div>

								</div>
							</div>
						</div>

					</form:form>
				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<jsp:include page="/WEB-INF/views/layouts/admin/footer.jsp" />
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/admin/LogoutModel_ScrolltoTopButton_MapJS.jsp" />
	
</body>
</html>