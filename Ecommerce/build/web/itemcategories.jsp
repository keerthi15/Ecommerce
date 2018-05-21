<%-- 
    Document   : itemcategories
    Created on : 13 Dec, 2017, 8:13:11 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>categories Page</title>
     <style>
 *{
                font-family:"Arial";
            }
            h1{
                color: crimson;
                font-size:35px; 
                margin-left: auto;
                margin-top:20px;
            }
            
            .formid{
                
                position: relative;
                z-index: 1;
                background: #FFFFFF;
                max-width: 360px;
                margin: 0 auto 100px;
                padding: 45px;
                text-align:justify;
                border-style: outset;
                line-height: 40px;
                margin-top:75px;
                text-align:justify;
                align-self:center;
                 }
    </style>
    </head>
    
<script language="javascript">
    alert("logged in successfully!!");
    </script>
    <body>
         <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Online Shopping Website</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="grocerieslist.jsp">Groceries And Provisions</a></li>
          <li><a href="furnlist.jsp">Furniture</a></li>
          <li><a href="homelist.jsp">Home Appliances</a></li>
          <li><a href="accessorieslist.jsp">Accessories</a></li>
        </ul>
      </li>
    </ul><ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp">Logout</a></li>
          </ul>
  </div>
</nav>
    </body>
    <%
        int type=(Integer)session.getAttribute("type");
        if(type==2){
             String name=(String)session.getAttribute("username");
    out.println("<h1>Welcome " + name + "</h1>");
     out.println("<div class=\"formid\">");
     out.println("<h1>Categories are:</h1>");
        out.println("<ol type=\"1\">");
            
            out.println("<li><a href=\"messages.jsp\">View current orders</a></li>");
            out.println("<li><a href=\"operations.jsp\">View current items available</a></li>");
    
        out.println("</ol>");
 out.println("</div>");
        }
        else{
        String name=(String)session.getAttribute("username");
    out.println("<h1>Welcome " + name + "</h1>");
     out.println("<div class=\"formid\">");
     out.println("<h1>Categories are:</h1>");
        out.println("<ol type=\"1\">");
            
            out.println("<li><a href=\"bookhistory.jsp\">Booking History</a></li>");
    
        out.println("</ol>");
 out.println("</div>");
        }
    %>
    
</html>
