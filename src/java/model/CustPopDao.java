/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.DBConnection;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author divinity
 */
public class CustPopDao 
{
    public ArrayList<String> gatCustomer() throws NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, SQLException
 {
    
    ArrayList<String> custInfo=new ArrayList<String>();
    
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
     try
     {
        
        con = DBConnection.createConnection();
        statement = con.createStatement(); 
        resultSet = statement.executeQuery("select * from addcust");
         while(resultSet.next()) 
         {
           custInfo.add(resultSet.getString("custID"));
           custInfo.add(resultSet.getString("FirstName"));
         }
        
        statement.close();resultSet.close();con.close();
        return custInfo; 
     }
     catch(SQLException e)
     {
        try{ con.close();}catch(Exception e1){}
        return null;
//        return "ERROR";
     }
     
     
 }
    
}
