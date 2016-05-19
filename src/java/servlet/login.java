/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginBean;
import model.LoginDao;

/**
 *
 * @author divinity
 */
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession(true);
        try{
            LoginBean loginBean = new LoginBean();
            loginBean.setUserName(userName);
            loginBean.setPassword(password);

            LoginDao loginDao = new LoginDao();
            String userValidate = loginDao.authenticateUser(loginBean); 
            out.printf(userValidate);
            if(userValidate.equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
            {
                session.setAttribute("user", userName);
                response.sendRedirect("user/home.jsp");
            }
            else
            {
                request.setAttribute("errMessage", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
                request.getRequestDispatcher("/login.jsp").forward(request, response);//forwarding the request
            }
        
        
        }catch(Exception e)
        {
            e.printStackTrace(new java.io.PrintWriter(out));
        }
    }


}
