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
public class ShowCustomItems extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String ID=request.getParameter("ID");
        String type=request.getParameter("type");
        if(type.equals("subCat"))
        {
            try{
                ShowCustomItemDao dao=new ShowCustomItemDao();
                ArrayList<String> itemInfo=dao.gatCustomItems(ID);
                for(int i=0;i<itemInfo.size();i++)
                {
                    out.print(itemInfo.get(i)+"~"+itemInfo.get(++i)+"/");
                }

            }catch(Exception e)
            {

            }
        }
        else if(type.equals("item"))
        {
            try{
                ShowItemDetailsDao dao=new ShowItemDetailsDao();
                ArrayList<String> itemInfo=dao.gatItemDetails(ID);
                for(int i=0;i<itemInfo.size();i++)
                {
                    out.print(itemInfo.get(i)+"~");
                }
//                    out.print("ABC~DEF");
            }catch(Exception e)
            {

            }
        }
        
    }

    
}
