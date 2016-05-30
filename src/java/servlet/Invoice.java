/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.InvoiceBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InvoiceDao;

/**
 *
 * @author divinity
 */
public class Invoice extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        
        String custID = request.getParameter("cust");
        String totalAmount = request.getParameter("totalAmount");
        String discount = request.getParameter("discount");
        String vat = request.getParameter("vat");
        String finalAmount = request.getParameter("finalTotal");
        String[] itemIds=request.getParameterValues("itemID");
        String[] price=request.getParameterValues("price");
        String[] qnty=request.getParameterValues("qnty");
        String[] total=request.getParameterValues("total");
        
//        out.print("custID="+custID+" toalAmount="+totalAmount+" disCount="+discount+" vat="+vat+" FinalAmount="+finalAmount+"\n");
//        for(int i=0;i<itemIds.length;i++)
//        {
//            out.print(" itemID="+itemIds[i]+" price="+price[i]+" qnty="+qnty[i]+" total="+total[i]+"\n");
//        }
        
        try{
            InvoiceBean bean = new InvoiceBean();
            bean.setCustID(custID);
            bean.setTotalAmount(totalAmount);
            bean.setDiscount(discount);
            bean.setVat(vat);
            bean.setFinalAmount(finalAmount);
            bean.setItemIds(itemIds);
            bean.setPrice(price);
            bean.setQnty(qnty);
            bean.setTotal(total);

            InvoiceDao dao=new InvoiceDao();
            long invID = dao.addIncoice(bean);
            if(invID== -5) //If function returns success string then user will be rooted to Home page
            {
                session.setAttribute("msg", "ERROR");
                response.sendRedirect("invoice.jsp");
            }
            else
            {
                session.setAttribute("msg", "SUCCESS");
                session.setAttribute("val", invID);
                response.sendRedirect("invoice.jsp");
            }
            

        
        
        }catch(Exception e)
        {
            
        }
        
    }

}
