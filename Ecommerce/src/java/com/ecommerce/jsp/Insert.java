/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ecommerce.jsp;

/**
 *
 * @author welcome
 */
import java.sql.*;
       public class Insert{
Connection conn=null;
PreparedStatement stm=null;
ResultSet rs= null;
public Insert(String category, String itemcolumn){


try{
conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
stm= conn.prepareStatement("insert into "+ category+"(itemname,price,count) values(?,?,?)");
}catch(SQLException e1){
e1.printStackTrace();
}
}
public int insertinlist(String n, double d, int c){

int q=0;
try{

//stm.setString(1,category);
stm.setString(1, n);
stm.setDouble(2,d);
stm.setInt(3,c);
q = stm.executeUpdate();
}catch(SQLException e)
{
e.printStackTrace();
}
return q;
}
}