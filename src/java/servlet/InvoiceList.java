/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.InvoiceListDao;

/**
 *
 * @author divinity
 */
public class InvoiceList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try{
        InvoiceListDao dao=new InvoiceListDao();
//        dao.getCatInfo();
        ArrayList<String[]> invoices = dao.getInvoices();
//        out.print(hiIndex);
        for(int i=0;i<invoices.size();i++)
        {
            out.print(invoices.get(i)[0]+" ");
            out.print(invoices.get(i)[1]+" ");
            out.print(invoices.get(i)[2]+" ");
            out.print(invoices.get(i)[3]+" ");
            
            out.print("\n");
        }  
//            request.setAttribute("hiIndex", hiIndex);
            request.setAttribute("invoices", invoices);
            request.getRequestDispatcher("invoiceList.jsp").forward(request, response);
        
        }catch(Exception e)
        {
            e.printStackTrace(new java.io.PrintWriter(out));
        }
    }
}
