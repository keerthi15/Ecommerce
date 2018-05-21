<%-- 
    Document   : categories
    Created on : 25 Nov, 2017, 9:01:29 PM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>category page</title>
    </head>
    <body>
        <jsp:declaration>
            String r="",t="";
            int u,tr;
        </jsp:declaration>
        <%
            if((request.getParameter("l/s")!=null)){
            tr=Integer.parseInt(request.getParameter("l/s"));
            
            if((tr==0)){
                     response.sendRedirect("http://localhost:8080/InsertData/login.jsp");
                     %><p> login page </p><%
     
                 }     else if((tr==1))
            {            
                response.sendRedirect("http://localhost:8080/InsertData/signup.jsp");
                     %><p> signup page </p><%                 
            }
                
            }%>
        
        
        
       
        
        
    </body>
</html>
