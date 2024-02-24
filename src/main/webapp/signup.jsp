<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup Page</title>
<link rel="stylesheet" type="text/css" href="signup.css">
</head>
<body>
	<%
	String role = request.getParameter("role"); // Retrieve the role parameter
	%>

	<div class="main">
		<div class="container">
			<form action="FarmerSignUpController" method="post"
				autocomplete="off">
				<input type="hidden" name="role" value="<%=role%>">
				<div class="form-group">
					<input type="text" id="fname" name="fname"
						placeholder="* First Name" required>
				</div>
				<div class="form-group">
					<input type="text" id="lname" name="lname"
						placeholder="* Last Name" required>
				</div>
				<div class="form-group">
					<input type="email" id="email" name="email" placeholder="* Email"
						required>
				</div>
				<div class="form-group">
					<input type="text" id="address" name="address"
						placeholder="* Address" required>
				</div>
				<div class="form-group">
					<input type="tel" id="phone" name="phone" placeholder="* Phone"
						required pattern="[6-9][0-9]{9}" minlength="10" maxlength="10">
				</div>
				<div class="form-group">
					<input type="password" id="password" name="password"
						placeholder="* Password" required>
				</div>
				<div class="form-group">
					<input type="password" id="confirmPassword" name="confirmPassword"
						placeholder="* Confirm Password" required>
				</div>


				<div class="form-group">
					<input type="button" value="Back" onclick="goToRegisterPage()">

		<input type="submit" value="Register" onclick="return validatePassword()">
				</div>

			</form>
		</div>
	</div>
	
	<script>
    function validatePassword() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        if (password !== confirmPassword) {
            alert("Passwords and confirm password must be the same");
            return false; // Stop form submission
        }else{
        	alert("User Registered Sucessfully....");
        return true; // Allow form submission
    }
        }
</script>


    function goToRegisterPage() {
        window.location.href = "registration.jsp"; 
    }


	</script>
</body>
</html>
