<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
    <%@page import="java.text.DecimalFormat"%>
    <%@page import="java.util.*"%>
  <%@page import="com.app.DbCon"%>
<%@page import="com.app.dao.ProductDao"%>
<%@page import="com.app.model.*"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
	
}
%>

<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<title>Payment</title>
<script  type = "text/javascript"> 
function creditCardValidation()
{  
var creditCradNum =  document.getElementById("cardNumber").value;
var month =  document.getElementById("expityMonth").value;
var year =  document.getElementById("expityYear").value;
var code =  document.getElementById("cvCode").value;

//
    
//&& typeof creditCradNum == 'number'
//
   if(creditCradNum.length >8 && !isNaN(creditCradNum) && month <13 && year.length == 4 && !isNaN(code) )
     {   
      return true;
     }
   else
     {
     alert("Please enter valid data ");
     
     return false;
     }
}    
</script> 
</head>
<body>
<div class="container">
    <div class="row">
 
        <div class="col-xs-12 col-md-4">
            <form action="cart-check-out" method="post">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Payment Details
                    </h3>
                    
                </div>
                <div class="panel-body">
                   
                    <div class="form-group">
                        <label for="cardNumber">
                            CARD NUMBER</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
                                required autofocus />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-7 col-md-7">
                            <div class="form-group">
                                <label for="expityMonth">
                                    EXPIRY DATE</label>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
                                </div>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-md-5 pull-right">
                            <div class="form-group">
                                <label for="cvCode">
                                    CV CODE</label>
                                <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
            <ul class="nav nav-pills nav-stacked">
            
                <li class="active"><a href="#"><span class="badge pull-right"><span class="glyphicon glyphicon-LKR"></span><%= request.getParameter("total") %></span> Final Payment</a>
                </li>
           
            </ul>
            <br/>
              <input type ="hidden" name="total" value="<%= request.getParameter("total") %>" class="form-input"/>
            <input type="submit" class="btn btn-success btn-lg btn-block" onclick="return creditCardValidation();" value="Pay">
             </form>
        </div>
    </div>
</div>

</body>
</html>

     



