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
public class Accessories {
    Connection conn=null;
PreparedStatement stm=null;
ResultSet rs= null;
public Accessories(){
try{
conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
stm= conn.prepareStatement("Select * from giftitems");

}catch(SQLException e){
e.printStackTrace();
}
}
public ResultSet accessoriesList(){
try{
rs= stm.executeQuery();
}catch(SQLException e){
e.printStackTrace();
}
return rs;
}
    
}
