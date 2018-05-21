<%-- 
    Document   : bookhistory
    Created on : 13 Jan, 2018, 11:02:05 AM
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
    Connection conn= null;
    PreparedStatement st=null;
    ResultSet rs= null;
    int count=0;
    
    int uid=(Integer)session.getAttribute("UserID");
    int type=(Integer)session.getAttribute("type");
    if(type==0){
    try{
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
        st=conn.prepareStatement("select * from book where UserID=? order by booked_date desc ");
        st.setInt(1,uid);
        rs=st.executeQuery();
        
    }catch(SQLException e){
        e.printStackTrace();
    }
    }
    else if(type==1){
        int userid=0;
       try{
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
        st=conn.prepareStatement("select * from book order by booked_date desc ");
      
        rs=st.executeQuery();
        
    }catch(SQLException e){
        e.printStackTrace();
    } 
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
    <center>
        <h1>BOOKING HISTORY</h1>
        

              
            <div class="container">
            <span style="float:left;width: 50%;">
                <table class="table table-bordered">
    <thead>
      <tr>
        <thead>
                <tr style="color: green;">
                     <th>NAME</th>
                    <th>PRICE</th>
                    <th>BOOKED DATE</th>
                    <th>DELIVERY DATE</th>
                    <th>QUANTITY</th>
                    <th>TOTAL</th>
                </tr>
            </thead>
 <tbody>
                
        <%while(rs.next()){%>
        <tr>
                    
                        
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getDouble("price")%></td>
                    <td><%=rs.getDate("booked_date")%></td>
                    <td><%=rs.getDate("delivery_date")%></td>
                    <td><%=rs.getInt("quantity")%></td>
                    <td><%=rs.getDouble("total")%></td>
                    <%count++;%>
                    
                </tr>
        <%}%>
        </tbody>
  </table>
        
            </span>
            </div>
             
</center> 
       
    </body>
</html>
