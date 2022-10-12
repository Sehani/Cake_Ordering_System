
<%@page import="com.app.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("Welcome.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>

 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link href="CSS/index_bg.css" type="text/css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Dream Cake</title>
</head>
<body class="bg">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4 col-sm-4 col-xs-12"></div>
		<div class="col-md-4 col-sm-4 col-xs-12">
	<form action="user-login" method="post" class="form-container">
			<h1 class="header"> Login for Dream Cakes!</h1>
  			<div class="form-group">
    			<label for="InputEmail">Email address</label>
    				<input type="email" name="login-email" class="form-control" placeholder="Email" required>
  			</div>
  			<div class="form-group">
    			<label for="InputPassword">Password</label>
    				<input type="password" name="login-password" class="form-control"  placeholder="Password" required>
  			</div>
  			 
  			<div class="checkbox">
    			<label>
     				<input type="checkbox"> Remember Me
    			</label>
  			</div>
  			<button type="submit" class="btn btn-success btn-block">Submit</button>
			<div align="JUSTIFY">New user?<a class="register" href="Register.jsp"><b> <i>Register here</i></b></a></div> 
	</form>
		</div>
		<div class="col-md-4 col-sm-4 col-xs-12"></div>
	</div>
</div>
</body>
</html>