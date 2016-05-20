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
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;

/**
 *
 * @author admin
 */
public class AddCustDao {
       public String addCust(AddCustBean bean)throws NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, SQLException
       {
          // String custId =bean.getcustId();
           String FirstName=bean.getFirstName();
           String LastName=bean.getLastName();
           String phnumber=bean.getphnumber();
           String Address=bean.getAddress();
           String City=bean.getCity();
           String Email=bean.getEmail();
           String TINNO=bean.getTINNO();
           String CSTNO=bean.getCSTNO();
           
           Connection con=null;
           Statement stmt=null;
           
       try
         {
               con = DBConnection.createConnection();
                String sql="insert into addcust(FirstName,LastName,phnumber,Address,City,Email,TINNO,CSTNO)values('"+FirstName+"','"+LastName+"','"+phnumber+"','"+Address+"','"+City+"','"+Email+"','"+TINNO+"','"+CSTNO+"')";
                stmt = con.createStatement(); 
                  stmt.executeUpdate(sql); 
        
                stmt.close();con.close();
                return "SUCCESS"; 
         }
   catch(SQLException e)
        {
             con.close();
            return String.valueOf(e);
             //return "ERROR";
        }
           
           
  }
    
}
 