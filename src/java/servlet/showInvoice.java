/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.ShowInvoiceBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ShowInvoiceDao;

/**
 *
 * @author divinity
 */
public class showInvoice extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String invID=request.getParameter("i");
        String d=request.getParameter("d");
        ShowInvoiceDao dao=new ShowInvoiceDao();
        ShowInvoiceBean bean=dao.getInfo(invID);
        
//        out.print(bean.getCreatedDate()+"\n");
//        out.print(bean.getInvID()+"\n");
//        out.print(bean.getFirstName()+"\n");
//        out.print(bean.getLastName()+"\n");
//        out.print(bean.getAddress()+"\n");
//        out.print(bean.getCity()+"\n");
//        out.print(bean.getTotalAmount()+"\n");
//        out.print(bean.getDiscount()+"\n");
//        out.print(bean.getVat()+"\n");
//        out.print(bean.getFinalAmount()+"\n");
//        for(int i=0;i<bean.getItemName().length();i++)
//        {
//            out.print(" "+bean.getItemName()[i]+" "+bean.getPacketSize()[i]+" "+bean.getBatch()[i]+" "+bean.getMFGDate()[i]+" "+bean.getEXPDate()[i]+" "+bean.getPrice()[i]+" "+bean.getQnty()[i]+" "+bean.getTotal()[i]+"\n");
//        }
    
    bean.setInvID(String.format("%06d", Long.parseLong(bean.getInvID())));
    bean.setCreatedDate(bean.getCreatedDate().split(" ")[0]);
    bean.setTotalAmount(String.valueOf(Double.parseDouble(bean.getTotalAmount())));
    bean.setDiscount(String.valueOf(Double.parseDouble(bean.getDiscount())));
    bean.setVat(String.valueOf(Double.parseDouble(bean.getVat())));
    bean.setFinalAmount(String.valueOf(Double.parseDouble(bean.getFinalAmount())));
        
            request.setAttribute("d", d);
            request.setAttribute("invInfo", bean);
            request.getRequestDispatcher("invoicePrint.jsp").forward(request, response);
        
    }

    
    

}
