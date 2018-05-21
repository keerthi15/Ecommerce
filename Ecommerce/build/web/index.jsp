<%-- 
    Document   : index
    Created on : 25 Nov, 2017, 1:36:41 PM
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
        <title>welcome Page</title>
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
      <li class="active"><a href="#">Home</a></li>
      <li><a href="login.jsp">Login</a></li>
      <li><a href="signup.jsp">Sign up</a></li>
          </ul>
  </div>
</nav>
  
      <center>  <h1>Welcome to Online Shopping Web site</h1>
    
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  

  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
     <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="furniture.jpg" alt="Furniture" style="width:600px; height: 400px;">
      <div class="carousel-caption">
        <h3>Furniture</h3>
        
      </div>
    </div>

    <div class="item">
      <img src="accessories.jpg" alt="Accessories" style="width:600px; height: 400px;">
      <div class="carousel-caption">
        <h3>Accessories</h3>
       
      </div>
    </div>

    <div class="item">
      <img src="grocery.jpg" alt="Groceries" style="width:600px; height: 400px;">
      <div class="carousel-caption">
        <h3>Groceries</h3>
        
      </div>
    </div>
       <div class="item">
      <img src="homeappliances.jpg" alt="Home Appliances" style="width:600px; height: 400px;">
      <div class="carousel-caption">
        <h3>Home Appliances</h3>
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
   </div>
    </center>
    </body>
</html>
