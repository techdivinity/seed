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
 * @author divinity
 */
public class AddSubCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String catID = request.getParameter("cat");
        String subCatName = request.getParameter("subcat");
        try{
            AddSubCatBean bean = new AddSubCatBean();
            bean.setCatID(catID);
            bean.setSubCatName(subCatName);

            AddSubCatDao dao=new AddSubCatDao();
            String resultMsg = dao.addSubCat(bean);
            
            out.print(resultMsg);
        
        
        }catch(Exception e)
        {
            
        }
        
    }

    

}
