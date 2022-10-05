<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">


    <link rel="stylesheet" href="css/chat.css">
    <link rel="stylesheet" href="css/image.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">




</head>
<body>

	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

	<header>
		<h1>
			Jumpstart
		</h1>
		<nav>
			<ul>
				<li><a href="Controller?page=index">Home</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
	
	<!-- 3D image slider -->
	<h2>Jumpstart Best Products</h2>
  <div class="containe">
		<div id="carousel">
			<figure><img src="https://c.ndtvimg.com/2018-09/d89bk5cg_iphone-xs,-iphone-xs-max_640x480_13_September_18.jpg?downsize=400:300&output-quality=80" alt=""></figure>
			<figure><img src="https://www.iphonefaq.org/files/styles/large/public/iphone_xs.jpg" width= "150px" height= "120px" alt=""></figure>
			<figure><img src="https://m.media-amazon.com/images/I/61OvV27-44L._AC_SX450_.jpg" width= "186px" height= "110px"alt=""></figure>
			<figure><img src="img/painting.jpg" width= "180px" height= "130px"  alt=""></figure>
			<figure><img src="img/oneplus-6.jpg" width= "180px" height= "130px"alt=""></figure>
			<figure><img src="img/asus-rog.jpg" width= "180px" height= "130px" alt=""></figure>
			<figure><img src="img/t-shirt.jpg" width= "180px" height= "130px" alt=""></figure>
			<figure><img src="img/showpiece.jpg" width= "180px" height= "130px" alt=""></figure>
			<figure><img src="img/samsung-s9.jpg" width= "180px" height= "130px" alt=""></figure>
		</div>
	</div>
	
	

	
	<div class="tiazon-content">
 	<div class="container">
 		<div class="row">
 				<div class="col-md-4"><!-- left -->
 						<div class="list-group"><!-- products -->
						  <a href="Controller?page=all-products" class="list-group-item" style="background:  #d6d4d3;">
						    All Products
						  </a>
						  <a href="Controller?page=mobiles" class="list-group-item">Mobiles</a>
						  <a href="Controller?page=laptops" class="list-group-item">Laptops</a>
						  <a href="Controller?page=clothing" class="list-group-item">Clothing</a>
						  <a href="Controller?page=home-decor" class="list-group-item">Home Decor</a>
						</div> 
 				</div><!-- left -->

 				<div class="col-md-8"><!-- right -->
 					<h2 style="text-align: center;">Featured Products</h2><br>
 					
					<h5>Sort by(Price):</h5>
					<form action="Controller" method="get" style="border: none;margin:0px;padding: 0px;margin-bottom: 20px;">
					<input type="hidden" name="page" value="price-sort">
					<input type="hidden" name="action" value="index">
					<select name="sort">
					<option value="low-to-high">Low to high</option>
					<option value="high-to-high">high to low</option>
					</select>
					<input type="submit" value="Go!">
					</form>
					
 					<c:forEach items="${list }" var="product">
 						
 						<c:if test="${product.getFeatured() == 'yes' }">
 							
		 					<div class="col-md-4">
		 						<img src="${product.getImage() }" class="img-responsive" ><br>
		 						<div class="text-center"><a style="color: black;"><c:out value="${product.getName() }"></c:out></a></div>	
		 						<p style="text-align: center;"> &#x20b9;  <c:out value="${ product.getPrice() }"></c:out></p>
		 						<div class="text-center">  <a class="btn btn-primary" href="Controller?page=addtocart&action=index&id=<c:out value="${product.getId()}"/>">Add to Cart</a> </div><br>
		 					</div>
 							
 						</c:if>
 						
 						
 					</c:forEach>
 					
 				</div>
 			</div>
 		</div>
 	</div>
	
	
	<!-- CHAT BAR BLOCK -->
    <div class="chat-bar-collapsible">
        <button id="chat-button" type="button" class="collapsible">Chat with us!
            <i id="chat-icon" style="color: #fff;" class="fa fa-fw fa-comments-o"></i>
        </button>

        <div class="content">
            <div class="full-chat-block">
                <!-- Message Container -->
                <div class="outer-container">
                    <div class="chat-container">
                        <!-- Messages -->
                        <div id="chatbox">
                            <h5 id="chat-timestamp"></h5>
                            <p id="botStarterMessage" class="botText"><span>Loading...</span></p>
                        </div>

                        <!-- User input box -->
                        <div class="chat-bar-input-block">
                            <div id="userInput">
                                <input id="textInput" class="input-box" type="text" name="msg"
                                    placeholder="Tap 'Enter' to send a message">
                                <p></p>
                            </div>

                            <div class="chat-bar-icons">
                                <i id="chat-icon" style="color: crimson;" class="fa fa-fw fa-heart"
                                    onclick="heartButton()"></i>
                                <i id="chat-icon" style="color: #333;" class="fa fa-fw fa-send"
                                    onclick="sendButton()"></i>
                            </div>
                        </div>

                        <div id="chat-bar-bottom">
                            <p></p>
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </div>
	
	
	
	
	
	
	
	<footer>
		<div class="footer"> &copy; 2018 Copyright:
	      <a href="Controller?page=index"> Jumpstart.com</a>
	    </div>
	</footer>
	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="scripts/responses.js"></script>
<script src="scripts/chat.js"></script>



</html>