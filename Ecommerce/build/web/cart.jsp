<%-- 
    Document   : cart
    Created on : 11 Dec, 2017, 10:28:54 AM
    Author     : welcome
--%>
<%@page import="com.ecommerce.jsp.*"%>
<%@page import="java.sql.*"%>
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
        <title>add to cart Page</title>
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
                
                 }
           
            .textbox{
                     padding: 5px;
                 }
        </style>
    </head>
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
       
     
    <%   
        double price=0.00;
        String itemname="";
        int c=0;
        ResultSet rs=null;
        String cat= (String)session.getAttribute("category");
        String itemcolumn = (String)session.getAttribute("itemcolumn");
        String name=request.getParameter("itemname");
        int no= Integer.parseInt(request.getParameter("count"));
        Cart i = new Cart(cat,itemcolumn);
         ResultSet rq =i.itemvalues(name);
         try{
         while(rq.next()){
             itemname=rq.getString("itemname");
            price=rq.getDouble("price");
            c=rq.getInt("count");
         }
        if(c-no<0){
            out.println("<h2>cannot add item to cart-LESS STOCK AVAILABLE!</h2>");
            rq=i.displaycart();
        }
        else{
             int res=i.insertintocart(itemname,price,c,no);
        double total=no*price;
        double current=(Double)session.getAttribute("total");
        current=current+total;
        session.setAttribute("total", current);
        rq=i.displaycart();
           
        }
         
        }catch(SQLException e){
             e.printStackTrace();
         }
    %>
    
    <center><h1>CART LIST</h1></center> 
         <center>
        <span style="float:left;width: 70%;">
       <table class="table table-bordered">
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
                <%while(rq.next()){%>
                <tr>
                    <td style="color:crimson;font-weight: bold;">
                        <a href="deletefromcart.jsp?param1=<%=rq.getInt("id")%>"> <%=rq.getInt("id")%></a></td>
             <td> <%=rq.getString("name")%></td>
                    <td><%=rq.getDouble("price")%></td>
                    <td><%=rq.getInt("quantity")%></td>
                    <td><%=rq.getDouble("total")%></td>
                    
                </tr>
               <%}%>
              
            </tbody>
        </table><br/><br/><%double curtot=(Double)session.getAttribute("total"); out.println("total is: Rs."+curtot);%></span>
                
            </center>
            <div class="formid" style="float:right;">
        <h3>Categories are:</h3>
       click on the item name to delete from cart
        <ol type="1">
           
    
            <li><a href="bill.jsp">View Current Bill status</a>
        </ol>
    </div>
            
            
                
</html>
