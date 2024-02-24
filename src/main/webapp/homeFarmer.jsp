<%@page import="farmer_project.ProductCRUD"%>
<%@page import="farmer_project.Product"%>
<%@ page import="farmer_project.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Farmer Home</title>
    <link rel="stylesheet" href="homeFarmer.css">
</head>
<body> 
    <%
        // Get the farmer ID from the session
        int id = (Integer) session.getAttribute("id");
        FarmerCRUD crud = new FarmerCRUD();
        ResultSet farmerSet = crud.fetchAllData(id);

        // Retrieve the farmer's name from the ResultSet
        String name = "";
        if (farmerSet.next()) {
            name = farmerSet.getString("fname");
        }
    %>
   <div class="main">
    <div class="links">
    
        	<div class="greet">
        	<span>Hello <%= name%></span>
        	</div>
            <a href="registration.jsp">Home</a>
            <a href="profile.jsp">Profile</a>
            <a href="postProduct.jsp">Post</a>
            <a href="about.jsp">Contact</a>
<a href="registration.jsp" onclick="return logout()">Logout</a>
       
    </div>
    <div class="product-container">
        <%
            ProductCRUD productCRUD = new ProductCRUD();
            List<Product> productList = productCRUD.fetchAll();

            for (Product product : productList) {
                String productName = product.getName();
                int quality = product.getQuantity();
                String description = product.getDesc();
                double price = product.getPrice();
                String location = product.getLoc();
                String imageURL = product.getUrl();
        %>
        
        <div class="product-card">
            <h2><%= productName %></h2><span><button type="button" >Buy</button></span>
            <p><strong>Quality:</strong> <%= quality %></p>
            <p><strong>Description:</strong> <%= description %></p>
            <p><strong>Price:</strong> <%= price %></p>
            <p><strong>Location:</strong> <%= location %></p>
            <div class="imgs">
                <img src="<%= imageURL %>" alt="Product Image">
            </div>
        </div>
        
        <% }  %>
    </div> 
    </div> 
</body>

<script>
function logout() {
    var ip = confirm("Are you sure you want to logout?");
    if (ip) {
        return true; // Allow the default action (redirect to registration.jsp)
    } else {
        return false; // Cancel the default action
    }
}
</script>
</html>
