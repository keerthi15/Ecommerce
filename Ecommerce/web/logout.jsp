<%-- 
    Document   : logout
    Created on : 14 Dec, 2017, 12:54:19 PM
    Author     : welcome
--%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             Connection conn=null;
    PreparedStatement stm= null;
    ResultSet rs= null;
    try{
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull", "root","");
        
         stm=conn.prepareStatement("truncate table addtocart");
                    stm.executeUpdate();
                    
    }catch(SQLException e){
        e.printStackTrace();
    }
    response.sendRedirect("index.jsp");
        %>
        <h1>Hello World!</h1>
    </body>
</html>
