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
public class Update{
Connection conn=null;
PreparedStatement stm=null;
ResultSet rs= null;
public Update(String category, String itemcolumn, String itemid){
try{
conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
stm= conn.prepareStatement("update "+ category+" set "+itemcolumn+"=?, price=?, count=? where "+itemid+"=?");
}catch(SQLException e){
e.printStackTrace();
}
}
public int updateinlist(String n, double d, int c, int id){

int q=0;
try{

//stm.setString(1,category);
stm.setString(1, n);
stm.setDouble(2,d);
stm.setInt(3,c);
stm.setInt(4, id);
q = stm.executeUpdate();
}catch(SQLException e)
{
e.printStackTrace();
}
return q;
}
}
