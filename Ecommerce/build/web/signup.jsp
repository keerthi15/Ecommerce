<%-- 
    Document   : index
    Created on : 24 Nov, 2017, 6:37:51 PM
    Author     : welcome
--%>
<%@page import="java.sql.*"%>
<%@page import="java.net.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.util.*" %>
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
        <title>Sign up page</title>
        <style>
  h1{
                color: crimson;
                font-size: 32px;
              }
            body{
                align-content: center;
                font-family: "Arial";
              }
              #button{
                  background-color: rgb(22,194,44);
                  color:whitesmoke;
                  font-size: 14px;
                  padding: 10px;
                  font-weight: bold;
                  
              }
               #formid{
               
                position: relative;
                z-index: 1;
                background: #FFFFFF;
                max-width: 700px;
                margin: 0 auto 100px;
                padding: 45px;
                text-align:justify;
                border-style: outset;
                line-height: 40px;
                 }
                 .login-page {
                width: 360px;
                padding: 4% 0 0;
                margin: auto;
                    }
                    #tblid{
                         margin-top: 50px;
    margin-bottom: 50px;
    margin-right: 150px;
    margin-left: 80px;
    text-align:justify;
                    }
    </style>
    </head>
    <body>
          <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Online Shopping Website</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Home</a></li>
      <li><a href="login.jsp">Login</a></li>
      
          </ul>
  </div>
</nav>
    <center>
        <h1>SIGN UP FORM</h1>
        
     
        <form id="formid" name="mysignup" action="signupcategories.jsp" method="POST">
            <table border="0">
                
               
                <tbody>
                    <tr>
                       <div class="form-group">
      <label for="inputsm">Username:</label>
      <input class="form-control input-sm" name="uname" type="text">
    </div>
                    </tr>
                    <tr>
                       <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" name="pwd">
  </div>
                    </tr>
                    <tr>
                         <div class="form-group">
    <label for="pwd">Address:</label>
    <input type="password" class="form-control" name="address"size="70">
  </div>
                       
                    </tr>
                    <tr> 
                        <div class="form-group">
  <label for="sel1">Role:</label>
  <select class="form-control" id="sel1" name="user/admin">
     <option value="0">User</option>
                                    <option value="1">Admin</option>
                                    <option value="2">Inventory Manager</option>
  </select>
</div>
                    </tr>
                    
                </tbody>
            </table>
            <center>
                <button type="submit" class="btn btn-success">Submit</button>
                <button type="submit" class="btn btn-primary">Clear</button>
                
             </center>
            
        </form>
        </center>
    </body>
   
</html>
