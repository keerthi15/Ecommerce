<%-- 
    Document   : deletecart
    Created on : 12 Jan, 2018, 9:15:48 PM
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
        <title>deletefromcart Page</title>
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
    <%
        Connection conn=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        ResultSet rq=null;
        double tot=(Double)session.getAttribute("total");
        int choice=Integer.parseInt(request.getParameter("itemid"));
        int remove=Integer.parseInt(request.getParameter("count"));
        int uid=(Integer)session.getAttribute("UserID");
         String result="";
            double rate=0.00, total_rate=0.00;
            int count=0,edit=0;
        try{
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
                    st=conn.prepareStatement("Select * from addtocart where id="+ choice);
                    rq =st.executeQuery();
                    while(rq.next())
                    {
                        result = rq.getString("name");
                        rate = rq.getDouble("price");
                        count= rq.getInt("quantity");
                        total_rate= rq.getDouble("total");
                    }
                    edit=count-remove;
                     if(edit<=0){
                        st=conn.prepareStatement("delete from addtocart where id=?");
                        st.setInt(1,choice);
                        st.executeUpdate();
                        tot=tot-total_rate;
                        st=conn.prepareStatement("insert into cancel(UserID,name,price) values (?,?,?)");
                        st.setInt(1,uid);
                        st.setString(2,result);
                        st.setDouble(3,rate);
                        st.executeUpdate();
                     }
                     else if(edit>0){
                          st=conn.prepareStatement("Select * from addtocart where id="+ choice);
                    rq =st.executeQuery();
                    while(rq.next())
                    {
                        
                        result = rq.getString("name");
                        rate = rq.getDouble("price");
                        count= rq.getInt("quantity");
                        total_rate= rq.getDouble("total");
                         st= conn.prepareStatement("update addtocart set quantity=? , total=? where id=?");
                         st.setInt(1,(count-remove));
                         st.setDouble(2,((count-remove)*rate));
                         st.setInt(3,choice);
                         st.executeUpdate();
                    }
                        
                         tot=tot-(remove*rate);
                         st=conn.prepareStatement("select * from grocery where itemname=?");
                         st.setString(1,result);
                         rs=st.executeQuery();
                         while(rs.next())
                         {
                             int itemid = rs.getInt("itemid");
                             String itemname = rs.getString("itemname");
                             int itemcount = rs.getInt("count");
                             double itemprice = rs.getDouble("price");
                             st=conn.prepareStatement("update grocery set count=? where itemname=?");
                             st.setInt(1,(itemcount+remove));
                             st.setString(2,itemname);
                             st.executeUpdate();
                         }
                     }
                    
                   session.setAttribute("total",tot);  
                   
                   st=conn.prepareStatement("select * from addtocart");
                   rq=st.executeQuery();
                   
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
        <h1>Cart list</h1>
        </center>
         <span style="float:left;width: 70%;">
        <table border="1">
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
                    <td><%=rq.getString("name")%></td>
                    <td><%=rq.getDouble("price")%></td>
                    <td><%=rq.getInt("quantity")%></td>
                    <td><%=rq.getDouble("total")%></td>
                    
                </tr>
               <%}%>
              
            </tbody>
        </table><br/><br/><%double curtot=(Double)session.getAttribute("total"); out.println("total is: Rs."+curtot);%>
         </span>
                
            </center>
            <div class="formid" style="float:right;">
                click on the item name to delete from cart
        <h3>Categories are:</h3>
       
        <ol type="1">
            
            
            <li><a href="bill.jsp">View Current Bill status</a>
        </ol>
    </div>
    </body>
</html>
