<%-- 
    Document   : inventoryupdate
    Created on : 16 Jan, 2018, 11:34:29 AM
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
    if(request.getParameter("itemname")!=null&&request.getParameter("hcp")!=null&&request.getParameter("sc")!=null&&request.getParameter("category")!=null&&request.getParameter("demand")!=null&&request.getParameter("ooq")!=null)
    {
        try{
            
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
            st=conn.prepareStatement("update eoqvalues set itemname=?, demand=?, holdingCostPercentage=?, setupCost=?, optimalOrderQuantity=?, category=? where itemid=?");
            st.setString(1,request.getParameter("itemname"));
            st.setInt(2,Integer.parseInt(request.getParameter("demand")));
            st.setDouble(3,Double.parseDouble(request.getParameter("hcp")));
            st.setDouble(4,Double.parseDouble(request.getParameter("sc")));
            st.setInt(5, Integer.parseInt(request.getParameter("ooq")));
            st.setString(6,request.getParameter("category"));
            st.setInt(7,Integer.parseInt(request.getParameter("itemid")));
            int ch= st.executeUpdate();
            if(ch==1)
            {
                response.sendRedirect("operations.jsp");
                
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    else{
                response.sendRedirect("updation.jsp");
                
                }
    %>
    <body>
        
        <h1>Hello World!</h1>
    </body>
</html>
