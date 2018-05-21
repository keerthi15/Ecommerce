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

public class Login {
    Connection conn=null;
PreparedStatement stm= null;
ResultSet rs = null;
public Login(){
try{

conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull", "root","");
stm=conn.prepareStatement("select * from user where UserName=? and Password=? and Admin=?");
}catch(SQLException e)
{
e.printStackTrace();
}
}
public String setLogin(String uname, String pwd,int u){
String username="";
int admin=0;
try{
stm.setString(1, uname);
stm.setString(2, pwd);
stm.setInt(3,u);
rs=stm.executeQuery();
if(rs.next())
{
username=rs.getString("Username");
admin = rs.getInt("Admin");
 conn.close();
}

else{
return "error!!!";
}

}catch(SQLException e)
{
e.printStackTrace();
}
return username;
}
}
