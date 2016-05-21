/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.AddItemBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AddItemDao;

/**
 *
 * @author divinity
 */
public class AddItem extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        
        String catID = request.getParameter("cat");
        String subCatID = request.getParameter("subcat");
        String name = request.getParameter("name");
        String packetSize = request.getParameter("pktsize");
        String batch = request.getParameter("batch");
        String mfgDate = request.getParameter("mfgdate");
        String expDate = request.getParameter("expdate");
        String price  = request.getParameter("price");
        String qnty= request.getParameter("qnty");
        try{
            
              AddItemBean bean=new AddItemBean();
              bean.setCatID(catID);
              bean.setSubCatID(subCatID);
              bean.setName(name);
              bean.setPacketSize(packetSize);
              bean.setBatch(batch);
              bean.setMfgDate(mfgDate);
              bean.setExpDate(expDate);
              bean.setPrice(price);
              bean.setQnty(qnty);
              
              String result=new AddItemDao().addItem(bean);
              out.print(result);
                if(result.equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
                {
                    session.setAttribute("msg", "SUCCESS");
                    response.sendRedirect("items.jsp");
                }
                else
                {
                    session.setAttribute("msg", "ERROR");
                    response.sendRedirect("items.jsp");
                }
        
        
        }catch(Exception e)
        {
            
        }
        
    }

}
