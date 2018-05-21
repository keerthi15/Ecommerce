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

public class Cart {
    Connection conn=null;
PreparedStatement stm=null;
ResultSet rs= null;
String cat="", columname="";

public Cart(String category, String itemcolumn){
try{
cat=category;
columname=itemcolumn;
conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/online shopping?zeroDateTimeBehavior=convertToNull","root","");
stm=conn.prepareStatement("Select * from "+category+" where "+itemcolumn+"=?");
}catch(SQLException e){
e.printStackTrace();
}
}
public ResultSet itemvalues(String n){

int q=0;
try{
stm.setString(1,n);
rs = stm.executeQuery();
}catch(SQLException e)
{
e.printStackTrace();
}
return rs;
}
public int insertintocart(String n,double p,int count,int need ){
double tot=p*need;
int result=0;
if(count-need>=0){
try{

stm=conn.prepareStatement("insert into addtocart(name, price, quantity, total) values(?,?,?,?) ");
stm.setString(1,n);
stm.setDouble(2,p);
stm.setInt(3,need);
stm.setDouble(4,tot);
result= stm.executeUpdate();
}catch(SQLException e){
e.printStackTrace();
}
if(result==1){
try{
stm=conn.prepareStatement("UPDATE "+cat+" SET count = ? WHERE itemname=?");
                    stm.setInt(1,(count-need));
                    stm.setString(2,n);
                    result= stm.executeUpdate();
}catch(SQLException e){
e.printStackTrace();
}
}
}

return result;
}
public ResultSet displaycart(){
try{
stm=conn.prepareStatement("select * from addtocart");
rs=stm.executeQuery();
return rs;
}catch(SQLException e){
e.printStackTrace();
}
return rs;
}
    
}
