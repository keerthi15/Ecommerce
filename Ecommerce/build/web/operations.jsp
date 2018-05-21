<%-- 
    Document   : operations
    Created on : 15 Jan, 2018, 11:57:18 PM
    Author     : welcome
--%>
<%@page import="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
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
        <title>JSP Page</title>
        <style>
            table{
                background:lavenderblush;
                border-color:lavenderblush;
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
                        color:gray;
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
        Connection conn=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        try{
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
            st=conn.prepareStatement("select * from eoqvalues order by category asc");
            rs=st.executeQuery();
           
        }catch(SQLException e){
            e.printStackTrace();
        }
    %>
    <body>
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
          <li><a href="additem.jsp">Add new item</a></li>
          <li><a href="deletion.jsp">Delete an Item</a></li>
          <li><a href="updation.jsp">Update an Item</a></li>
         
        
        </ul>
      </li>
    </ul><ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp">Logout</a></li>
          </ul>
  </div>
</nav>
        <h1>Available items are:</h1>
        <table class="table-bordered">
            <thead>
            <th> ITEM ID</th>
            <th>Item Name</th>
            <th>Demand</th>
            <th>Holding Cost Percentage(in %)</th>
            <th>Setup Cost</th>
            <th>Optimal Quantity</th>
            <th>Category</th>
            
            </thead>
            <tbody>
                <% while(rs.next()){
                   %> 
                   <tr>
                       <td> <a href="updation.jsp?param1=<%=rs.getInt("itemid")%>"><%=rs.getInt("itemid")%></a></td>
                       <td> <a href="deletion.jsp?param1=<%=rs.getString("itemname")%>"><%=rs.getString("itemname")%></a></td>
                       <td><%=rs.getInt("demand")%></td>
                       <td><%=rs.getDouble("holdingCostPercentage")%></td>
                       <td><%=rs.getDouble("setupCost")%></td>
                       <td><%=rs.getInt("optimalOrderQuantity")%></td>
                       <td><%=rs.getString("category")%></td>
                   </tr>
                   <%}%>
            </tbody>
        </table>
        
        <table
    </body>
</html>
