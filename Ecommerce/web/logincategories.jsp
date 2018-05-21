<%-- 
    Document   : usercategories
    Created on : 25 Nov, 2017, 12:39:45 PM
    Author     : welcome
--%>
<%@page import="java.sql.*" %>
<%@page import="com.ecommerce.jsp.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN PAGE</title>
    </head>

 <% 
     String name=null,pass=null,username="error!!!",add="";
int r=0;
if((request.getParameter("uname")!=null)&&(request.getParameter("pwd")!=null)){
   name= request.getParameter("uname");
   pass = request.getParameter("pwd");
   r=Integer.parseInt(request.getParameter("type"));
   Login s = new Login();
username=s.setLogin(name,pass,r);

}
if(username=="error!!!"){%>
       <script language="javascript">
    alert("wrong username and password or role");
    </script>
    

 <%           
 response.sendRedirect("login.jsp");   }
else
{
int uid=0;
try{
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
PreparedStatement stm=null;
stm=conn.prepareStatement("select * from user where UserName=?");
stm.setString(1,name);
ResultSet rq=stm.executeQuery();
while(rq.next()){
uid= rq.getInt("UserID");
}
}catch(SQLException e){
e.printStackTrace();
}

    session.setAttribute("UserID",uid);
session.setAttribute("type",r);
    session.setAttribute("username",name);
    response.sendRedirect("itemcategories.jsp");
    double now= 0.00;
    session.setAttribute("total",now);
}
    %>
    
 
</html>
