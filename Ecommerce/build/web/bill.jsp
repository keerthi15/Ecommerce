<%-- 
    Document   : bill
    Created on : 13 Dec, 2017, 2:58:04 PM
    Author     : welcome
--%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Page</title>
          <style>

            table{
                background: lavenderblush;
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
                    color: red;
                   }
                 a:visited {
                    color: blueviolet;
                    }
                    a:hover {
                        color: hotpink;
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
    <% Connection conn=null;
    PreparedStatement st= null;
    ResultSet rs= null;
    try{
       conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
st=conn.prepareStatement("select * from addtocart");
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
        <h1>CURRENT BILL</h1>
        
        <span style="float:left;width: 70%;">
        <table border="2">
            <thead>
                <tr style="color: green;">
                    <th>ID</th>
                    <th>NAME</th>
                    <th>PRICE</th>
                    <th>COUNT</th>
                    <th>TOTAL</th>
                </tr>
            </thead>
            <tbody>
                <%while(rs.next()){%>
                <tr>
                    <td style="color:crimson;font-weight: bold;">
                        <%=rs.getInt("id")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getDouble("price")%></td>
                    <td><%=rs.getInt("quantity")%></td>
                    <td><%=rs.getDouble("total")%></td>
                    
                </tr>
               
               <%}%>
               
              
            </tbody>
        </table><br/>
        <%double curtot=(Double)session.getAttribute("total"); out.println("total is: Rs."+curtot);%></span>
        <a href="end.jsp"> confirm booking? </a><br/><br/>
        <a href="itemcategories.jsp">continue shopping?</a>
            </center>
    
    </body>
</html>
