<%-- 
    Document   : messages
    Created on : 6 Jan, 2018, 1:47:36 PM
    Author     : welcome
--%>
<%@page import="java.sql.*"%>
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
PreparedStatement st = null;
ResultSet rs= null;
String admin_name="",date="",item="";
    int count=0;
    double price=0.00,total=0.00;
try{
        conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull", "root","");
    st=conn.prepareStatement("Select * from message ORDER BY booked_date DESC");
    rs=st.executeQuery();
    /*while(rs.next()){
        admin_name=rs.getString("name");
        date=rs.getString("booked_date");
        item= rs.getString("itemname");
        count= rs.getInt("count");
        price=rs.getDouble("current_price");
        total =rs.getDouble("total");
    }*/
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
        <li><a href="operations.jsp">View available items</a></li>
        </ul>
      </li>
    </ul><ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp">Logout</a></li>
          </ul>
  </div>
</nav>
    <center> 
        <h1>Order list</h1>
        
        <table border="1px" class="table-bordered">
            <th>
                ADMIN NAME
            </th>
            <th>ITEM NAME</th>
            <th>COUNT</th>
            <th>PRICE</th>
            <th>TOTAL</th>
            <th>BOOKED DATE</th>
            <tr>
                <%try{
                    while(rs.next()){%>
                <tr>
                    <td style="color:crimson;font-weight: bold;"><%=rs.getString("name")%></td>
                    <td><%=rs.getString("itemname")%></a></td>
                    <td><%=rs.getInt("count")%></td>
                    <td><%=rs.getDouble("current_price")%></td>
                    <td><%=rs.getDouble("total")%></td>
                    <td><%=rs.getString("booked_date")%></td>
                </tr>
               <%}}catch(SQLException e){
e.printStackTrace();

}%>
            </tr>
        </table>
            </center>
    </body>
</html>
