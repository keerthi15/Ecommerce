<%-- 
    Document   : deleteitem
    Created on : 7 Jan, 2018, 5:43:54 PM
    Author     : welcome
--%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>delete item Page</title>
    </head>
    <% 
    Connection conn=null;
    PreparedStatement st=null;
    ResultSet rs=null;
    String itemname=request.getParameter("itemname");
    try{
      String category=(String)session.getAttribute("category");
      conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
      st=conn.prepareStatement("delete from "+category+" where itemname=?");
      st.setString(1,itemname);
      int y=st.executeUpdate();

    if(y==1){
    %>
        <script language="javascript">
            alert("Item deleted successfully");
            </script>
        <%
        }
    else if(y==0){%>
    <script language="javascript">
    alert("Item cannot be deleted");
    </script>
    <%}

    if(category=="grocery"){
        response.sendRedirect("grocerieslist.jsp");
    }
    else if(category=="furniture"){
        response.sendRedirect("furnlist.jsp");
        
    }
    else if(category=="homeappliances"){
        response.sendRedirect("homelist.jsp");
    }
    else if(category=="giftitems"){
        response.sendRedirect("accessorieslist.jsp");
    }

    }catch(SQLException e){
        e.printStackTrace();
    }
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
