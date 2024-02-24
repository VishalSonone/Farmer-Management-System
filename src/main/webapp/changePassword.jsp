<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="changePassword.css">
</head>
<body>
<div class="container">
    <h2>Change Password</h2>
    <form action="changePasswordServlet" method="post">
        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <div class="button-group">
            <button type="submit" class="update-button">Update</button>
            <button type="button" class="cancel-button" onclick="window.location.href='home.jsp'">Cancel</button>
        </div>
    </form>
</div>
</body>
</html>