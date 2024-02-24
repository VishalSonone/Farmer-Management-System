<%@page import="farmer_project.FarmerCRUD"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="postProduct.css">
</head>

<body>
<%

int id=(Integer)session.getAttribute("id");
System.out.println(id);
FarmerCRUD crud=new FarmerCRUD();
ResultSet set=crud.fetchAllData(id);

String name="";
if(set.next()){
	 name=set.getString("fname");
}
 
session.setAttribute("id", id)
;
%>

<%System.out.print(id); %>
<%System.out.print(name); %>

	<div class="main">

		<div class="container">
			<div class="options-box">

				<div class="greet">
					<div class="image-container">
						<img src="images/farmer.png" alt="farmer" width="80px"
							height="70px">
					</div>
					<div class="text-container">
						<span class="greet-text">Hello</span> <span class="name"><%=name %></span>
					</div>
				</div>

				<button type="button">Home</button>
				<button type="button">Profile</button>
				<button type="button">About</button>
				<button type="button">Contact</button>
				<button type="button">Logout</button>

			</div>
			<%System.out.println("from form tag"); %>
				<%System.out.println(id); %>
			<div class="post-box">
				<form action="addProduct" method="post">
			
					<input type="text" name="name" id="name" placeholder="Product Name" required> 
						<input type="number" name="quantity" id="quantity" placeholder="Quantity" required> 
						<input type="text" name="price" id="price" placeholder="Price" required>
					    <input type="text" name="desc" id="desc" placeholder="Description" required>
						 <input type="text" name="loc" id="loc" placeholder="Location" required> 
						<input type="text" name="url" id="url" placeholder="URL" required> 
						<input type="submit" class="postbtn" value="Post">
				</form>

			</div>
		</div>


	</div>



</body>
</html>