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
import model.*;

/**
 *
 * @author admin
 */
public class AddCust extends HttpServlet {
      
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
       // String custId = request.getParameter("cat");
        String FirstName = request.getParameter("firstname");
        String LastName =request.getParameter("lastname");
        String phnumber=request.getParameter("phnumber");
        String Address=request.getParameter("address");
        String City=request.getParameter("city");
        String Email=request.getParameter("email");
        String TINNO=request.getParameter("tinno");
        String CSTNO=request.getParameter("cstno");
        try{
            AddCustBean bean = new AddCustBean();
            bean.setFirstName(FirstName);
            bean.setLastName(LastName);
            bean.setphnumber(phnumber);
            bean.setAddress(Address);
            bean.setCity(City);
            bean.setEmail(Email);
            bean.setTINNO(TINNO);
            bean.setCSTNO(CSTNO);

            AddCustDao dao=new AddCustDao();
            String resultMsg = dao.addCust(bean);
            
            out.print(resultMsg);
        
        }catch(Exception e)
        {
            
        }
        
        response.sendRedirect("user/customers.jsp?success=1");
    }
}