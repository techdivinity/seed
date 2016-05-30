/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.IdCounter;
import beans.*;
import com.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author divinity
 */
public class InvoiceDao {
    public long addIncoice(InvoiceBean bean) throws SQLException
    {
        Connection con = null;
        Statement stmt1 = null;
        PreparedStatement stmt2=null;
        
        try
        {
            long invID=IdCounter.getInvoiceID();
            con = DBConnection.createConnection();con.setAutoCommit(false);
            String sql1="insert into invoice values("+invID+","+bean.getCustID()+","+bean.getTotalAmount()+","+bean.getDiscount()+","+bean.getVat()+","+bean.getFinalAmount()+",NOW())";
            stmt1 = con.createStatement(); 
            stmt1.executeUpdate(sql1); 
            stmt1.close();
            
            String sql2="insert into invoiceitems values(?,?,?,?,?)";
            
            for(int i=0;i<bean.getItemIds().length;i++)
            {   
                stmt2 = con.prepareStatement(sql2);
                stmt2.setString(1,String.valueOf(invID));
                stmt2.setString(2,bean.getItemIds()[i]);
                stmt2.setString(3,bean.getPrice()[i]);
                stmt2.setString(4,bean.getQnty()[i]);
                stmt2.setString(5,bean.getTotal()[i]);
                stmt2.executeUpdate();
                
                stmt2.close();
            }
            con.commit();
            con.close();
            return invID;
//                return String.valueOf(invID);   
        }
        catch(Exception e)
        {
           try{con.rollback();
            con.close();
           }catch(Exception e1){}
           return -5;
//            return String.valueOf(e);
        }
        
    }
    
}
