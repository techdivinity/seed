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
import model.*;

/**
 *
 * @author divinity
 */
public class ShowCustInfo extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String custID=request.getParameter("custID");
        try{
            
            ShowCustInfoDao dao=new ShowCustInfoDao();
            ArrayList<String> custInfo=dao.gatCustInfo(custID);
            for(int i=0;i<custInfo.size();i++)
            {
                out.print(custInfo.get(i)+"/");
            }
          
        }catch(Exception e)
        {
            
        }
        
    }

    
}
