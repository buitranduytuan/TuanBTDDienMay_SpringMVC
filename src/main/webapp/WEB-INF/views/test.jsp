<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>TuanDienMay</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <!-- text page-->
    <section class="padding-small" id="111">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="block">
              <div class="block-header">
                <h5>Login</h5>
              </div>
              <div class="block-body"> 
                
                
                
                <p id="inner" style="color: red"></p>
                <form <%-- action="<c:url value="/test"/>" --%> method="POST">
                  <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <input id="username" type="text" class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input id="password" type="password" class="form-control">
                  </div>
                  <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary" id="clickLogin"><i class="fa fa-sign-in"></i> Log in</button>
                  </div>
                </form>
              </div>
            </div>
        </div>
        </div>
      </div>
      <p id="reload" style="color: blue"></p>
    </section>
                		
      <button class="btn btn-primary" id="clickLogin2"><i class="fa fa-sign-in"></i> ClickMe</button>           		
	<script>
  	$(document).ready(function(){
		$("#clickLogin2").click(function(){
			var ten = $("#username").val();
			console.log(ten);
			var pass = $("#password").val();
			console.log(pass);
			$.ajax({
				url: "/TuanDienMay/test",
				type: "GET",
 				data: {
					username: ten,
					password: pass
				}, 
 				success: function(value){
					/* if(value == "true"){
						$("#inner").text("Login success !")
					} else {
						$("#inner").text("Login fail !")
					} */
					$("#reload").load("#reload");
					/* $("#inner").text(value); */
					
				}
				
			})
		});
		});
		
	</script>
</body>