<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="mapping" value="${pageContext.request.contextPath}/resources/login_register" />
<c:set var="home" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
	<title>Login - Register</title>
	<link rel="stylesheet" href="${mapping}/fonts/material-icon/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="${mapping}/css/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>

<body>

	<div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form:form method="POST" class="register-form" id="register-form" modelAttribute="thanhVien" 
                        				action="${home}/register-action" onsubmit="return validateForm()">
                           
                            <spring:bind path="username">
                                  <div class="form-group">
	                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
	                                <form:input type="text" path="username" id="username" placeholder="Your Name"/>
                            	</div>
                            	<form:errors path="username" style="color: red" />
                            </spring:bind>
                            
                            <spring:bind path="password">
                                 <div class="form-group">
	                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
	                                <form:input type="password" path="password" id="password" placeholder="Your Password"/>
                            	</div>
                            	<form:errors path="password" style="color: red"/>
                            </spring:bind>
                            
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            
                            
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <form:input type="email" path="email" id="email" placeholder="Your Email"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="diaChi"><i class="zmdi zmdi-pin"></i></label>
                                <form:input type="text" path="diaChi" id="diaChi" placeholder="Your Address"/>
                            </div>
                            
                            <spring:bind path="hoTen">
                                 <div class="form-group">
	                                <label for="hoTen"><i class="zmdi zmdi-face"></i></label>
	                                <form:input type="text" path="hoTen" id="hoTen" placeholder="Your Full Name"/>
                            	</div>  
                            	<form:errors path="hoTen" style="color: red" />
                            </spring:bind>
                            
                            <div class="form-group">
                                <label for="soDienThoai"><i class="zmdi zmdi-phone"></i></label>
                                <form:input type="text" path="soDienThoai" id="soDienThoai" placeholder="Your Phone Number"/>
                            </div>
                            
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            
                            <div class="alert alert-danger" id="msgError" style="display: none">
	                        </div>
                            
                            <c:if test="${errorSignUp != null}">
	                            <div class="alert alert-danger">
	                                <c:out value="${errorSignUp}"/>
	                            </div>
	                        </c:if>
                            
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" style="width: 100%" class="form-submit" value="Register"/>
                            </div>
                        </form:form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="${mapping}/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="${home}" class="signup-image-link" style="color: red; font-size: 22px">Back to Home</a>
                    </div>
                </div>
            </div>
        </section>
        
	</div>

<script>
	function validateForm(){
		var password = document.getElementById("password").value;
		var re_pass = document.getElementById("re_pass").value;
		var email = document.getElementById("email").value;
		var username = document.getElementById("username").value;
		var msg = document.getElementById("msgError");
	
		if(username == ""){
			msg.style.display = 'block';
			msg.innerHTML = "Tên không được để trống";
			return false;
		}
		
		if(password !== re_pass){
			msg.style.display = 'block';
			msg.innerHTML = "Xác nhận mật khẩu không khớp";
			return false;
		}
		
		if(email == ""){
			msg.style.display = 'block';
			msg.innerHTML = "Địa chỉ Email không được để trống";
			return false;
		}
		
		return true;
	}
</script>
</body>