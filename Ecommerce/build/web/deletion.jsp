<%-- 
    Document   : deletion
    Created on : 16 Jan, 2018, 11:07:22 AM
    Author     : welcome
--%>

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
        <title>JSP Page</title>
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
                max-width: 360px;
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
      <li class="active"><a href="itemcategories.jsp">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="additem.jsp">Add new item</a></li>
          <li><a href="deletion.jsp">Delete an Item</a></li>
          <li><a href="updation.jsp">Update an Item</a></li>
        <li><a href=operations.jsp">View available items</a></li>
        </ul>
      </li>
    </ul><ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp">Logout</a></li>
          </ul>
  </div>
</nav>
        <h1>Delete an item</h1>
        
      <form id= "formid" name="cartform" action="inventorydelete.jsp" method="POST">
           <table class="table-bordered" border="0">
                <tbody>
                    <tr>
                        
                         <div class="form-group">
      <label for="inputsm"> Enter the item name: </label>
      <input class="form-control input-sm" name="itemname" type="text" value="<%=request.getParameter("param1")%>">
    </div>
                        
                    </tr>
                      
                </tbody>
            </table>
               <center>
                   <button type="submit" class="btn btn-success">DELETE</button>
                
                
             </center>
        </form>
    </body>
</html>
