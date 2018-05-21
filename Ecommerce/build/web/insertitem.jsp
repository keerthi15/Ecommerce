<%-- 
    Document   : insertitem
    Created on : 8 Dec, 2017, 2:56:40 PM
    Author     : welcome
--%>
<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException,com.ecommerce.jsp.*"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>insert item Page</title>
    </head>
    
    <%
         Connection con=null;
           PreparedStatement stm=null;
           ResultSet r=null;
           int uid=(Integer)session.getAttribute("UserID");
           String name=(String)session.getAttribute("username");
           String itemname="";
           double price=0.00;
           int count=0;
           int demand=0;
                   double hcp=0.00,sc=0.00;
          
        int y=1;
        String cat= (String)session.getAttribute("category");
        String itemcolumn = (String)session.getAttribute("itemcolumn");
        if((request.getParameter("name")!=null)&&(request.getParameter("price")!=null)&&(request.getParameter("count")!=null)){
        itemname =request.getParameter("name");
         price = Double.parseDouble(request.getParameter("price"));
         count = Integer.parseInt(request.getParameter("count"));
        Insert i = new Insert(cat,itemcolumn);
         y =i.insertinlist(itemname,price,count);
        }
        if(y==1){      
            
        
             try{
               con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
               stm=con.prepareStatement("insert into message (UserID,name,booked_date,itemname,count,current_price,total) value(?,?,CURDATE(),?,?,?,?)");
               stm.setInt(1, uid);
               stm.setString(2, name);
               stm.setString(3,itemname);
               stm.setInt(4,count);
               stm.setDouble(5,price);
               stm.setDouble(6,(count*price));
               stm.executeUpdate();
                stm=con.prepareStatement("Select * from eoqvalues where itemname=?");
                   stm.setString(1,itemname);
                   ResultSet rq = stm.executeQuery();
                   
    while(rq.next()){
        
        name = rq.getString("itemname");
        demand = rq.getInt("demand");
        demand=demand+Integer.parseInt(request.getParameter("count"));
        hcp = rq.getDouble("holdingCostPercentage");
        sc = rq.getDouble("setupCost");
        String category = rq.getString("category");
        price = Double.parseDouble(request.getParameter("price"));
    }   
             int ooq = (int)Math.sqrt((2*demand*sc)/(hcp*price));
            
             stm=con.prepareStatement("update eoqvalues set optimalOrderQuantity=? , demand=? where itemname=?");
         stm.setInt(1, ooq);
         stm.setInt(2, demand);
         stm.setString(3, name);
         int ch= stm.executeUpdate();
         if(ch==1){
             System.out.println("successful");
         }
         else{
             System.out.println("failed");
             
         }
          }catch(SQLException e){
               e.printStackTrace();
           }
        }

        if(cat=="grocery"){
        response.sendRedirect("grocerieslist.jsp");

        }
        if(cat=="furniture"){
        response.sendRedirect("furnlist.jsp");
        }
        if(cat=="homeappliances"){
        response.sendRedirect("homelist.jsp");
        }
        if(cat=="giftitems"){
        response.sendRedirect("accessorieslist.jsp");
        }
      %>
    <%--
        if(y==0)
        out.println("value not inserted");
        else if(y==1)
        {
            out.println("value inserted successfully");
        }
       --%>
    
    
</html>
