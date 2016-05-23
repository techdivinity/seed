/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.ArrayListOpration;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author divinity
 */
public class CustomerList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try{
        CustomeListDao dao = new CustomeListDao();
        ArrayList<String[]> custInfo=dao.getCustInfo();

            request.setAttribute("custInfo", custInfo);
            request.getRequestDispatcher("customerlist.jsp").forward(request, response);
        
        }catch(Exception e)
        {
            e.printStackTrace(new java.io.PrintWriter(out));
        }
    }


}
