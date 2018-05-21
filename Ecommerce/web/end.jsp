<%-- 
    Document   : end
    Created on : 13 Dec, 2017, 5:48:48 PM
    Author     : welcome
--%>
<%@page import="java.sql.*"%>
<%@page import="java.math.*"%>
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
        <title>END Page</title>
    </head>
    <%
        Connection conn=null;
    PreparedStatement stm= null;
    ResultSet rs= null;
    int identity=0;
     String address="";
    try{
       
        conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
        stm=conn.prepareStatement("select * from user where UserName=?");
    String uname= (String)session.getAttribute("username");
    stm.setString(1,uname);
    rs=stm.executeQuery();
   
    while(rs.next()){
        identity=rs.getInt("UserID");
        address=rs.getString("Address");
    }
    session.setAttribute("identity",identity);
        stm=conn.prepareStatement("Select * from addtocart");
                    rs=stm.executeQuery();
                   
                   while(rs.next()){
                      int id=rs.getInt("id");
                       String name = rs.getString("name");
                       double rate= rs.getDouble("price");
                       int quants= rs.getInt("quantity");
                       double total_rate=rs.getDouble("total");
                       
        stm=conn.prepareStatement("insert into book(UserID,name,price,booked_date,quantity,delivery_date,total) values (?,?,?,CURDATE(),?,(CURDATE() + INTERVAL 3 DAY),?)");
        identity= (Integer)session.getAttribute("identity");
                        stm.setInt(1,identity);
                        stm.setString(2,name);
                        stm.setDouble(3,rate);
                        stm.setInt(4, quants);
                        stm.setDouble(5,total_rate);
                        stm.executeUpdate();
                        
                        //comment starts
                        stm=conn.prepareStatement("Select * from eoqvalues where itemname=?");
                   stm.setString(1,name);
                   ResultSet rq = stm.executeQuery();
    while(rq.next()){
        id = rq.getInt("itemid");
        name = rq.getString("itemname");
        int demand = rq.getInt("demand");
        demand=demand+quants;
        double hcp = rq.getDouble("holdingCostPercentage");
        double sc = rq.getDouble("setupCost");
        String category = rq.getString("category");
         stm = conn.prepareStatement("Select * from "+category+" where itemname=?");
         stm.setString(1,name);
         ResultSet r= stm.executeQuery();
          while(r.next()){
             double price = r.getDouble("price");
             int ooq = (int)Math.sqrt((2*demand*sc)/(hcp*price));
            
             stm=conn.prepareStatement("update eoqvalues set optimalOrderQuantity=? , demand=? where itemname=?");
         stm.setInt(1, ooq);
         stm.setInt(2, demand);
         stm.setString(3, name);
         stm.executeUpdate();
         }
    }
//comment ends
         
                   }
                   
                   stm=conn.prepareStatement("truncate table addtocart");
                    stm.executeUpdate();
                   
                
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
        <h1>BOOKING CONFIRMED</h1>
        <H4>Your booking has been confirmed.<br/>
        Your order will be delivered in: 3 days! 
        to the address :
        <%out.println(address);%><br>
        DUE AMOUNT IS: <%double curtot=(Double)session.getAttribute("total"); out.println(" Rs."+curtot);%><br/>
        Please pay the amount on delivery.<br/>
        Thank you for Shopping with us<br/>
        <br><br>
        <% double now= 0.00;
             session.setAttribute("total",now);%>
        <a href="itemcategories.jsp">continue shopping?</a><br/><br/>
        
        </H4>
        <%--

    try{
        
        conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
        stm=conn.prepareStatement("select * from addtocart");
        rs=stm.executeQuery();
    }catch(SQLException e){
        e.printStackTrace();
    }
            --%>
            
        
    </body>
</html>