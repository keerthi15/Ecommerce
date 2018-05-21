<%-- 
    Document   : update
    Created on : 10 Dec, 2017, 8:42:29 AM
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
        <title> update Page</title>
         <style>

            table{
                background: blanchedalmond;
                border-color:blanchedalmond;
                text-align: center;
            }
            table tr td{
               padding: 5px;
            }
             a{
                     color: black;
                 }
                 a:link {
                    color: red;
                   }
                 a:visited {
                    color: blueviolet;
                    }
                    a:hover {
                        color: hotpink;
                    }
                    a:active {
                        color: blue;
                    }
                    *{
                        font-family: "arial";
                    }
            h1{
                color: crimson;
                font-size:35px; 
                margin-left: auto;
                margin-top:20px;
            }
            
            .formid{
                
                position: relative;
                z-index: 1;
                background: #FFFFFF;
                max-width: 360px;
                margin: 0 auto 100px;
                padding: 45px;
                text-align:justify;
                border-style: outset;
                line-height: 40px;
                margin-top:75px;
                text-align:justify;
                align-self:center;
                 }
           
            .textbox{
                     padding: 5px;
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
          <li><a href="grocerieslist.jsp">Groceries And Provisions</a></li>
          <li><a href="furnlist.jsp">Furniture</a></li>
          <li><a href="homelist.jsp">Home Appliances</a></li>
          <li><a href="accessorieslist.jsp">Accessories</a></li>
        </ul>
      </li>
    </ul><ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp">Logout</a></li>
          </ul>
  </div>
</nav>
   
        <h1>Update</h1>
        <form id="formid" name="updateform" action="updateitem.jsp" method="POST">
            <table class="table-bordered" border="0">
                 <tr>
                        
                         <div class="form-group">
      <label for="inputsm"> Enter the id of the item to be updated: </label>
      <input class="form-control input-sm" name="itemid" type="text" value="<%=request.getParameter("param1")%>">
    </div>
                        
                    </tr>
                
                
                 <tr>
                        
                         <div class="form-group">
      <label for="inputsm"> Enter the item name: </label>
      <input class="form-control input-sm" name="name" type="text" value="">
    </div>
                        
                    </tr>
               
                     <tr>
                        
                         <div class="form-group">
      <label for="inputsm"> Enter the item price: </label>
      <input class="form-control input-sm" name="price" type="text" value="">
    </div>
                        
                    </tr>
                    
                     <tr>
                        
                         <div class="form-group">
      <label for="inputsm"> Enter the count: </label>
      <input class="form-control input-sm" name="count" type="text" value="">
    </div>
                        
                   
                </tbody>
            </table>
                 <center>
                   <button type="submit" class="btn btn-success">Update</button>
                
                
             </center>
            
            
        </form>
    
    </body>
</html>
