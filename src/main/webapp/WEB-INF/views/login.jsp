<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

		<c:if test="${RegisterSuccess != null}">
			<div class="alert alert-success">
	             <c:out value="${RegisterSuccess}"/>
	        </div>
		</c:if>
		
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="${mapping}/images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="${home}" class="signup-image-link" style="color: red; font-size: 18px">Back to Home</a>
                        <a href="${home}/register" class="signup-image-link" style="color: red; font-size: 18px">Create a Account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="login-form" action="<c:url value="/j_spring_security_check"/>">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="username" id="your_name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="your_pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            
                            <c:if test="${errorSignIn != null}">
	                            <div class="alert alert-danger">
	                                <c:out value="${errorSignIn}"/>
	                            </div>
	                        </c:if>
	                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" style="width: 100%" id="signin" class="form-submit" value="Log in"/>
                            </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</div>

</body>