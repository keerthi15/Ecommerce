<%-- 
    Document   : update item
    Created on : 10 Dec, 2017, 8:42:44 AM
    Author     : welcome
--%>
<%@page import="java.sql.*,com.ecommerce.jsp.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update Page</title>
    </head>
    
    <jsp:scriptlet>
        String cat= (String)session.getAttribute("category");
        String itemcolumn = (String)session.getAttribute("itemcolumn");
        String itemid =(String)session.getAttribute("itemid");
        int id=Integer.parseInt(request.getParameter("itemid"));
        String itemname =request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int count = Integer.parseInt(request.getParameter("count"));
        Update i = new Update(cat,itemcolumn,itemid);
        
        int y =i.updateinlist(itemname,price,count,id);
        if(y==1){</jsp:scriptlet>
        <script language="javascript">
            alert("Item updated successfully");
            </script>
        <%
        }
else if(y==0){%>
<script language="javascript">
    alert("Item cannot be updated");
    </script>
    <jsp:scriptlet>}
        
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
       </jsp:scriptlet>
    <%--
        if(y==0)
        out.println("value not inserted");
        else if(y==1)
        {
            out.println("value inserted successfully");
        }
       --%>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
