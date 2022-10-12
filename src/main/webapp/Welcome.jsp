
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@page import="com.app.DbCon"%>
<%@page import="com.app.dao.ProductDao"%>
<%@page import="com.app.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
	//bg-image
}
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Dream Cake</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<style>
  .head-text {
    color: rgb(67, 202, 232);
    font-family: Lobster;
    font-size: 200px;
  }
  .subhead-text{
    color: rgb(67, 202, 232);
    font-family: Lobster;
    font-size: 70px;}
</style>

      <link rel="stylesheet" href="CSS/style.css">
  
  
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>

<script src='https://cdn.rawgit.com/Siddharth11/gradStop.js/master/gradstop.js'></script>

  

    <script  src="CSS/index.js"></script>


<div class="background"></div>
 

<div class="jumbotron">
  <div class="container text-center">
    <div class="head-text">Cake</div>      
    <div class="subhead-text">eat fresh.</div>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="log-out"><h4><span class="glyphicon glyphicon-user"></span> Log Out</h4></a></li> 
        <li><a href="cart.jsp"><h4><span class="glyphicon glyphicon-shopping-cart"></span> Cart<span class="badge badge-danger">${cart_list.size()}</span></h4></span></a></li>
      </ul>
    </div>
  </div>
</nav> 


<div class="container-fuid">    
<div class="row">
        <%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
		 <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"><%=p.getCategory() %></div>
        <div class="panel-body"><img src="product-image/<%=p.getImage() %>" class="img-responsive" style="height:195px; width:100%" ></div>
        <div class="panel-footer">LKR <%=p.getPrice() %></div>
       <a href="add-to-cart?id=<%=p.getId()%>"><button class="button" style="vertical-align:middle" id="1" ><span>Add to cart </span></button></a>
       
      </div>
    </div>
		
		<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>	
			
	</div>
	</div>		

		

<footer class="container-fluid text-center">
  <p>Designed and Developed by Dream Cakes</p>  
  
</footer>
</body>
</html>
