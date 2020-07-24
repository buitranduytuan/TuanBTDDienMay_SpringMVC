<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="linkImages" value="${pageContext.request.contextPath}/resources/images" />
<c:set var="productImage" value="/resources/HinhAnh" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>TuanDienMay</title>
<jsp:include page="/WEB-INF/views/layouts/head_css_js.jsp" />
</head>
<body>

<jsp:include page="/WEB-INF/views/layouts/header.jsp"></jsp:include>
	
	<div class="privacy py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
		
			<div class="checkout-right">
			<h4 class="mb-sm-4 mb-3" style="color: green">${msg}</h4>
			<c:if test="${order == null}">
				<h4 class="mb-sm-4 mb-3">Your shopping cart empty </h4>
			</c:if>
	
			<c:if test="${order != null}">
				<h4 class="mb-sm-4 mb-3">Your shopping cart contains:
					<span id="soSanPham">${order.orderItems.size()}</span>
				</h4>
				
				<div class="table-responsive">
					<table class="timetable_sub">
						<thead>
								<th>No.</th>
								<th style="width: 35%">Product Name</th>
								<th style="width: 25%">Image</th>
								<th>Quality</th>
								<th>Price</th>
								<th>Delete</th>
						</thead>
						<tbody>
							<c:set var="dem" value="0" />
							<c:set var="TongTienThanhToan" value="0" />
							<c:forEach items="${order.orderItems}" var="orderItem">
								<tr class="rem${dem=dem+1}">
									<td class="invert">${dem}</td>
									<td class="invert">${orderItem.sanPham.tenSP}</td>
									<td class="invert-image">
										<a href='<c:url value="/productDetail/${orderItem.sanPham.maSP}"/>'>
											<img src="<c:url value="${productImage}/${orderItem.sanPham.hinhAnh}"/>" alt=" " class="img-responsive" >
										</a>
									</td>
									<td class="invert">
										<input type="number" min = 1 value="${orderItem.number}" id="numberUpdate${dem}" style="width: 60px">
										<button class="btn btn-primary" type="submit" id="buttonUpdate${dem}">Update</button>
									</td>
									
									<td class="invert" id="money${dem}">
										<fmt:formatNumber type = "number"  maxFractionDigits = "3" 
												value = "${orderItem.sanPham.donGia*orderItem.number}"/>  VNĐ
									</td>
									
									<td class="invert">
										<div class="rem">
											<div class="close1" id="ClickClose${dem}"> </div>
										</div>
									</td>
								</tr>
								
								<!-- Update product number-->
								<script>
									$(document).ready(function () {
										$('#buttonUpdate${dem}').on('click', function () {
											var soLuong = $('#numberUpdate${dem}').val();
											var money = soLuong*${orderItem.sanPham.donGia};
											var result= money.toLocaleString(undefined, {minimumFractionDigits: 0, maximumFractionDigits: 3})+ " VNĐ";
											console.log(result);
											$('#money${dem}').text(result);
											$.ajax({
												url: "/TuanDienMay/giohang/update",
												type: "GET",
												data: {
													maSP: ${orderItem.sanPham.maSP},
													number: soLuong
												},
												success: function(value){
													$("#tongTien").text(value+ " VNĐ");
													$("#shopCart").load(location.href + " #shopCart");
												}
											});
										});
									});
								</script>
								<!-- Update product number-->
								
								<!-- Delete product from cart-->
								<script>
									$(document).ready(function () {
										$('#ClickClose${dem}').on('click', function () {
											$('.rem${dem}').fadeOut('slow', function () {
												$('.rem${dem}').remove();
												var count = $('#soSanPham').text();
												var newCount = count -1;
												$('#soSanPham').text(newCount);
											});

											$.ajax({
												url: "/TuanDienMay/giohang/xoagiohang/${orderItem.sanPham.maSP}",
												type: "GET",
												success: function(value){
													$("#tongTien").text(value+ " VNĐ");
													$("#shopCart").load(location.href + " #shopCart");
												}
											})
										});
									});
									
								</script>
								<!-- Delete product from cart-->
								
							</c:forEach>
							<tr>
							<td colspan="3" style="border: none">
							<td colspan="1" style="color: green">Total Money</td>
							<td colspan="2" id="tongTien"style="color: red">
								<fmt:formatNumber type = "number"  maxFractionDigits = "3"  value = "${tongTien}"/>  VNĐ
							</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var = "user"/>
					<a href='<c:url value="/DatHang" />' class="btn btn-success active" role="button">Xin mời ${user.username} đặt hàng</a>
				</sec:authorize>
			
				<sec:authorize access="!isAuthenticated()">
					<button class="btn btn-danger" id="btnMuaNgay">Xác nhận thông tin mua hàng</button>
					
					<a href='<c:url value="/login" />' class="btn btn-success active" role="button">Đăng nhập để mua</a>
				
					<div class="checkout-left" style="display: none" id="ThongTinKhachHang">
						<div class="address_form_agile mt-sm-5 mt-4">
							<form action='<c:url value="/DatHang" />' method="post" class="creditly-card-form agileinfo_form">
								<div class="creditly-wrapper wthree, w3_agileits_wrapper">
									<div class="information-wrapper">
										<div class="first-row">
											<div class="controls form-group">
												<input class="billing-address-name form-control" type="text" name="tenKH" placeholder="Full Name" required>
											</div>
											<div class="w3_agileits_card_number_grids">
												<div class="w3_agileits_card_number_grid_left form-group">
													<div class="controls">
														<input type="text" class="form-control" placeholder="Mobile Number" name="soDienThoai" required>
													</div>
												</div>
												<div class="w3_agileits_card_number_grid_right form-group">
													<div class="controls">
														<input type="text" class="form-control" placeholder="Email" name="email" required>
													</div>
												</div>
											</div>
											<div class="controls form-group">
												<input type="text" class="form-control" placeholder="Address" name="diaChi" required>
											</div>
										</div>
										<button class="submit check_out btn">Xác nhận mua hàng</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</sec:authorize>
				
			</c:if>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/layouts/footer.jsp"></jsp:include>
	
	<script>
		$(document).ready(function () {
			$('#btnMuaNgay').on('click', function(){
				/* $('#ThongTinKhachHang').css('display','block'); */
				$('#ThongTinKhachHang').toggle('display');
			});
		});
	</script>
	

</body>