<%-- 
    Document   : categories
    Created on : 24 Nov, 2017, 8:00:53 PM
    Author     : welcome
--%>
<%@page import="java.sql.*"%>
<%@page import="com.ecommerce.jsp.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up Page</title>
    </head>
    <body>
        
        
        <%
     String name=null,pass=null,add=null,choice=null;
int result=0,r=0;
if((request.getParameter("uname")!=null)&&(request.getParameter("pwd")!=null)&&(request.getParameter("address")!=null)&&(request.getParameter("user/admin"))!=null){
   name= request.getParameter("uname");
   pass = request.getParameter("pwd");
   add= request.getParameter("address");
   r=Integer.parseInt(request.getParameter("user/admin"));
   Signup s = new Signup();
result=s.setSignup(name,pass,add,r);
}
if(result==0){%>
<script language="javascript">
    alert("signup failed");
    </script>
   
    
            
<% response.sendRedirect("signup.jsp");}
else
{%>
<script language="javascript">
    alert("signed up successfully!!");
    </script>
    <%
    session.setAttribute("type",r);
    session.setAttribute("username",name);
   response.sendRedirect("itemcategories.jsp");
    double now= 0.00;
    session.setAttribute("total",now);}
 %>
    

 
    </body>
    
  
</html>
