<%@page import="tuanbtd.com.repository.SanPhamRepository"%>
<%@page import="tuanbtd.com.entity.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="tuanbtd.com.serviceImpl.SanPhamServiceImpl"%>
<%@page import="tuanbtd.com.service.SanPhamService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="linkImages" value="${pageContext.request.contextPath}/resources/images" />
<c:set var="hinhAnh" value="${pageContext.request.contextPath}/resources/HinhAnh" />

	<div class="agile-main-top">
		<div class="container-fluid">
			<div class="row main-top-w3l py-2">
				<div class="col-lg-4 header-most-top">
					<p class="text-white text-lg-left text-center">Offer Zone Top Deals & Discounts
						<i class="fas fa-shopping-cart ml-1"></i>
					</p>
				</div>
				<div class="col-lg-8 header-right mt-lg-0 mt-2">
					<!-- header lists -->
					<ul>
						<li class="text-center border-right text-white">
							<a class="play-icon popup-with-zoom-anim text-white" href="#small-dialog1">
								<i class="fas fa-map-marker mr-2"></i>Select Location</a>
						</li>
						<li class="text-center border-right text-white">
							<a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
								<i class="fas fa-truck mr-2"></i>Track Order</a>
						</li>
						<li class="text-center border-right text-white">
							<i class="fas fa-phone mr-2"></i> 001 234 5678
						</li>
						
						<sec:authorize access="isAuthenticated()==false">
	                        <li class="text-center border-right text-white">
								<a href='<c:url value="/login" />' class="text-white">
									<i class="fas fa-sign-in-alt mr-2"></i> Log In </a>
							</li>
							<li class="text-center text-white">
								<a href='<c:url value="/register" />' class="text-white">
									<i class="fas fa-user-plus mr-2"></i>Register </a>
							</li>
                    	</sec:authorize>
						
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var = "user"/>
							
							<li class="text-center text-white border-right dropdown">
                                <i class="fas fa-user mr-2 "> </i> Hello, ${user.username}
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item">
                                        <i class="fas fa-info mr-2"></i>Thông tin tài khoản
                                    </a>
                                    <a href="#" class="dropdown-item">
                                        <i class="fas fa-edit mr-2"></i>Thay đổi thông tin
                                    </a>
                                    <c:if test="${user.role=='ROLE_ADMIN'}">
                                    	<a href='<c:url value="/admin/index" />' class="dropdown-item">
                                        	<i class="fas fa-users mr-2"></i>Admin Page
                                    	</a>
                                    </c:if>
                                    <a href='<c:url value="/logOut" />' class="dropdown-item">
                                        <i class="fas fa-sign-out-alt mr-2"></i>Đăng xuất
                                    </a>
                                </div>
                            </li>
                    	</sec:authorize>
						
					</ul>
					<!-- //header lists -->
				</div>
			</div>
		</div>
	</div>

	<!-- Button trigger modal(select-location) -->
	<div id="small-dialog1" class="mfp-hide">
		<div class="select-city">
			<h3>
				<i class="fas fa-map-marker"></i> Please Select Your Location</h3>
			<select class="list_of_cities">
				<optgroup label="Popular Cities">
					<option selected style="display:none;color:#eee;">Select City</option>
					<option>Birmingham</option>
				</optgroup>
				<optgroup label="Alabama">
					<option>Birmingham</option>
				</optgroup>
				<optgroup label="Alaska">
					<option>Anchorage</option>
				</optgroup>
			</select>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //shop locator (popup) -->

	<!-- header-bottom-->
	<div class="header-bot">
		<div class="container">
			<div class="row header-bot_inner_wthreeinfo_header_mid">
				<!-- logo -->
				<div class="col-md-3 logo_agile">
					<h1 class="text-center">
						<a href="${contextPath}" class="font-weight-bold font-italic">
							<img src="${linkImages}/logo2.png" alt=" " class="img-fluid">Electro Store
						</a>
					</h1>
				</div>
				<!-- //logo -->
				<!-- header-bot -->
				<div class="col-md-9 header mt-4 mb-md-0 mb-4">
					<div class="row">
						<!-- search -->
						<div class="col-10 agileits_search">
							<form class="form-inline" action='<c:url value="/findProductByName" />' method="GET">
								<input class="form-control mr-sm-2" type="search" name="productName" placeholder="Search" aria-label="Search" required>
								<input name="page" hidden="true" value="1">
								<button class="btn my-2 my-sm-0" type="submit">Search</button>
							</form>
						</div>
						<!-- //search -->
						<!-- cart details -->
						<div class="col-2 top_nav_right text-center mt-sm-0 mt-2">
							<div class="wthreecartaits wthreecartaits2 cart cart box_1">
									<button class="btn w3view-cart" data-toggle="modal" data-target="#myModal" type="button">
									<i class="fas fa-cart-arrow-down"></i>
									</button>
							</div>
						</div>
						<!-- //cart details -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- shop locator (popup) -->
	<!-- //header-bottom -->
	
		<!-- navigation -->
	<div class="navbar-inner">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				
				<div class="agileits-navi_search">
                <div class="dropdown show">
                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                        All Categories
                    </button>
                    <div class="dropdown-menu show" style="display: none;">
	                    <c:forEach items="${listDanhMuc}" var="danhMuc">
	                    	<a class="dropdown-item" href='<c:url value="/productByCategory/${danhMuc.tenLoai}/1" />'>${danhMuc.tenLoai.toUpperCase()}</a>
	                    </c:forEach>
                    </div>
                </div>
            </div>
				
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto text-center mr-xl-5">
						<li class="nav-item active mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="${contextPath}">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>
						
						<c:forEach items="${listDanhMuc}" var="danhMuc">
						<li class="nav-item dropdown">
					      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
					        ${danhMuc.tenLoai}
					      </a>
					      <div class="dropdown-menu">
					      <c:forEach items="${danhMuc.listNSX}" var="NSX">
					      	<a class="dropdown-item" href='<c:url value="/product/${danhMuc.tenLoai}/${NSX}/1"/>'>${NSX.toUpperCase()}</a>
					      </c:forEach>
					        			        
					      </div>
					    </li>
						</c:forEach>
						
						
						<li class="nav-item mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href='<c:url value="/about"/>'>About Us</a>
						</li>	
						
						<li class="nav-item">
							<a class="nav-link" href='<c:url value="/contact_us"/>'>Contact Us</a>
						</li>
					</ul>
				</div>
				
			
			  <!-- The Modal Shop Cart-->
			  <div class="modal" id="myModal">
			    <div class="modal-dialog">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">Shop Cart</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body" id="shopCart">
				        <div class="table-responsive">
				        	<c:if test="${order==null}">
				        		<h4 style="color: green">Shop Cart is empty!</h4>
				        	</c:if>
					        <c:if test="${order!=null}">
					        	<table class="timetable_sub">
						         	<thead>
										<th>Name</th>
										<th>Image</th>
										<th>Amount</th>
									</thead>
									<tbody>
										<c:forEach items="${order.orderItems}" var = "orderItem">
											<tr>
												<td>${orderItem.sanPham.tenSP}</td>
												<td>
													<img alt="" src="${hinhAnh}/${orderItem.sanPham.hinhAnh}" style="width: 40%">
												</td>
												<td>${orderItem.number}</td>
											</tr>
										</c:forEach>
									</tbody>
					         	</table>
					        </c:if>
				        </div>
			         	
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <a href="/TuanDienMay/giohang/xemgiohang" class="btn btn-success active" role="button">Cart Detail</a>
			          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			    </div>
			  </div>
			  <!-- /The Modal Shop Cart-->
			  
			</nav>
		</div>
	</div>
	<!-- //navigation -->
	