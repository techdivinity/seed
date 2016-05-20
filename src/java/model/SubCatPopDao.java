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
public class SubCatPopDao 
{
    public ArrayList<String> gatOption(String catID) throws NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, SQLException
 {
    
    ArrayList<String> subcatsInfo=new ArrayList<String>();
    
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
     try
     {
        
        con = DBConnection.createConnection();
        statement = con.createStatement(); 
        resultSet = statement.executeQuery("select * from subcategory where catID='"+catID+"'");
         while(resultSet.next()) 
         {
           subcatsInfo.add(resultSet.getString("subCatID"));
           subcatsInfo.add(resultSet.getString("name"));
         }
        
        statement.close();resultSet.close();con.close();
        return subcatsInfo; 
     }
     catch(SQLException e)
     {
        try{ con.close();}catch(Exception e1){}
        return null;
//        return "ERROR";
     }
     
     
 }
    
}
