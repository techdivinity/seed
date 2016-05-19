/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.DBConnection;
import com.MD5;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;

/**
 *
 * @author divinity
 */
public class AddSubCatDao {
 
 public String addSubCat(AddSubCatBean bean) throws NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, SQLException
 {
     String catID=bean.getCatID();
     String subCatName=bean.getSubCatName();
     
     Connection con = null;
     Statement statement = null;
     try
     {
        con = DBConnection.createConnection();
        String sql="insert into subcategory(catID, name)values('"+catID+"','"+subCatName+"')";
        statement = con.createStatement(); 
        statement.executeUpdate(sql); 
        
        statement.close();con.close();
        return "SUCCESS"; 
     }
     catch(SQLException e)
     {
         con.close();
        //return String.valueOf(e);
        return "ERROR";
     }
     
 }
    
}
