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
import model.AddCatDao;

/**
 *
 * @author divinity
 */
public class AddCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String cat = request.getParameter("cat");
        try{
            

            AddCatDao dao=new AddCatDao();
            String resultMsg = dao.addCat(cat);
            
            out.print(resultMsg);
        
        
        }catch(Exception e)
        {
            
        }
        
    }

    
}
