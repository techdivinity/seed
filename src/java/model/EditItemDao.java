/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.EditItemBean;
import com.DBConnection;
import com.dateParse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import javax.naming.NamingException;

/**
 *
 * @author divinity
 */
public class EditItemDao {
    public String Edittem(EditItemBean bean) throws NamingException, SQLException
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
            
            String sql2="update item set name=?,packetSize=?,batch=?,mfgDate=?,expDate=?,price=?,totalQnty=? where itemID=? ";
            stmt2 = con.prepareStatement(sql2);
            stmt2.setString(1,bean.getName());
            stmt2.setString(2,bean.getPacketSize());
            stmt2.setString(3,bean.getBatch());
            stmt2.setString(4,mfgDate);
            stmt2.setString(5,expDate);
            stmt2.setString(6,price);
            stmt2.setString(7,qnt);
            stmt2.setString(8,bean.getID());
            stmt2.executeUpdate();
            stmt2.close();con.close();
//                String sql="insert into item values("+bean.getCatID()+","+bean.getSubCatID()+",'"+idOne+"'"
//                        + ",'"+bean.getName()+"','"+bean.getPacketSize()+"','"+bean.getBatch()+"',"+mfgDate+""
//                        + ","+expDate+","+price+","+qnt+")";
//                statement = con.createStatement(); 
//                statement.executeUpdate(sql);
//            
//            statement.close();con.close();
            
            return bean.getID(); 
            
        }
        catch(Exception e)
        {
            try{con.close();}catch(Exception e1){}
//            return String.valueOf(e);
            return "ERROR";
            
        }
    }
    
}
