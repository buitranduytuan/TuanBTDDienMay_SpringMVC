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

					<div class="container">
						<h2>Order Management</h2>
						<br>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#home">Chưa Thanh Toán</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#menu1">Đã Thanh Toán & Chưa Giao</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#menu2">Đã Thanh Toán & Đã Giao</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div id="home" class="container tab-pane active">
								<br>
								<div class="card shadow mb-4">
						            <div class="card-header py-3">
						              <h6 class="m-0 font-weight-bold text-primary">Chưa Thanh Toán</h6>
						            </div>
						            <div class="card-body">
						              <div class="table-responsive">
						                <table class="table table-bordered dataTable" width="100%" cellspacing="0">
						                  <thead>
						                    <tr>
						                      <th>Mã ĐĐH</th>
						                      <th>Tên KH</th>
						                      <th>Ngày Đặt</th>
						                      <th>Ngày Giao</th>
						                      <th>Thanh Toán</th>
						                      <th>Giao Hàng</th>
						                      <th>Ưu Đãi</th>
						                      <th>Duyệt Đơn Hàng</th>
						                    </tr>
						                  </thead>
						                  <tfoot>
						                    <tr>
						                      <th>Mã ĐĐH</th>
						                      <th>Tên KH</th>
						                      <th>Ngày Đặt</th>
						                      <th>Ngày Giao</th>
						                      <th>Thanh Toán</th>
						                      <th>Giao Hàng</th>
						                      <th>Ưu Đãi</th>
						                      <th>Duyệt Đơn Hàng</th>
						                    </tr>
						                  </tfoot>
						                  <tbody>
							                  <c:if test="${ChuaThanhToan != null}">
								                  <c:forEach items="${ChuaThanhToan}" var="dhhCTT">
									                  	<tr>
									                      <td>${dhhCTT.maDDH}</td>
									                      <td>${dhhCTT.khachHang.tenKH}</td>
									                      <td>${dhhCTT.ngayDat}</td>
									                      <td>${dhhCTT.ngayGiao}</td>
									                      <td><i class="fas fa-times" style="color: red"></i></td>
									                      <td><i class="fas fa-times" style="color: red"></i></td>
									                      <td>${dhhCTT.uuDai}</td>
									                      <td>
											              	<a href="${contextPath}/admin/duyetDonDatHang/${dhhCTT.maDDH}">Duyệt Đơn Hàng</a>
														  </td>
									                    </tr>
									                  </c:forEach>
							                  </c:if>
						                  </tbody>
						                </table>
						              </div>
						            </div>
						        </div>
							</div>
							<div id="menu1" class="container tab-pane fade">
								<br>
								<div class="card shadow mb-4">
						            <div class="card-header py-3">
						              <h6 class="m-0 font-weight-bold text-primary">Đã Thanh Toán & Chưa Giao</h6>
						            </div>
						            <div class="card-body">
						              <div class="table-responsive">
						                <table class="table table-bordered dataTable" width="100%" cellspacing="0">
						                  <thead>
						                    <tr>
						                      <th>Mã ĐĐH</th>
						                      <th>Tên KH</th>
						                      <th>Ngày Đặt</th>
						                      <th>Ngày Giao</th>
						                      <th>Thanh Toán</th>
						                      <th>Giao Hàng</th>
						                      <th>Ưu Đãi</th>
						                      <th>Duyệt Đơn Hàng</th>
						                    </tr>
						                  </thead>
						                  <tfoot>
						                    <tr>
						                      <th>Mã ĐĐH</th>
						                      <th>Tên KH</th>
						                      <th>Ngày Đặt</th>
						                      <th>Ngày Giao</th>
						                      <th>Thanh Toán</th>
						                      <th>Giao Hàng</th>
						                      <th>Ưu Đãi</th>
						                      <th>Duyệt Đơn Hàng</th>
						                    </tr>
						                  </tfoot>
						                  <tbody>
							                  <c:if test="${DaThanhToanChuaGiao != null}">
								                  <c:forEach items="${DaThanhToanChuaGiao}" var="dhhDTTCG">
									                  	<tr>
									                      <td>${dhhDTTCG.maDDH}</td>
									                      <td>${dhhDTTCG.khachHang.tenKH}</td>
									                      <td>${dhhDTTCG.ngayDat}</td>
									                      <td>${dhhDTTCG.ngayGiao}</td>
									                      <td><i class="far fa-check-circle" style="color: #00e600"></i></td>
									                      <td><i class="fas fa-times" style="color: red"></i></td>
									                      <td>${dhhDTTCG.uuDai}</td>
									                      <td>
											              	<a href="${contextPath}/admin/duyetDonDatHang/${dhhDTTCG.maDDH}">Duyệt Đơn Hàng</a>
														  </td>
									                    </tr>
									                  </c:forEach>
							                  </c:if>
						                  </tbody>
						                </table>
						              </div>
						            </div>
						        </div>
							</div>
							<div id="menu2" class="container tab-pane fade">
								<br>
								<div class="card shadow mb-4">
						            <div class="card-header py-3">
						              <h6 class="m-0 font-weight-bold text-primary">Đã Thanh Toán & Đã Giao</h6>
						            </div>
						            <div class="card-body">
						              <div class="table-responsive">
						                <table class="table table-bordered dataTable" width="100%" cellspacing="0">
						                  <thead>
						                    <tr>
						                      <th>Mã ĐĐH</th>
						                      <th>Tên KH</th>
						                      <th>Ngày Đặt</th>
						                      <th>Ngày Giao</th>
						                      <th>Thanh Toán</th>
						                      <th>Giao Hàng</th>
						                      <th>Ưu Đãi</th>
						                      <th>Duyệt Đơn Hàng</th>
						                    </tr>
						                  </thead>
						                  <tfoot>
						                    <tr>
						                      <th>Mã ĐĐH</th>
						                      <th>Tên KH</th>
						                      <th>Ngày Đặt</th>
						                      <th>Ngày Giao</th>
						                      <th>Thanh Toán</th>
						                      <th>Giao Hàng</th>
						                      <th>Ưu Đãi</th>
						                      <th>Duyệt Đơn Hàng</th>
						                    </tr>
						                  </tfoot>
						                  <tbody>
							                  <c:if test="${DaThanhToanDaGiao != null}">
								                  <c:forEach items="${DaThanhToanDaGiao}" var="dhhDTTDG">
									                  	<tr>
									                      <td>${dhhDTTDG.maDDH}</td>
									                      <td>${dhhDTTDG.khachHang.tenKH}</td>
									                      <td>${dhhDTTDG.ngayDat}</td>
									                      <td>${dhhDTTDG.ngayGiao}</td>
									                      <td><i class="far fa-check-circle" style="color: #00e600"></i></td>
									                      <td><i class="far fa-check-circle" style="color: #00e600"></i></td>
									                      <td>${dhhDTTDG.uuDai}</td>
									                      <td>
											              	<a href="${contextPath}/admin/duyetDonDatHang/${dhhDTTDG.maDDH}">Duyệt Đơn Hàng</a>
														  </td>
									                    </tr>
									              </c:forEach>
							                  </c:if>
						                  </tbody>
						                </table>
						              </div>
						            </div>
						        </div>
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
	<jsp:include page="/WEB-INF/views/layouts/admin/LogoutModel_ScrolltoTopButton_MapJS.jsp" />

</body>
</html>