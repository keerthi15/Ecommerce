<%-- 
    Document   : grocerieslist
    Created on : 25 Nov, 2017, 12:15:58 PM
    Author     : welcome
--%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="com.ecommerce.jsp.*" %>
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
        <title>HOME APPLIANCES LIST</title>
          <style>

            table{
                background:lavenderblush;
                border-color: lavenderblush;
                text-align: center;
            }
            table tr td{
               padding: 5px;
            }
             a{
                     color: black;
                 }
                 a:link {
                    color: blueviolet;
                   }
                   a:visited{
                       color: blueviolet;
                   }
                   a:hover {
                        color: gray;
                    }
                    a:active {
                        color: blue;
                    }
                    *{
                        font-family: "arial";
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
           
            .textbox{
                     padding: 5px;
                 }
        </style>
    </head>
    
<% 
Home g = new Home();
ResultSet rs = g.homeList();
int r = (Integer)session.getAttribute("type");
%>
             <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Online Shopping Website</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="itemcategories.jsp">Home</a></li>
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
      <%if(r==1){
           out.println("<li class=\"dropdown\">");
        out.println("<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Options");
        out.println("<span class=\"caret\"></span></a>");
        out.println("<ul class=\"dropdown-menu\">");
          out.println("<li><a href=\"insert.jsp\">Insert an item</a></li>");
          out.println("<li><a href=\"delete.jsp\">Delete item</a></li>");
          out.println("<li><a href=\"update.jsp\">Update item</a></li>");
         
        out.println("</ul>");
      out.println("</li>");
      
      }%>
    </ul><ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp">Logout</a></li>
          </ul>
  </div>
</nav>
                <center> 
        <h1>HOME APPLIANCES LIST</h1>
      
            <div class="container">
            <span style="float:left;width: 100%;">
                <table class="table table-bordered">
  
        <thead>
                <tr style="color: green;">
                    <th>ID</th>
                    <th>NAME</th>
                    <th>PRICE</th>
                    <th>COUNT</th>
                </tr>
            </thead>
   <tbody>
                <%if(r==0){while(rs.next()){
                %>
                <tr>
                    <td style="color:crimson;font-weight: bold;"><%=rs.getInt("itemid")%></td>
                    <td> <a href="addtocart.jsp?param1=<%=rs.getString("itemname")%>"><%=rs.getString("itemname")%></a></td>
                    <td><%=rs.getDouble("price")%></td>
                    <td><%=rs.getInt("count")%></td>
                    
                </tr>
               <%}}else if(r==1){%>
               <%while(rs.next()){%>
                <tr>
                    <td style="color:crimson;font-weight: bold;"><a href="update.jsp?param1=<%=rs.getInt("itemid")%>"> <%=rs.getInt("itemid")%></a></td>
                    <td><a href="delete.jsp?param1=<%=rs.getString("itemname")%>"><%=rs.getString("itemname")%></a></td>
                    <td><%=rs.getDouble("price")%></td>
                    <td><%=rs.getInt("count")%></td>
                    
                </tr>
               <%}}%>
            </tbody>
  </table>
        
            </span>
            </div>
            </center>
            <% 
session.setAttribute("category","homeappliances");
session.setAttribute("itemcolumn","itemname");
session.setAttribute("itemid","itemid");

            %>
           
   
</html>
