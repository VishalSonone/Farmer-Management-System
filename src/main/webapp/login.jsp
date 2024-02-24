<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
	<%
	String message = (String) request.getAttribute("message");
	%>

	<div class="login-box">
        <form action="login" method="post">
            <div class="form-group">
                 <input type="text" id="phone"
                    name="phone" placeholder="Username/Phone" required>
            </div>
            <div class="form-group">
               <input type="password"
                    id="password" name="password" placeholder="Password" required>
            </div>
            
            <div class="form-group">
                <input type="button" value="Cancel" onclick="goToRegisterPage()"> 
                <input type="submit"value="Login">
            </div>
            <div class="links">
            <a href="#">Forgot Password?</a><br>
            <span>Don't have an account?</span> <a href="registration.jsp">Sign up</a>
            </div>
        </form>
    </div>

	<script>
		function goToRegisterPage() {
			window.location.href = "registration.jsp"; // Redirect to register.jsp
		}
	</script>
</body>


</html>
