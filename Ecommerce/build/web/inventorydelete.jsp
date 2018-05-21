<%-- 
    Document   : inventorydelete
    Created on : 16 Jan, 2018, 11:13:32 AM
    Author     : welcome
--%>
<%@page import="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% Connection conn=null;
    PreparedStatement st=null;
    ResultSet rs=null;
    if(request.getParameter("itemname")!=null){
        try{
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
            st=conn.prepareStatement("delete from eoqvalues where itemname=?");
            st.setString(1,request.getParameter("itemname"));
            int ch =st.executeUpdate();
            response.sendRedirect("operations.jsp");
                    
        }catch(SQLException e){
            e.printStackTrace();
            
        }
    }
   %>
    <body>
        
    </body>
</html>
