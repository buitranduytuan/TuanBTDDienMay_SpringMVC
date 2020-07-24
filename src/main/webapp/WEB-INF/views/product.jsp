<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

	<div class="page-head_agile_info_w3l">
	
	</div>

	<div class="ads-grid py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
			<div class="row">
				<!-- product left -->
				<div class="agileinfo-ads-display col-lg-9">
					<div class="wrapper" id="divProducts">
					
						<c:forEach var="i" begin="0" end="${soDong - 1}" >
						<!-- first section -->
						<div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4">				
							<div class="row">
							
							<c:forEach var="j" begin="1" end="3" >
							
								<c:if test="${i*3+j <= soLuongSP }">
									<c:set var = "sp" scope = "session" value = "${listProduct[i*3+j-1]}"/>
									<div class="col-md-4 product-men">
										<div class="men-pro-item simpleCart_shelfItem">
											<div class="men-thumb-item text-center">
												 <img src="<c:url value="${productImage}/${sp.hinhAnh}"/>" style="height:180px; width:180px">
												<div class="men-cart-pro">
													<div class="inner-men-cart-pro">
														<a href='<c:url value="/productDetail/${sp.maSP}"/>' class="link-product-add-cart">Quick View</a>
													</div>
												</div>
											</div>
											<div class="item-info-product text-center border-top mt-4">
												<h4 class="pt-1">
													<a href='<c:url value="/productDetail/${sp.maSP}"/>'>${sp.tenSP}</a>
												</h4>
												<div class="info-product-price my-2">
													<span class="item_price">
														<fmt:formatNumber type = "number"  maxFractionDigits = "3" value = "${sp.donGia}" />  VNĐ
													</span>
													</br>
													<del><fmt:formatNumber type = "number"  maxFractionDigits = "3" value = "${sp.donGia +200000}" />  VNĐ</del>
												</div>
												<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
													<input type="submit" value="Add to cart" class="button btn" id="addToCartId${sp.maSP}">
												</div>
												
												<script>
													$(document).ready(function () {
														$('#addToCartId${sp.maSP}').on('click', function () {
															$.ajax({
																url: "/TuanDienMay/giohang/themgiohang/${sp.maSP}",
																type: "GET",
																success: function(sl){
																	$("#addToCartId${sp.maSP}").val("Added "+sl);
																	$("#shopCart").load(location.href + " #shopCart");
																}
															})
														});
													});
												</script>
	
											</div>
										</div>
									</div>
									</c:if>
								
							</c:forEach>

							</div>
						</div>

						</c:forEach>
						
						<!-- Pagination -->
						<jsp:include page="/WEB-INF/views/layouts/pagination.jsp"></jsp:include>
						
					</div>
				</div>
				<!-- //product left -->
				
												
				
				<!-- product right -->
				<div class="col-lg-3 mt-lg-0 mt-4 p-lg-0">
					<div class="side-bar p-sm-4 p-3">
						<div class="search-hotel border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Brand</h3>
							<form action="#" method="post">
								<input type="search" placeholder="Search Brand..." name="search" required="">
								<input type="submit" value=" ">
							</form>
							<div class="left-side py-2">
								<ul>
									<li>
										<input type="checkbox" class="checked">
										<span class="span">Samsung</span>
									</li>
									<li>
										<input type="checkbox" class="checked">
										<span class="span">Iphone</span>
									</li>
									<li>
										<input type="checkbox" class="checked">
										<span class="span">Xiaomi</span>
									</li>
									<li>
										<input type="checkbox" class="checked">
										<span class="span">VSmart</span>
									</li>
									<li>
										<input type="checkbox" class="checked">
										<span class="span">Oppo</span>
									</li>
								</ul>
							</div>
						</div>
						<!-- ram -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Ram</h3>
							<ul>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">1 GB</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">2 GB</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">4 GB</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">6 GB</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">6 GB &amp; Above</span>
								</li>
							</ul>
						</div>
						<!-- //ram -->
						<!-- price -->
						<div class="range border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Price</h3>
							<div class="w3l-range">
								<ul>
									<li>
										<a href="#">$1,000 - $5,000</a>
									</li>
									<li class="my-1">
										<a href="#">$1,000 - $5,000</a>
									</li>
									<li>
										<a href="#">$5,000 - $10,000</a>
									</li>
									<li class="my-1">
										<a href="#">$10,000 - $20,000</a>
									</li>
									<li>
										<a href="#">$20,000 $30,000</a>
									</li>
									<li class="mt-1">
										<a href="#">Over $30,000</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- //price -->
						<!-- discounts -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Discount</h3>
							<ul>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">5% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">10% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">20% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">30% or More</span>
								</li>
								<li>
									<input type="checkbox" class="checked">
									<span class="span">50% or More</span>
								</li>
							</ul>
						</div>
						<!-- //discounts -->
						
					</div>
					<!-- //product right -->
				</div>
			</div>
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"></jsp:include>

	<script>
		$(document).ready(function () {
			$('.byPrice').on('click', function () {
				alert($(this).val());
			});
		});
	</script>
</body>