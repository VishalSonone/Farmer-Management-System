<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="editProfile.css">
</head>
<body>
<div class="container">
    <h2>Edit Profile</h2>
    <form action="editProfileServlet" method="post">
        
        <!-- <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" value="<user.getFirstName()>" required>
        </div> -->
        <div class="form-group">
            <label for="firstName">Id :</label>
            <input type="text" id="id" name="id" value="Ramesh" required>
        </div>
        
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" value="Ramesh" required>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" value="Ramesh" required>
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="Ramesh" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="Ramesh" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="Ramesh" required>
        </div>
        <div class="button-group">
            <button type="submit" class="save-button">Save Changes</button>
            <button type="button" class="cancel-button" onclick="window.location.href='profile.jsp'">Cancel</button>
        </div>
    </form>
</div>

</body>
</html>