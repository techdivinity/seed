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
import model.CatPopDao;

/**
 *
 * @author divinity
 */
public class CatDropPopulate extends HttpServlet {
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try{
            
            CatPopDao dao=new CatPopDao();
            ArrayList<String> catsInfo=dao.gatOption();
            for(int i=0;i<catsInfo.size();i++)
            {
                out.print(catsInfo.get(i)+"-"+catsInfo.get(++i)+"/");
            }
            
        
        
        }catch(Exception e)
        {
            
        }
        
    }

    
}
