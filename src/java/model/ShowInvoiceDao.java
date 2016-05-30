/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.ShowInvoiceBean;
import com.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author divinity
 */
public class ShowInvoiceDao 
{
    public ShowInvoiceBean getInfo(String invID)
    {
        ShowInvoiceBean bean=new ShowInvoiceBean();
        Connection con = null;
        Statement stmt1 = null;
        ResultSet rs1 = null;
        try
         {
            con = DBConnection.createConnection();con.setAutoCommit(false);
            String sql1="select * from invoice, invoiceitems,addcust,item where invoice.invoiceID="+invID+" and invoiceitems.invoiceID="+invID+" and addcust.custID=invoice.custID and item.itemID=invoiceitems.itemID;";
            stmt1 = con.createStatement(); 
            rs1 = stmt1.executeQuery(sql1); 
            
            int i=0;
            while(rs1.next()) 
             {
              bean.setInvID(rs1.getString("invoiceID"));
              bean.setCreatedDate(rs1.getString("createdDate"));
              bean.setFirstName(rs1.getString("FirstName"));
              bean.setLastName(rs1.getString("LastName"));
              bean.setAddress(rs1.getString("Address"));
              bean.setCity(rs1.getString("City"));
              bean.setTotalAmount(rs1.getString("totalAmount"));
              bean.setDiscount(rs1.getString("discount"));
              bean.setVat(rs1.getString("vat"));
              bean.setFinalAmount(rs1.getString("finalTotal"));
              i++;
             }
            String[] itemName=new String[i];
            String[] packetSize=new String[i];
            String[] MFGDate=new String[i];
            String[] EXPDate=new String[i];
            String[] batch=new String[i];
            String[] price=new String[i];
            String[] qnty=new String[i];
            String[] total=new String[i];
            rs1.beforeFirst();
            int j=0;
            while(rs1.next()) 
            {
                itemName[j]=rs1.getString("name");
                packetSize[j]=rs1.getString("packetSize");
                batch[j]=rs1.getString("batch");
                MFGDate[j]=rs1.getString("mfgDate");
                EXPDate[j]=rs1.getString("expDate");
                price[j]=rs1.getString("price");
                qnty[j]=rs1.getString("qnty");
                total[j]=rs1.getString("total");
                j++;
            }
            
            bean.setItemName(itemName);
            bean.setPacketSize(packetSize);
            bean.setBatch(batch);
            bean.setMFGDate(MFGDate);
            bean.setEXPDate(EXPDate);
            bean.setPrice(price);
            bean.setQnty(qnty);
            bean.setTotal(total);
            stmt1.close();rs1.close();
            
            
            con.commit();
            con.close();
            
         }
         catch(Exception e)
         {
            try{con.rollback();
             con.close();
            }catch(Exception e1){}
            
         }
        return bean;
        
    }
    
}
