/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import beans.EditItemBean;
import model.EditItemDao;

/**
 *
 * @author divinity
 */
public class EditItem extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        
        String ID = request.getParameter("id");
        String name = request.getParameter("name");
        String packetSize = request.getParameter("pktsize");
        String batch = request.getParameter("batch");
        String mfgDate = request.getParameter("mfgdate");
        String expDate = request.getParameter("expdate");
        String price  = request.getParameter("price");
        String qnty= request.getParameter("qnty");
        try{
            
              EditItemBean bean=new EditItemBean();
              bean.setID(ID);
              bean.setName(name);
              bean.setPacketSize(packetSize);
              bean.setBatch(batch);
              bean.setMfgDate(mfgDate);
              bean.setExpDate(expDate);
              bean.setPrice(price);
              bean.setQnty(qnty);
              
              String result=new EditItemDao().Edittem(bean);
              out.print(result);
                if(result.equals("ERROR")) //If function returns success string then user will be rooted to Home page
                {
                    session.setAttribute("msg", "ERROR");
                    response.sendRedirect("editItem.jsp?i=error");
                }
                else
                {
                    session.setAttribute("msg", "SUCCESS");
                    response.sendRedirect("editItem.jsp?i="+result);
                }
        
        
        }catch(Exception e)
        {
            
        }
        
    }
}
