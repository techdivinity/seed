/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import com.DBConnection;
import com.MD5;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.sql.Statement;
import javax.naming.NamingException;

/**
 *
 * @author divinity
 */
public class LoginDao {
    public String authenticateUser(LoginBean loginBean) throws NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, SQLException
 {
 
    String userName = loginBean.getUserName(); //Keeping user entered values in temporary variables.
    String password = loginBean.getPassword();

    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;

    String userNameDB = "";
    String passwordDB = "";

    try
     {
        con = DBConnection.createConnection();
        statement = con.createStatement(); 
        resultSet = statement.executeQuery("select name,password from user"); 

        while(resultSet.next()) 
         {
          userNameDB = resultSet.getString("name"); 
          passwordDB = resultSet.getString("password");
         }
        statement.close();resultSet.close();con.close();
        if(userName.equals(userNameDB) && passwordDB.equals(new MD5().getpass(password)))
        {
            return "SUCCESS"; 
        }
     }
     catch(SQLException e)
     {
        try{
         con.close();
        }catch(Exception e1){}
        return String.valueOf(e);
     }
     return "Invalid user credentials"; // Just returning appropriate message otherwise
  }
    
}
