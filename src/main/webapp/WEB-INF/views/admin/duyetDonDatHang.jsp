<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
				<div class="container">
					<div class="row">
						<div class="col-12">
							<h3 style="padding-bottom: 15px" id="titleId">DUYỆT ĐƠN HÀNG</h3>
						</div>
					</div>

					<form:form action="${contextPath}/admin/duyetDDH" method="POST" modelAttribute="donDatHang">
					<div class="row" style="padding-bottom: 15px">
						<div class="col">
							<span class="infoText">Mã đơn hàng: </span> 
							<form:input path="maDDH" class="form-control" readonly = "true"/>
						</div>
						<div class="col">
							<span class="infoText">Tên khách hàng: </span> 
							<form:input path="khachHang.tenKH" class="form-control" readonly = "true"/>
						</div>
						<div class="col">
							<span class="infoText">Ưu đãi:</span> 
							<form:input path="uuDai" class="form-control" readonly = "true"/>
						</div>
						<div class="col">
							<span class="infoText">Tổng Tiền Thanh Toán:</span> 
							<span class="infoContent">
								<fmt:formatNumber type = "number"  maxFractionDigits = "3"  value = "${tongTienThanhToan}" /> VNĐ
							</span>
						</div>
					</div>
				
					
					<div class="row">
					
						<div class="col">
							<label for="daThanhToan" class="infoText">Tình Trạng Thanh Toán:</label>
							<form:select path="daThanhToan" type="text" class="form-control infoContent">
								<form:option value="${donDatHang.daThanhToan}">${donDatHang.daThanhToan}</form:option>
								<form:option value="${!donDatHang.daThanhToan}">${!donDatHang.daThanhToan}</form:option>
							</form:select>
						</div>
						<div class="col">
							<label for="tinhTrangGiaoHang" class="infoText">Tình Trạng Giao Hàng:</label>
							<form:select path="tinhTrangGiaoHang" type="text" class="form-control infoContent">
								<form:option value="${donDatHang.tinhTrangGiaoHang}">${donDatHang.tinhTrangGiaoHang}</form:option>
								<form:option value="${!donDatHang.tinhTrangGiaoHang}">${!donDatHang.tinhTrangGiaoHang}</form:option>
							</form:select>
						</div>
						<div class="col">
							<div class="form-group mb-3 infoText">
								<label for="ngayDat" >Ngày Đặt Hàng:</label>
								<form:input path="ngayDat" class="form-control datepicker infoContent" value="${ngayDat}" />
							</div>
						</div>
						
						<div class="col">
							<div class="form-group mb-3 infoText">
								<label for=ngayGiao>Ngày Giao Hàng:</label>
								<form:input path="ngayGiao" class="form-control datepicker infoContent" value="${ngayGiao}" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
						</div>
						<div class="col">
							<a class="btn btn-danger btn-block text-uppercase" href="${contextPath}/admin/orderedList" role="button">Back</a>
						</div>
						<div class="col">
							<button type="button" id="inHoaDon" class="btn btn-primary btn-block text-uppercase" 
											style="margin-bottom: 30px">In hóa đơn</button>
						</div>
						<div class="col">
							<button type="submit" class="btn btn-success btn-block text-uppercase" style="margin-bottom: 30px">Duyệt đơn hàng</button>
						</div>
					</div>
					</form:form>
				
					<div class="row">
						<div class="col-12">
							<h4 style="padding-bottom: 15px">Chi tiết đơn đặt hàng</h4>
						</div>
					</div>
					
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">MaCTDDH</th>
								<th scope="col">Tên SP</th>
								<th scope="col">Hình Ảnh</th>
								<th scope="col">Đơn Giá</th>
								<th scope="col">Số Lượng</th>
								<th scope="col">Thành Tiền</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="tongTien" value="0" />
							<c:forEach items="${chiTietDDHs}" var="chiTietDDH">
								<tr>
									<th scope="row">${chiTietDDH.maChiTietDDH}</th>
									<td>${chiTietDDH.tenSP}</td>
									<td><img src="${linkImages}/${chiTietDDH.sanPham.hinhAnh}" style="height:80px; width:80px"></td>
									<td>
										<fmt:formatNumber type = "number"  maxFractionDigits = "3" value = "${chiTietDDH.donGia}" />
									</td>
									<td>${chiTietDDH.soLuong}</td>
									<td>
										<fmt:formatNumber type = "number"  maxFractionDigits = "3" 
											value = "${chiTietDDH.donGia*chiTietDDH.soLuong}" />
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

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
	
	<style>
		.infoText{
			color: blue;
		}
		.infoContent{
			color: green;
		}
	</style>

	<script>
		$(document).ready(function(){
			$("#inHoaDon").click(function(){
				$("#accordionSidebar").hide();
				$("#titleId").text("THÔNG TIN ĐƠN HÀNG");
				$(".btn").hide();
				$("#footerId").hide();
				window.print();
				$("#titleId").text("DUYỆT ĐƠN HÀNG");
				$("#accordionSidebar").show();
				$(".btn").show();
				$("#footerId").show();
			});
		});
	</script>
	
</body>
</html>