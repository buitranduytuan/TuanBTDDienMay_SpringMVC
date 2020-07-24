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

    <div class="banner-bootom-w3-agileits py-5">
        <div class="container py-xl-4 py-lg-2">
           
				<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
	                <span>${sp.loaiSanPham.tenLoai.toUpperCase()}</span>
	                <span>${sp.nhaSanXuat.tenNSX.toUpperCase()}</span>
            	</h3> 


            <div class="row">
                <div class="col-lg-5 col-md-8 single-right-left ">
                    <div class="grid images_3_of_2">
                        <div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="${productImage}/${sp.hinhAnh}" data-thumb-alt="" class="flex-active-slide" style="width: 437px; margin-right: 0px; float: left; display: block;">
                                    <div class="thumb-image">
                                        <img src="<c:url value="${productImage}/${sp.hinhAnh}"/>" data-imagezoom="true" class="img-fluid" alt="" draggable="false">
                                    </div>
                                </li>

                                <li data-thumb="/Content/images/si2.jpg">
                                    <div class="thumb-image">
                                        <img src="<c:url value="${productImage}/${sp.hinhAnh}"/>" data-imagezoom="true" class="img-fluid" alt="">
                                    </div>
                                </li>

                                <li data-thumb="/Content/images/si3.jpg">
                                    <div class="thumb-image">
                                        <img src="~/Content/images/si3.jpg" data-imagezoom="true" class="img-fluid" alt="">
                                    </div>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-7 single-right-left simpleCart_shelfItem">
                    <h3 class="mb-3">${sp.tenSP}</h3>
                    <p class="mb-3">
                        <span class="item_price">
							<fmt:formatNumber type = "number"  maxFractionDigits = "3" value = "${sp.donGia}" />  VNĐ
						</span>
                        <del class="mx-2 font-weight-light">
                        	<fmt:formatNumber type = "number"  maxFractionDigits = "3" value = "${sp.donGia}" />  VNĐ
                        </del>
                        <label>Free delivery</label>
                    </p>
                    <div class="single-infoagile">
                        <ul>
                            <li class="mb-3">
                                Cash on Delivery Eligible.
                            </li>
                            <li class="mb-3">
                                Shipping Speed to Delivery.
                            </li>
                            <li class="mb-3">
                                EMIs from $655/month.
                            </li>
                            <li class="mb-3">
                                Bank OfferExtra 5% off* with Axis Bank Buzz Credit CardT&C
                            </li>
                        </ul>
                    </div>
                    <div class="product-single-w3l">
                        <p class="my-3">
                            <i class="far fa-hand-point-right mr-2"></i>
                            <label>1 Year</label>Manufacturer Warranty
                        </p>
                        <ul>
                            <li class="mb-1">
                                3 GB RAM | 16 GB ROM | Expandable Upto 256 GB
                            </li>
                            <li class="mb-1">
                                5.5 inch Full HD Display
                            </li>
                            <li class="mb-1">
                                13MP Rear Camera | 8MP Front Camera
                            </li>
                            <li class="mb-1">
                                3300 mAh Battery
                            </li>
                            <li class="mb-1">
                                Exynos 7870 Octa Core 1.6GHz Processor
                            </li>
                        </ul>
                        <p class="my-sm-4 my-3">
                            <i class="fas fa-retweet mr-3"></i>Net banking & Credit/ Debit/ ATM card
                        </p>
                    </div>
                    <div class="occasion-cart">
                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                             <input type="submit" name="submit" value="Add to cart" class="button" id="addToCart" />
                        </div>
                    </div>
                </div>
            </div>


            <div class="single-infoagile" >
                <ul>
                    <li class="mb-3">
                        ${sp.moTa}

                    </li>
                </ul>
            </div>
        </div>
    </div>
	
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"></jsp:include>

	<script>
		$(document).ready(function () {
			$('#addToCart').on('click', function () {
				$.ajax({
					url: "/TuanDienMay/giohang/themgiohang/${sp.maSP}",
					type: "GET",
					success: function(sl){
						$("#addToCart").val("Added "+sl);
						$("#shopCart").load(location.href + " #shopCart");
					}
				})
			});
		});
	</script>
</body>