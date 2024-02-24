
<%@ page import="java.sql.ResultSet" %>
<%@ page import="farmer_project.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="profile.css">
</head>
<body>

<%


int id=(Integer)session.getAttribute("id");
System.out.println(id);
FarmerCRUD crud=new FarmerCRUD();
ResultSet set=crud.fetchAllData(id);
int fetchedId=0 ;
String fname=null;
String lname=null;
String address=null ;
String email=null;
String phone=null;
if (set != null && set.next()) {
 fetchedId = set.getInt("id");
    fname = set.getString("fname");
    lname = set.getString("lname");
    address = set.getString("address");
    email = set.getString("email");
    phone = set.getString("phone");
}
%>
    <div class="container">
        <div class="profile-info">
            <label>ID:</label> <%= fetchedId %><br>
            <label>First Name:</label> <%= fname %><br>
            <label>Last Name:</label> <%= lname %><br>
            <label>Address:</label> <%= address %><br>
            <label>Email:</label> <%= email %><br>
            <label>Phone Number:</label> <%= phone %><br>
        </div>  <div class="button-container">
            <button onclick="location.href='editProfile.jsp'">Edit Profile</button>
            <button onclick="location.href='changePassword.jsp'">Change Password</button>
            <button onclick="location.href='postProduct.jsp'">Add Post</button>
            <button onclick="location.href='deletePost.jsp'">Delete Post</button>
        </div>
        <div class="post-count">
            Number of posts: <%= request.getAttribute("postCount") %>
        </div>
    </div>
</body> 
</html>