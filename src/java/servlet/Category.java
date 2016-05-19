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
public class Category extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try{
        CatNSubCatDao dao=new CatNSubCatDao();
//        dao.getCatInfo();
        ArrayList<ArrayList<String>> cats=dao.getCatInfo();
        int hiIndex=new ArrayListOpration().getHighestIndexOfLists(cats);
//        out.print(hiIndex);
//        for(int i=0;i<cats.size();i++)
//        {
//            for(int j=0;j<cats.get(i).size();j++)
//            {
//                try{
//                out.print(cats.get(i).get(j)+" ");
//                }catch(Exception e){}
//            }
//            out.print("<br>");
//        }  
            request.setAttribute("hiIndex", hiIndex);
            request.setAttribute("catsInfo", cats);
            request.getRequestDispatcher("category.jsp").forward(request, response);
        
        }catch(Exception e)
        {
            e.printStackTrace(new java.io.PrintWriter(out));
        }
    }

    
}
