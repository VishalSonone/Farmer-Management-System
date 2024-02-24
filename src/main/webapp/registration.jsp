<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Bebas+Neue&family=Lato:ital,wght@1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Whisper&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="register.css">



</head>




	

<body>
    <nav>
        <nav class="navbar">
            <div class="navlogo">
                <a href="#">
                    KrushiMart
                </a>
            </div>
            <div class="navanchor">
                <a class="navbar-brand" href="#">Home</a>
                <a class="navbar-brand" href="#">Contact Us</a>
            </div>
        </nav>
    </nav>

    <div class="container">
        <div class="main">
            <div class="registration-box">
                <div class="heading">
                    <h1 style="color: rgb(235, 64, 64);">New Registration</h1>
                </div>
                <div class="imgs">
                    <a href="signup.jsp?role=farmer"><img class="img1" src="images/farmer.png" alt="Farmer Image"></a>

                    <a href="signup.jsp?role=buyer"><img class="img2" src="images/buyer.jpg" alt="Buyer Image"></a>
                </div>
                <div class="log">
                    <span style="font-size: 22px;">Existing User?</span>
                    <a href="login.jsp"><button type="button">Login</button></a>
                </div>
            </div>
            <div class="big-image-box">
                <img src="images/farmbus.jpg" alt="Big Image">
            </div>
        </div>
        <footer>
            <div class="footer1">
                <div class="icons">
                    <span style="font-size: 22px; color:green">FOLLOW US</span>
                    <i class="fa-brands fa-square-instagram fa-2xl"></i>
                    <i class="fa-brands fa-facebook fa-2xl"></i>
                    <i class="fa-brands fa-square-twitter fa-2xl"></i>
                    <i class="fa-brands fa-linkedin fa-2xl"></i>
                </div>
            </div>
        </footer>
    </div>






</body>
</html>