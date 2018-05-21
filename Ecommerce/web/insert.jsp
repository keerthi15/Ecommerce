<%-- 
    Document   : insert
    Created on : 4 Dec, 2017, 10:44:13 AM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
        
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
        <style>

            table{
                background: blanchedalmond;
                border-color:blanchedalmond;
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
    </style>
    </head>
    <%
        Connection conn=null;
        PreparedStatement st=null;
        ResultSet rs= null;
        try{
            String category=(String)session.getAttribute("category");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
            st=conn.prepareStatement("select itemid, itemname, optimalOrderQuantity from eoqvalues where category=?");
            st.setString(1,category);
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
        <h1>Items that can be added in <%=(String)session.getAttribute("category")%> list are:</h1>
        <center>
            <span style="float:left;width: 50%;">
        <table class="table-bordered" cellpadding="5px" border="1">
            <thead>
                <tr style="color: green;">
                    <th>ID</th>
                    <th>NAME</th>
                    <th>OPTIMAL COUNT</th>
                </tr>
            </thead>
            <tbody>
                <%while(rs.next()){%>
                <tr>
                    <td style="color:crimson;font-weight: bold;"><%=rs.getInt("itemid")%></td>
                    <td> <%=rs.getString("itemname")%></a></td>
                    <td><%=rs.getInt("optimalOrderQuantity")%></td>  
                </tr>
               <%}%>
            </tbody>
        </table>
            </span>
            </center>
     <span style="float:right;width: 50%;"> 
        <h1>Insert item details</h1>
        
        <form id="formid" name="insertform1" action="insertitem.jsp" method="POST">
            
            <table border="0">
                <tbody>
                    <tr>
                        <td>Enter the item name:</td>
                        <td style="padding-left:15px;"><input class="textbox" type="text" name="name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Enter the item price:</td>
                        <td style="padding-left:15px;"><input class="textbox" type="text" name="price" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Enter the count:</td>
                        <td style="padding-left:15px;"><input class="textbox" type="text" name="count" value="" size="15" /></td>
                    </tr>
                </tbody>
            </table>
            <center><input id="button" type="submit" value="insert" name="insertbutton" /></center>

        </form>
     </span>
    </body>
</html>
