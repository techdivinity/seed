/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author admin
 */
public class CustomeListDao {
    
   public ArrayList<String[]> getCustInfo() throws NamingException {
        ArrayList<String[]> customerlist = new ArrayList<String[]>();
        Connection con = null;
        Statement stmt1 = null;
        ResultSet rs1 = null;
        
        
          try
         {
            con = DBConnection.createConnection();
            stmt1 = con.createStatement(); 
            rs1 = stmt1.executeQuery("select * from addcust"); 
            String[] info;
            while(rs1.next()) 
             {   
                 info=new String[8];
                 info[0]=rs1.getString(2);
                 info[1]=rs1.getString(3);
                 info[2]=rs1.getString(4);
                 info[3]=rs1.getString(5);
                 info[4]=rs1.getString(6);
                 info[5]=rs1.getString(7);
                 info[6]=rs1.getString(8);
                 info[7]=rs1.getString(9);
                 customerlist.add(info);
                 
             }
            stmt1.close();
            rs1.close();
            con.close();
            
         }
          catch(Exception e)
         {
            try{
             //con.close();
            }
            catch(Exception e1){}
//            return String.valueOf(e);
         }
         return customerlist;
        
    }
   
}
