/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.AddItemBean;
import com.DBConnection;
import com.dateParse;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import javax.naming.NamingException;
import java.util.UUID;

/**
 *
 * @author divinity
 */
public class AddItemDao 
{
    
    public String addItem(AddItemBean bean) throws NamingException, SQLException
    {
        
            Connection con = null;
            PreparedStatement stmt2=null;
            UUID idOne = UUID.randomUUID();
            String mfgDate=null;
            String expDate=null;
            String price=null;
            String qnt=null;
        try{
            con = DBConnection.createConnection();
            if(!bean.getMfgDate().equals("")){
            mfgDate=dateParse.getMysqlDate(bean.getMfgDate());}
            if(!bean.getExpDate().equals("")){
            expDate=dateParse.getMysqlDate(bean.getExpDate());}
            if(!bean.getPrice().equals("")){
                price=bean.getPrice(); }
            if(!bean.getQnty().equals("")){
                qnt=bean.getQnty(); }
            
            String sql2="insert into item values(?,?,?,?,?,?,?,?,?,?)";
            stmt2 = con.prepareStatement(sql2);
            stmt2.setString(1,bean.getCatID());
            stmt2.setString(2,bean.getSubCatID());
            stmt2.setString(3,String.valueOf(idOne));
            stmt2.setString(4,bean.getName());
            stmt2.setString(5,bean.getPacketSize());
            stmt2.setString(6,bean.getBatch());
            stmt2.setString(7,mfgDate);
            stmt2.setString(8,expDate);
            stmt2.setString(9,price);
            stmt2.setString(10,qnt);
            stmt2.executeUpdate();
            stmt2.close();con.close();
//                String sql="insert into item values("+bean.getCatID()+","+bean.getSubCatID()+",'"+idOne+"'"
//                        + ",'"+bean.getName()+"','"+bean.getPacketSize()+"','"+bean.getBatch()+"',"+mfgDate+""
//                        + ","+expDate+","+price+","+qnt+")";
//                statement = con.createStatement(); 
//                statement.executeUpdate(sql);
//            
//            statement.close();con.close();
            
            return "SUCCESS"; 
            
        }
        catch(Exception e)
        {
            try{con.close();}catch(Exception e1){}
            return String.valueOf(e);
            
        }
    }
    
}
