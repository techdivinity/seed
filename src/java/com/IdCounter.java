/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;

/**
 *
 * @author divinity
 */
public class IdCounter {

    public static synchronized long getInvoiceID() throws NamingException
    {
        long id=-1;
        Connection con = null;
        Statement stmt1 = null;
        Statement stmt2 = null;
        ResultSet rs1 = null;
        try
        {
            con = DBConnection.createConnection();
            String sql="SELECT invoiceID FROM invoiceno";
            stmt1 = con.createStatement(); 
            rs1 = stmt1.executeQuery(sql); 
            while(rs1.next()) 
            { 
                id=rs1.getLong("invoiceID");
            }
            stmt1.close();rs1.close();
            ++id;
            String sql2="update invoiceno set invoiceID="+id;
            stmt2 = con.createStatement(); 
            stmt2.executeUpdate(sql2); 
            stmt2.close();con.close();
            return id; 
        }
        catch(SQLException e)
        {
            try{
            con.close();}catch(Exception e1){}
           //return String.valueOf(e);
           return -1;
        }
    }
    
}
