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
import javax.naming.NamingException;

/**
 *
 * @author divinity
 */
public class CatNSubCatDao 
{
    public ArrayList<ArrayList<String>> getCatInfo() throws NamingException
    {
        ArrayList<ArrayList<String>> cats=new ArrayList<ArrayList<String>>();
        Connection con = null;
        Statement stmt1 = null;
        ResultSet rs1 = null;
        PreparedStatement stmt2=null;
        ResultSet rs2 = null;

        try
         {
            con = DBConnection.createConnection();
            stmt1 = con.createStatement(); 
            rs1 = stmt1.executeQuery("select * from category"); 

            while(rs1.next()) 
             {
              cats.add(new ArrayList<String>());
              cats.get(cats.size()-1).add(rs1.getString("name"));
             }
            stmt1.close();rs1.close();
            
            String sql2="SELECT name FROM subcategory WHERE catID in (select catID from category where name=?)";
            stmt2 = con.prepareStatement(sql2);
            for(int i=0;i<cats.size();i++)
            {           
               
                
                stmt2.setString(1,cats.get(i).get(0));
                rs2 = stmt2.executeQuery(); 
                while(rs2.next()) 
                {
                 cats.get(i).add(rs2.getString("name"));
                }
                stmt2.close();rs2.close();
            }
            
            
            
            con.close();
            
         }
         catch(SQLException e)
         {
            try{
             con.close();
            }catch(Exception e1){}
            
         }
        return cats;
    }
    
}
