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
public class InvoiceListDao 
{
    public ArrayList<String[]> getInvoices() throws NamingException, SQLException
    {
        ArrayList<String[]> invoices=new ArrayList<String[]>();
        Connection con = null;
        Statement stmt1 = null;
        ResultSet rs1 = null;
        PreparedStatement stmt2=null;
        ResultSet rs2 = null;
        
        try
         {
             String[] arr;
         
            con = DBConnection.createConnection();con.setAutoCommit(false);
            stmt1 = con.createStatement(); 
            rs1 = stmt1.executeQuery("SELECT * FROM invoice, addcust WHERE invoice.custID = addcust.custID ORDER BY `invoice`.`invoiceID` ASC"); 

            while(rs1.next()) 
             {
                 arr=new String[4];
              arr[0]=String.format("%06d", Long.parseLong(rs1.getString("invoiceID")));
              arr[1]=rs1.getString("FirstName")+" "+rs1.getString("LastName");
              arr[2]=rs1.getString("finalTotal");
              arr[3]=rs1.getString("createdDate").split(" ")[0];
              invoices.add(arr);
             }
            stmt1.close();rs1.close();
                       
            con.commit();
            con.close();
            
         }
         catch(SQLException e)
         {
            try{con.rollback();
             con.close();
            }catch(Exception e1){}
            
         }
        return invoices;
    }
    
}
