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
} %>

<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script  type = "text/javascript"> 
function creditCardValidation()
{  
var creditCradNum =  document.getElementById("creditCradNum").value;
var month =  document.getElementById("expityMonth").value;
var year =  document.getElementById("expityYear").value;
var code =  document.getElementById("cvCode").value;

//
    
//&& typeof creditCradNum == 'number'
//
   if(creditCradNum.length >8 && !isNaN(creditCradNum) && month <13 && year.length == 4 && !isNaN(code))
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
<title>Payment</title>
</head>
<body>
<div class="container">
    <div class="row">
   
        <div class="col-xs-12 col-md-4">
         <form action="order-now" method="GET"  onsubmit="return creditCardValidation()" >
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
                              <input type="text" class="form-control" id="creditCradNum" name="creditCradNum" placeholder="Valid Card Number"  required autofocus />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-7 col-md-7">
                            <div class="form-group">
                                <label for="expityMonth">
                                    EXPIRY DATE</label>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" min="2" max="2" class="form-control" id="expityMonth" placeholder="MM" required />
                                </div>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" min="4" max="4" id="expityYear" placeholder="YY" required /></div>
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
            <li class="active"><a href="#"><span class="badge pull-right"><%= request.getParameter("name") %></span> Name</a>
             <li class="active"><a href="#"><span class="badge pull-right"><%= request.getParameter("quantity") %></span> Quantity</a>
                <li class="active"><a href="#"><span class="badge pull-right"><span class="LKR"></span><%= request.getParameter("price") %></span> Final Payment</a>
                </li>
            </ul>
            <br/>
            <input type="hidden" name="id"   value="<%= request.getParameter("id") %>" > 
                       <input type="hidden" name="price"   value="<%= request.getParameter("price") %>" > 
            <input type="hidden" name="quantity"   value="<%= request.getParameter("quantity") %>" > 
            <input type="submit" class="btn btn-success btn-lg btn-block" onclick="return creditCardValidation();" value="Pay">
          
             </form>
        </div>
    </div>
</div>

</body>
</html>

     

