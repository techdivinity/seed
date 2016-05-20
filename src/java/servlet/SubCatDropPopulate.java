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
public class SubCatDropPopulate extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String catID=request.getParameter("cat");
        try{
            
            SubCatPopDao dao=new SubCatPopDao();
            ArrayList<String> subcatsInfo=dao.gatOption(catID);
            for(int i=0;i<subcatsInfo.size();i++)
            {
                out.print(subcatsInfo.get(i)+"-"+subcatsInfo.get(++i)+"/");
            }
            
        
        
        }catch(Exception e)
        {
            
        }
        
    }

    
}
