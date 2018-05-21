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
public class Signup {
    Connection conn=null;
PreparedStatement stm= null;
ResultSet rs = null;
public Signup(){
try{

conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull", "root","");
stm=conn.prepareStatement("insert into user(UserName,Password, Address,Admin) values (?,?,?,?)");
}catch(SQLException e)
{
e.printStackTrace();
}
}
public int setSignup(String uname, String pwd,String address,int r){

int result=0;
try{
stm.setString(1, uname);
stm.setString(2, pwd);
stm.setString(3,address);
stm.setInt(4,r);
result=stm.executeUpdate();
}catch(SQLException e)
{
e.printStackTrace();
}
return result;
}
}

